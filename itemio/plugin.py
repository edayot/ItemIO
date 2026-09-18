
from beet import Predicate, Context


def single(terms):
    """A 26.3 predicate file holds one condition, not a list of them"""

    return terms[0] if len(terms) == 1 else {"type": "minecraft:all_of", "terms": terms}



def get_predicates(offset):
    predicate_hopper_X = [
        {
            "type": "minecraft:any_of",
            "terms": [
                {
                    "type": "minecraft:location_check",
                    "offsetY": -1,
                    "offsetX": offset,
                    "predicate": {
                        "block": {
                            "blocks": [
                                "minecraft:hopper"
                            ]
                        }
                    }
                },
                {
                    "type": "minecraft:location_check",
                    "offsetY": 1,
                    "offsetX": offset,
                    "facing": "down",
                    "predicate": {
                        "block": {
                            "blocks": [
                                "minecraft:hopper"
                            ],
                            "state": {
                                "facing": "down"
                            }
                        }
                    }
                },
                {
                    "type": "minecraft:location_check",
                    "offsetZ": -1,
                    "offsetX": offset,
                    "facing": "south",
                    "predicate": {
                        "block": {
                            "blocks": [
                                "minecraft:hopper"
                            ],
                            "state": {
                                "facing": "south"
                            }
                        }
                    }
                },
                {
                    "type": "minecraft:location_check",
                    "offsetZ": 1,
                    "offsetX": offset,
                    "facing": "north",
                    "predicate": {
                        "block": {
                            "blocks": [
                                "minecraft:hopper"
                            ],
                            "state": {
                                "facing": "north"
                            }
                        }
                    }
                },
                {
                    "type": "minecraft:location_check",
                    "offsetX": -1 + offset,
                    "facing": "east",
                    "predicate": {
                        "block": {
                            "blocks": [
                                "minecraft:hopper"
                            ],
                            "state": {
                                "facing": "east"
                            }
                        }
                    }
                },
                {
                    "type": "minecraft:location_check",
                    "offsetX": 1 + offset,
                    "facing": "west",
                    "predicate": {
                        "block": {
                            "blocks": [
                                "minecraft:hopper"
                            ],
                            "state": {
                                "facing": "west"
                            }
                        }
                    }
                }
            ]
        }
    ]
    predicate_hopper_Z = [
        {
            "type": "minecraft:any_of",
            "terms": [
                {
                    "type": "minecraft:location_check",
                    "offsetY": -1,
                    "offsetZ": offset,
                    "predicate": {
                        "block": {
                            "blocks": [
                                "minecraft:hopper"
                            ]
                        }
                    }
                },
                {
                    "type": "minecraft:location_check",
                    "offsetY": 1,
                    "offsetZ": offset,
                    "facing": "down",
                    "predicate": {
                        "block": {
                            "blocks": [
                                "minecraft:hopper"
                            ],
                            "state": {
                                "facing": "down"
                            }
                        }
                    }
                },
                {
                    "type": "minecraft:location_check",
                    "offsetZ": -1 + offset,
                    
                    "facing": "south",
                    "predicate": {
                        "block": {
                            "blocks": [
                                "minecraft:hopper"
                            ],
                            "state": {
                                "facing": "south"
                            }
                        }
                    }
                },
                {
                    "type": "minecraft:location_check",
                    "offsetZ": 1 + offset,
                    "facing": "north",
                    "predicate": {
                        "block": {
                            "blocks": [
                                "minecraft:hopper"
                            ],
                            "state": {
                                "facing": "north"
                            }
                        }
                    }
                },
                {
                    "type": "minecraft:location_check",
                    "offsetX": -1,
                    "offsetZ": offset,
                    "facing": "east",
                    "predicate": {
                        "block": {
                            "blocks": [
                                "minecraft:hopper"
                            ],
                            "state": {
                                "facing": "east"
                            }
                        }
                    }
                },
                {
                    "type": "minecraft:location_check",
                    "offsetX": 1,
                    "offsetZ": offset,
                    "facing": "west",
                    "predicate": {
                        "block": {
                            "blocks": [
                                "minecraft:hopper"
                            ],
                            "state": {
                                "facing": "west"
                            }
                        }
                    }
                }
            ]
        }
    ]
    return predicate_hopper_X, predicate_hopper_Z
def generate_predicates(ctx : Context, offset):
    
    predicate_hopper_X, predicate_hopper_Z = get_predicates(offset)

    ctx.data.predicates[f"itemio:impl/container/hopper_x_plus_{offset}"] = Predicate(single(predicate_hopper_X))
    ctx.data.predicates[f"itemio:impl/container/hopper_z_plus_{offset}"] = Predicate(single(predicate_hopper_Z))

    predicate_hopper_X, predicate_hopper_Z = get_predicates(-offset)

    ctx.data.predicates[f"itemio:impl/container/hopper_x_minus_{offset}"] = Predicate(single(predicate_hopper_X))
    ctx.data.predicates[f"itemio:impl/container/hopper_z_minus_{offset}"] = Predicate(single(predicate_hopper_Z))

    return predicate_hopper_X, predicate_hopper_Z