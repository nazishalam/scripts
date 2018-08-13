#!/bin/sh

DESTDIR=172.16.0.105:/home/jangi

LOCALDIR=/home/nazish

#tom=ssh -o StrictHostKeyChecking=no -l root 172.16.0.105


find $LOCALDIR -iname "*.txt"

if [ ! -d "$DESTDIR" ]

then
    echo "Creating directory"

    ssh root@172.16.0.105  "mkdir /home/jangi"

    if [ $? -ne 0 ]
then
    echo "Dont create '$DESTDIR' exiting"
    exit 1
   fi
fi

#ssh -o StrictHostKeyChecking=no -l root 172.16.0.105

rsync -avzP --exclude '*.txt' "$LOCALDIR" -e ssh "$DESTDIR"

result=$?

if [ $result -ne 0 ]
then
    echo "error"
else 	
    echo "data moved"
fi

