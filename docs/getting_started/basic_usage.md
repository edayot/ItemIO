# 📚 Basic Usage



```python
from pydantic import BaseModel
from pydantic_persistence import PersistenceModel

class User(BaseModel):
    name: str
    age: int
```