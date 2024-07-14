
from beet import Predicate, Context


def get_predicates(offset):
    predicate_hopper_X = [
        {
            "condition": "minecraft:any_of",
            "terms": [
                {
                    "condition": "minecraft:location_check",
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
                    "condition": "minecraft:location_check",
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
                    "condition": "minecraft:location_check",
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
                    "condition": "minecraft:location_check",
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
                    "condition": "minecraft:location_check",
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
                    "condition": "minecraft:location_check",
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
            "condition": "minecraft:any_of",
            "terms": [
                {
                    "condition": "minecraft:location_check",
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
                    "condition": "minecraft:location_check",
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
                    "condition": "minecraft:location_check",
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
                    "condition": "minecraft:location_check",
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
                    "condition": "minecraft:location_check",
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
                    "condition": "minecraft:location_check",
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

    ctx.data.predicates[f"itemio:impl/container/hopper_x_plus_{offset}"] = Predicate(predicate_hopper_X)
    ctx.data.predicates[f"itemio:impl/container/hopper_z_plus_{offset}"] = Predicate(predicate_hopper_Z)

    predicate_hopper_X, predicate_hopper_Z = get_predicates(-offset)

    ctx.data.predicates[f"itemio:impl/container/hopper_x_minus_{offset}"] = Predicate(predicate_hopper_X)
    ctx.data.predicates[f"itemio:impl/container/hopper_z_minus_{offset}"] = Predicate(predicate_hopper_Z)

    return predicate_hopper_X, predicate_hopper_Z