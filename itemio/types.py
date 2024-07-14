from nbtlib import CompoundSchema
from nbtlib.tag import (
    Base,
    Byte,
    Short,
    Int,
    Long,
    Float,
    Double,
    String,
    List,
    Compound,
)
from itemio.utils import LiteralTag, minecraft_tag_list, minecraft_tag_dict
from typing import TypedDict, Literal, Any, Optional


class CTCFilter(CompoundSchema):
    schema = {
        "id": String,
        "from": String,
    }
    typeddict = TypedDict("typeddict", {
        "id": str,
        "from": str,
    })
    strict = True
    def __init__(self, value : typeddict): super().__init__(value)

class SmithedID(CompoundSchema):
    schema = {
        "id": List[String], # List of smithed ids (for custom items), ORed together
    }
    typeddict = TypedDict("typeddict", {
        "id": Optional[list[str]],
    })
    strict = False
    def __init__(self, value : typeddict): super().__init__(value)


class MinecraftFilter(CompoundSchema):
    """
    Check if an the item is in a item tag
    """
    schema = {tag: LiteralTag[Byte][1,] for tag in minecraft_tag_list}
    typeddict = minecraft_tag_dict
    strict = False
    def __init__(self, value : typeddict): super().__init__(value)

class Filter(CompoundSchema):
    """
    Filter schema, a filter is ANDed with all it's values
    """
    schema = {
        "id": List[String], # List of item ids, ORed together
        "energy": LiteralTag[Byte][1], # if exists, verify if the item can store energy
        "ctc": List[CTCFilter], # List of CTC filters (for custom items), ORed together
        "smithed": SmithedID,
        "merge": Compound, # Merge the filter on the item, if the item does'nt change, the filter is valid
        "minecraft": MinecraftFilter,
        "item_predicate": String, # Check the item with a the item predicate specified
    }
    typeddict = TypedDict("typeddict", {
        "id": Optional[list[str]],
        "energy": Optional[int],
        "ctc": Optional[list[CTCFilter.typeddict]],
        "smithed": Optional[SmithedID.typeddict],
        "merge": Optional[dict[Any, Any]],
        "minecraft": Optional[MinecraftFilter.typeddict],
        "item_predicate": Optional[str],
    })
    strict = False
    def __init__(self, value : typeddict): super().__init__(value)
                

class AllowedSide(CompoundSchema):
    schema = {
        "north": LiteralTag[Byte][0, 1],
        "south": LiteralTag[Byte][0, 1],
        "east": LiteralTag[Byte][0, 1],
        "west": LiteralTag[Byte][0, 1],
        "top": LiteralTag[Byte][0, 1],
        "bottom": LiteralTag[Byte][0, 1],
    }
    typeddict = TypedDict("typeddict", {
        "north": Literal[0, 1],
        "south": Literal[0, 1],
        "east": Literal[0, 1],
        "west": Literal[0, 1],
        "top": Literal[0, 1],
        "bottom": Literal[0, 1],
    })
    strict = True
    def __init__(self, value : typeddict): super().__init__(value)


class SlotConfig(CompoundSchema):
    schema = {
        "Slot": Byte,
        "mode": LiteralTag[String]["input", "output", "both"],
        "allowed_side": AllowedSide,
        "filters": List[Filter]
    }
    typeddict = TypedDict("typeddict", {
        "Slot": int,
        "mode": Literal["input", "output", "both"],
        "allowed_side": AllowedSide.typeddict,
        "filters": Optional[list[Filter.typeddict]]
    })
    strict = True
    def __init__(self, value : typeddict): super().__init__(value)

class ItemIO(CompoundSchema):
    schema = {
        "ioconfig": List[SlotConfig],
        "ioconfig_from_storage": String,
        "nbt_items_path": String
    }
    typeddict = TypedDict("typeddict", {
        "ioconfig": list[SlotConfig.typeddict]
    })
    strict = False
    def __init__(self, value : typeddict): super().__init__(value)

if __name__ == "__main__":
    from nbtlib import serialize_tag
    test = ItemIO({
        'ioconfig': [{
            'Slot': 25,
            "filters": [{
                "ctc": {
                    "from": "",
                    "id": "525"
                }
            }]
        }]
    })
    print(serialize_tag(test))
