URL="https://unmsserver.domain.com/nms/api/v2.1/devices/$1"
curl -sS -X GET $URL -H "accept: application/json" -H "x-auth-token: YOURAPIKEY" | jq -r '.overview.status' > unmsrawoutput.txt 
curl -sS -X GET $URL -H "accept: application/json" -H "x-auth-token: YOURAPIKEY" | jq -r '.identification.name' > unmsname.txt 

result=$(cat unmsrawoutput.txt)
devicename=$(cat unmsname.txt)

check_unms(){

if [ "$result" -gt "80" ]
then
echo "CRITICAL - $1 has high CPU usage."
 exit 3
 ;;
else
echo "OK - $1 CPU is under threshold."
 exit 0
 ;;
 fi
}

check_unms $devicename
