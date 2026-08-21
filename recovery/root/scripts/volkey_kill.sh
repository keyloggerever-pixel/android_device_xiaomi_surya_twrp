#!/sbin/sh
# Press VOLUP+VOLDOWN for 3s then killall recovery
VOLDIR=$(ls -1d /dev/input/event* 2>/dev/null | head -1)
[ -z "$VOLDIR" ] && exit 1
i=0
while [ $i -lt 30 ]; do
  sendevent $VOLDIR 1 115 1
  sendevent $VOLDIR 1 116 1
  sendevent $VOLDIR 0 0 0
  sleep 0.1
  i=$((i+1))
done
sendevent $VOLDIR 1 115 0
sendevent $VOLDIR 1 116 0
sendevent $VOLDIR 0 0 0
killall recovery
