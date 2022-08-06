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
    with open("__name__ DataPack/data/__namespace__/functions/print_version.mcfunction","w") as f:
        f.write('tellraw @s [{"translate":"__namespace__.load","color":"green"},{"text":"'+version+']","color":"green"}]')
    
    with open("__name__ DataPack/data/__namespace__/functions/set_version.mcfunction","w") as f:
        f.write("""scoreboard players set #__namespace__.major load.status {}
scoreboard players set #__namespace__.minor load.status {}
scoreboard players set #__namespace__.patch load.status {}
            """.format(major,minor,patch))
        

    with open("__name__ DataPack/pack.mcmeta","w") as f:
        pack={
            "pack":{
                "pack_format":10,
                "description":"§a__name__ DataPack "+version
            }
        }
        json.dump(pack,f, indent = 4)
    with open("__name__ ResourcePack/pack.mcmeta","w") as f:
        pack={
            "pack":{
                "pack_format":9,
                "description":"§a__name__ ResourcePack "+version
            }
        }
        json.dump(pack,f, indent = 4)
    
    with open("__name__ DataPack/data/global/advancements/airdox_/__namespace__.json","w") as f:
        pack={
        "display": {
            "title": "__name__",
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
    shutil.make_archive("release/__name___DataPack_"+version, "zip", "__name__ DataPack")
    shutil.make_archive("release/__name___ResourcePack_"+version, "zip", "__name__ ResourcePack")

    
    

    




def git_push(version):
    r = git.Repo.init("")
    r.index.add("__name__ DataPack/pack.mcmeta")
    r.index.add("__name__ ResourcePack/pack.mcmeta")
    r.index.add("__name__ DataPack/data/__namespace__/functions/print_version.mcfunction")
    r.index.add("__name__ DataPack/data/__namespace__/functions/set_version.mcfunction")
    r.index.add("__name__ DataPack/data/global/advancements/airdox_/__namespace__.json")

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