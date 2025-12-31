from typing import Any, ClassVar, Literal
import warnings

from beet import Context, ListOption, PathSpecOption
from beet.contrib.rename_files import RenderRenameOption, TextRenameOption
from pydantic import BaseModel, ConfigDict, Field, RootModel, field_validator, model_validator

from .types import JsonDict, JsonType

# Suppress Pydantic serialization warnings for beet's custom types
warnings.filterwarnings("ignore", message=".*Pydantic serializer warnings.*", category=UserWarning)


class ContextualModel(BaseModel):
    model_config = ConfigDict(arbitrary_types_allowed=True)
    
    ctx: ClassVar[Context]


class Version(RootModel[dict[str, int]]):
    """Provides methods and fields for the version for ease of use"""

    @classmethod
    def from_parts(cls, names: list[str], ctx: Context):
        numbers = [int(num) for num in ctx.project_version.split(".")]
        combined = dict(zip(names, numbers))

        if len(combined) != len(numbers) or len(combined) != len(names):
            raise ValueError(
                f"The schema: {names!r} does not match the version {ctx.project_version!r}"
            )

        return cls(root=combined)

    @model_validator(mode="after")
    def ensure_version_parts(self):
        for name, number in self.root.items():
            if number < 0:
                raise ValueError(f"{name} had an invalid version value: {number}")

        return self

    def named_parts(self):
        return list(self.root.items())

    def __str__(self):
        return ".".join(str(value) for value in self.root.values())


class VersioningOptions(ContextualModel):
    """The `versioning` config of `beet.yaml`"""

    model_config = ConfigDict(extra="forbid")

    class LanternLoadOptions(ContextualModel):
        step: Literal["pre_load", "load", "post_load"] = "load"
        tag_path: str = "load"
        function_path: str = "impl/load"

    class ApiOptions(ContextualModel):
        match: PathSpecOption = "{{ project_id }}:v{{ version }}/*"  # type: ignore
        implementation_prefix: str = "{{ project_id }}:v{{ version }}/"
        version_check_path: str = "v{{ version }}/calls"
        tag_path: str = ""

    scoreholder: str = "#itemio"
    schema_: list[str] = Field(default=["major", "minor", "patch"], alias="schema")
    scheduled_paths: ListOption[str] = ListOption(__root__=["impl/tick"])
    version: Version | None = None
    refactor: TextRenameOption | RenderRenameOption = {
        "match": "{{ project_id }}:*",
        "find": "{{ project_id }}:impl/",
        "replace": "{{ project_id }}:impl/v{{ version }}/",
    }  # type: ignore
    lantern_load: LanternLoadOptions = LanternLoadOptions()
    api: ApiOptions = ApiOptions()

    @property
    def namespace(self):
        return self.ctx.project_id

    @classmethod
    def render(cls, value: str, values: dict[str, Any]):
        return cls.ctx.template.render_string(value, **values)

    @model_validator(mode="after")
    def init_version(self):
        if self.version is None:
            self.version = Version.from_parts(self.schema_, self.ctx)
        return self

    @classmethod
    def render_value(cls, val: JsonType, all_values: JsonDict) -> JsonType:
        match val:
            case str(value):
                return cls.render(value, all_values)

            case list(vals):
                return [cls.render_value(val, all_values) for val in vals]

            case dict(vals):
                return {
                    key: cls.render_value(val, all_values) for key, val in vals.items()
                }

            case _ as val:
                return val

    @model_validator(mode="before")
    @classmethod
    def render_all(cls, data: Any):
        """This validator handles the rendering of all structures inside

        In Pydantic V2, we would likely try to generalize this behavior in `beet`.
        For now, we have to match every key-value in our values dict to figure out
         if the string or string within needs to be rendered.
        """
        if not isinstance(data, dict):
            return data
        
        return {key: cls.render_value(value, all_values=data) for key, value in data.items()}


class Versioning:
    opts: VersioningOptions

    def __init__(self, ctx: Context):
        self.opts = ctx.validate("smithed.versioning", VersioningOptions)
