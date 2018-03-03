#!/bin/bash

BASE_DOWNLOAD_URL="https://s3.amazonaws.com/Minecraft.Download/versions/"
VERSION_INFO_URL="https://launchermeta.mojang.com/mc/game/version_manifast.json"

function query_latest_release() {
	curl -s "$VERSION_INFO_URL" | jq -r '.latest.release'
}

function query_latest_snapshot() {
	curl -s "$VERSION_INFO_URL" | jq -r '.latest.snapshot'
}

function download_version() {
	local version="$1"
	local url="${BASE_DOWNLOAD_URL}${version}/minecraft_server.${version}.jar"
	curl -s -o "minecraft_server.jar" $url
}

