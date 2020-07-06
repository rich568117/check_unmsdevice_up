URL="https://unmsserver.domain.com/nms/api/v2.1/devices/$1"
curl -sS -X GET $URL -H "accept: application/json" -H "x-auth-token: YOURAPIKEY" | jq -r '.overview.status' > unmsrawoutput.txt 
curl -sS -X GET $URL -H "accept: application/json" -H "x-auth-token: YOURAPIKEY" | jq -r '.identification.name' > unmsname.txt 

result=$(cat unmsrawoutput.txt)
devicename=$(cat unmsname.txt)

check_unms(){

case $result in
 ['"disconnected"']*)
 echo "CRITICAL - $1 is offline."
 exit 3
 ;;
 *)
 echo "OK - $1 is online."
 exit 0
 ;;
 esac
}

check_unms $devicename
