#!/bin/bash
URL="https://asd-uisp.asd103.org/nms/api/v2.1/devices/$1"
curl --insecure -sS -X GET $URL -H "accept: application/json" -H "x-auth-token: 460d3a3f-1d99-4c00-a3ff-9e7c81800eae" | jq -r '.overview.cpu' > unmsrawoutput.txt
curl --insecure -sS -X GET $URL -H "accept: application/json" -H "x-auth-token: 460d3a3f-1d99-4c00-a3ff-9e7c81800eae" | jq -r '.identification.name' > unmsname.txt

#result=$(cat unmsrawoutput.txt)
devicename=$(cat unmsname.txt)
result=$(($(cat unmsrawoutput.txt) +0))
echo $result
#echo $devicename

if [[ $result -gt $2 ]]
then
echo "CRITICAL - $devicename has high CPU usage."
 exit 3

else
echo "OK - $devicename CPU is under threshold."
 exit 0

 fi
