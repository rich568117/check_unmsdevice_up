# check_unmsdevice_up
```
Bash script to check the status of a router in UNMS using the UNMS API v2.1
``` 
More information on the UNMS API can be found here: https://unms.docs.apiary.io/#
# Usage:
```
check_unmsdevice_up <DEVICEGUID>
```
# Output: 
```
exit 0 outputs: "OK - <DEVICE NAME> is online."
exit 3 outputs: "CRITICAL - <DEVICE NAME> is offline."
```
 
# Nagios Command syntax:
```
$USER1$/check_unmsdevice_up.sh $ARG1$
```
# Nagios Usage in Host/Service:
```
define host {
	host_name                      	<YOUR HOSTNAME>
	alias                          	Check status of UNMS device
	address                        	<IP address or hostname>   #not actually used, but I enter the hostname/IP for uniformity
	check_command                  	check_unms_online!<DEVICE GUID>
	use                            	generic-host
	register                       	1
}	


define service {
	host_name                      	<YOUR HOSTNAME>
	service_description            	Check status of UNMS device
	active_checks_enabled          	1              #update as needed for your install, or omit if set at a parent level
	check_period                   	24x7           #update as needed for your install, or omit if set at a parent level
	notification_interval          	0              #update as needed for your install, or omit if set at a parent level
	notification_period            	24x7           #update as needed for your install, or omit if set at a parent level
	notifications_enabled          	1              #update as needed for your install, or omit if set at a parent level
	contact_groups                 	admins         #update as needed for your install, or omit if set at a parent level
	check_command                  	check_unms_online!<DEVICE GUID>
	use                            	generic-service
	register                       	1
}	
```
