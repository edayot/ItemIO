import json
from os import access
import shutil
import git
import zipfile



def change_version(version):
    v=version[1:].split(".")
    major=v[0]
    minor=v[1]
    patch=v[2]
    with open("ItemIO DataPack/data/itemio/functions/print_version.mcfunction","w") as f:
        f.write('tellraw @s [{"text":"[Loaded ItemIO ","color":"green"},{"text":"'+version+']","color":"green"}]')
    
    with open("ItemIO DataPack/data/itemio/functions/set_version.mcfunction","w") as f:
        f.write("""scoreboard players set #itemio.major load.status {}
scoreboard players set #itemio.minor load.status {}
scoreboard players set #itemio.patch load.status {}
            """.format(major,minor,patch))
        

    with open("ItemIO DataPack/pack.mcmeta","w") as f:
        pack={
            "pack":{
                "pack_format":10,
                "description":"§aItemIO DataPack "+version
            }
        }
        json.dump(pack,f, indent = 4)
    with open("ItemIO ResourcePack/pack.mcmeta","w") as f:
        pack={
            "pack":{
                "pack_format":9,
                "description":"§aItemIO ResourcePack "+version
            }
        }
        json.dump(pack,f, indent = 4)
    
    with open("ItemIO DataPack/data/global/advancements/airdox_/itemio.json","w") as f:
        pack={
        "display": {
            "title": "ItemIO",
            "description": version,
            "icon": {
                "item": "minecraft:beehive",
                "nbt": "{CustomModelData:1430000}"
            },
            "announce_to_chat": False,
            "show_toast": False
        },
        "parent": "global:airdox_/root",
        "criteria": {
            "trigger": {
                "trigger": "minecraft:tick"
            }
        }
    }
        json.dump(pack,f, indent = 4)

def create_zip(version):     
    #create zip file
    shutil.make_archive("release/ItemIO_DataPack_"+version, "zip", "ItemIO DataPack")
    shutil.make_archive("release/ItemIO_ResourcePack_"+version, "zip", "ItemIO ResourcePack")

    
    

    




def git_push(version):
    r = git.Repo.init("")
    r.index.add("ItemIO DataPack/pack.mcmeta")
    r.index.add("ItemIO ResourcePack/pack.mcmeta")
    r.index.add("ItemIO DataPack/data/itemio/functions/print_version.mcfunction")
    r.index.add("ItemIO DataPack/data/itemio/functions/set_version.mcfunction")
    r.index.add("ItemIO DataPack/data/global/advancements/airdox_/itemio.json")

    r.index.commit("[AUTO] updated to "+version)
    r.remote("origin").push()




if __name__=="__main__" and False:
    version=input("Please select a version tag : ")
    if len(version)>0:
        check=input("The version tag is "+version+" confirm [y/n]")
        if check=="y":
            change_version(version)
            git_push(version)
            create_zip(version)