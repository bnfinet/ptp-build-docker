#!/bin/bash

NAME=lede-build
IMAGE=bfoote/lede
HOST=${NAME}

# change dir to where this script is running
SCRIPT=$(readlink -f "$0")
SDIR=$(dirname "$SCRIPT")
cd $SDIR


if [ "$(docker ps | grep $NAME)" ]; then
    docker stop $NAME;
    docker rm -v $NAME;
fi

if [ ! -e ./volumes/.config ]; then
  touch ./volumes/.config;
fi

DCMD="/bin/bash";
if [ "" != "$1" ];
then
    DCMD=$*;
fi

CMD="docker run 
       --rm -i -t 
       --name ${NAME}
       -h ${HOST} 
       -v ${SDIR}/volumes/.config:/opt/lede/.config
       -v ${SDIR}/volumes/tmp:/opt/lede/tmp
       -v ${SDIR}/volumes/bin:/opt/lede/bin
        ${RUNARGS}
        ${IMAGE} 
        ${DCMD}
";

echo $CMD;
$CMD;

