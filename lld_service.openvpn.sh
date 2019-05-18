#!/bin/bash

if [[ -z "$1" ]]; then
  exit 1
fi

openvpn_discovery="$(ps aux | grep openvpn | awk '{print $15}' | sed 's/.conf//g' | sed '/^$/d;s/[[:blank:]]//g')"

case "$1" in
  discovery)
    declare -a services
    n=0
    for i in $openvpn_discovery ; do
      services[$n]="$i"
      let "n= $n + 1"
    done

    length=${#services[@]}
    echo "{"
    echo -e "\"data\":[\n"
    for (( i=0; i<${length}; i++ ))
    do
      if [ $(( $i + 1 )) -lt $length ]; then
        echo -e "\t{ \"{#OPENVPNSERVICE}\":\"${services[$i]}\" },"
      else
        echo -e "\t{ \"{#OPENVPNSERVICE}\":\"${services[$i]}\" }"
      fi
    done
    echo -e "\n\t]\n"
    echo "}"
  exit 0;
  ;;
  *)

  if [ $1 = "" ]; then
    echo "ERROR: argument required"
    exit 1
  fi

  state="$(systemctl status openvpn@$1 | grep running | wc -l)"

  if [ "$state" == "1" ]; then
    echo 1
  else
    echo 0
  fi
  ;;
esac

exit 0;