


import yaml
import requests
import json
import os


SMITHED_UID = os.environ['SMITHED_UID']
SMITHED_TOKEN = os.environ['SMITHED_TOKEN']
CURRENT_VERSION = os.environ['CURRENT_VERSION']



beet = yaml.safe_load(open("../../beet.yaml"))

beet["id"]



post_url = (
    "https://api.smithed.dev/v2/packs/"
    f"{beet['id']}/versions"
    f"?token={SMITHED_TOKEN}"
    f"&version={CURRENT_VERSION}"
)


download_url = (
    "https://github.com/edayot/"
    f"{beet['name']}/releases/download/"
    f"v{CURRENT_VERSION}/"
    f"{beet['name']}-v{CURRENT_VERSION}-{ziptype}.zip"
)

try:
    dep = beet['meta']['smithed_dependencies']
except KeyError:
    dep = []


pack_version = {
  "name": beet['name'],
  "downloads": {},
  "supports": beet['supports'],
  "dependencies": dep,
}

if "datapack" in beet:
    pack_version["downloads"]["datapack"] = download_url.format(ziptype="Datapack")
if "resourcepack" in beet:
    pack_version["downloads"]["resourcepack"] = download_url.format(ziptype="Resourcepack")


response = requests.post(
    url=post_url,
    headers={"Content-Type": "application/json"},
    data=json.dumps(pack_version)
)

print(response.status_code)
