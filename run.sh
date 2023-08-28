#!/bin/bash
set -e

src_dir=$1
shift 1

IMAGE=$IMAGE
VOLUME=$VOLUME

docker container run --rm \
	--mount source="$VOLUME",target=/root/.m2 \
	-v "$(docker4gis/bind.sh "$src_dir" /src)" \
	"$IMAGE" maven "$@"
