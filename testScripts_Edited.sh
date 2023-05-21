#!/bin/sh

# TARGET="\$TARGET"
# DASH_CLI_VERSION=$(dashcli version)
# PORT="\$PORT"
# USER="\$USER"
# PASSWORD="\$PASSWORD"
# HTTP_PROTOCOL="\$HTTP_PROTOCOL"

TARGET="10.138.176.169"
DASH_CLI_VERSION=$(dashcli version)
PORT="623"
USER="Administrator"
PASSWORD="Realtek"
HTTP_PROTOCOL="http"
DASHCMDTYPE="CASE"
COUNT=1
#dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t kvmredirection[1] startkvm
_run_cli() {
	_CMD="dashcli -v 1 -S $HTTP_PROTOCOL -C -a digest -h $TARGET -p $PORT -u $USER -P $PASSWORD $*"
	echo "<${DASHCMDTYPE}> "
	echo "# ${DASH_CLI_VERSION}"
	echo "${_CMD}" 
	
	
	${_CMD}
	echo "</${DASHCMDTYPE}> "
	# COUNT=$(( COUNT+1 ))
	
	# echo "================================================================================"
	# echo ""
}

_test_enumerate() {
	_OBJECTS="\
		alertdestination       \
		asset                  \
		battery                \
		bios                   \
		bootconfig             \
		computersystem         \
		dhcpclient             \
		dnsclient              \
		ethernetport           \
		fan                    \
		indicationfilter       \
		indicationsubscription \
		ipinterface            \
		kvmredirection         \
		memory                 \
		networkport            \
		opaquemanagementdata   \
		operatingsystem        \
		powersupply            \
		processor              \
		recordlog              \
		registeredprofile      \
		role                   \
		sensor                 \
		software               \
		textredirection        \
		usbredirection         \
		user"
	for obj in ${_OBJECTS}; do
		_run_cli enumerate ${obj}
	done
}

_test_computersystem() {
	_run_cli -t computersystem[0] show
	_run_cli -t computersystem[0] enumerate processor
	_run_cli -t computersystem[0] enumerate sensor
	_run_cli -t computersystem[0] enumerate fan

	_run_cli -t computersystem[0] power status
	_run_cli -t computersystem[0] power availablestates
	_run_cli -t computersystem[0] power supportedstates

	_run_cli -t computersystem[0] user add user1 user1pass [UserCompany]
	_run_cli -t computersystem[0] bootconfig  add  2 0 1
	_run_cli -t computersystem[0] opaquemanagementdata create myomd 222

	_run_cli -t computersystem[0]/processor[0] show
	_run_cli -t computersystem[0]/processor[0] enumerate fan
	_run_cli -t computersystem[0]/processor[0] enumerate sensor
	_run_cli -t computersystem[0]/processor[0] enumerate memory
	_run_cli -t computersystem[0]/processor[0] enumerate asset
}

_test_processor() {
	_run_cli -t processor[0] show
	_run_cli -t processor[0] enumerate memory
	_run_cli -t processor[0] enumerate sensor
	_run_cli -t processor[0] enumerate fan
	_run_cli -t processor[0] enumerate asset
}

_test_case0() {
	_run_cli -t powersupply[0] show
	_run_cli -t software[0] show
	_run_cli -t networkport[0] show
	_run_cli -t memory[0] show
	_run_cli -t asset[0] show

	_run_cli -t sensor[0] show
	_run_cli -t sensor[0] reading
	_run_cli -t sensor[0] setthreshold  lnc 100

	_run_cli -t fan[0] show
	_run_cli -t fan[0] setspeed 100
	_run_cli -t fan[0]  enumerate asset

	_run_cli -t user[2] show
	_run_cli -t user[2] assignroles Admin
	_run_cli -t user[2] show
	_run_cli -t user[2] removeroles Admin
	_run_cli -t user[2] show
	_run_cli -t user[2] changepassword testpasswd
	_run_cli -t user[2] delete
	_run_cli -t user[2] show

	_run_cli -t role[1] show
	_run_cli -t role[1] show
	_run_cli -t role[1] show
	_run_cli -t role[1] show
	_run_cli -t role[1] delete
	_run_cli -t role[1] show
}

_test_misc() {
	_run_cli indication createfilter  CQL  SELECT \* FROM CIM_AlertIndication
	_run_cli indication createdestination http://192.168.0.101:8080/eventsink
	_run_cli indication staticsubscribe http://192.168.0.101:8080/eventsink push 0 1
	_run_cli indication dynamicsubscribe http://192.168.1.101:80
	_run_cli indication collectionsubscribe http://192.168.1.101:8080/eventsink push 0 1

	_run_cli -t indicationsubscription[0] show
	_run_cli -t indicationsubscription[0] renew 2013-01-07T03:17:31-06:00
	_run_cli -t indicationsubscription[0] show
	_run_cli -t indicationsubscription[0] unsubscribe
	_run_cli -t indicationsubscription[0] show

	_run_cli -t textredirection[0] show
	_run_cli -t textredirection[0] activate
	_run_cli -t textredirection[0] show
	_run_cli -t textredirection[0] disable
	_run_cli -t textredirection[0] show
	_run_cli -t textredirection[1] show
	_run_cli -t textredirection[1] activate
	_run_cli -t textredirection[1] show
	_run_cli -t textredirection[1] disable
	_run_cli -t textredirection[1] show

	_run_cli -t usbredirection[0] show
	_run_cli -t usbredirection[0] listlocaldrives
	_run_cli -t usbredirection[0] startvmr image c:/images/fedora8.iso
	_run_cli -t usbredirection[0] disconnect

	_run_cli -t bootconfig[0] show
	_run_cli -t bootconfig[0] setdefault
	_run_cli -t bootconfig[0] show
	_run_cli -t bootconfig[0] setnext
	_run_cli -t bootconfig[0] show
	_run_cli -t bootconfig[0] delete
	_run_cli -t bootconfig[0] show

	_run_cli -t opaquemanagementdata[0] show
	_run_cli -t opaquemanagementdata[0] read 1000 5
	_run_cli -t opaquemanagementdata[0] write 0 abcd
	_run_cli -t opaquemanagementdata[0] importfromuri 0 100 http://dash.com
	_run_cli -t opaquemanagementdata[0] exportfromuri 0 100 http://dash.com
	_run_cli -t opaquemanagementdata[0] reassignowner guest
	_run_cli -t opaquemanagementdata[0] assignaccess Guest Read
	_run_cli -t opaquemanagementdata[0] lock true
	_run_cli -t opaquemanagementdata[0] delete
	_run_cli -t operatingsystem[0] show

	_run_cli -t bios[0] show
	_run_cli -t bios[0] restoredefaults
	_run_cli -t bios[0] show
	_run_cli -t bios[0] show
	_run_cli -t battery[0] show
	_run_cli -t battery[0] enable
	_run_cli -t battery[0] show
	_run_cli -t battery[0] disable
	_run_cli -t battery[0] show
	_run_cli -t battery[0] test
	_run_cli -t battery[0] recharge
	_run_cli -t registeredprofile[0] show
	_run_cli -t dnsclient[0] show
	_run_cli -t dhcpclient[0] show
	_run_cli -t ipinterface[0] show
	_run_cli -t indicationfilter[0] show
	_run_cli -t indicationsubscription[0] show
	_run_cli -t indicationsubscription[0] delete
	_run_cli -t alertdestination[0] show
	_run_cli -t ethernetport[0] show
	_run_cli -t kvmredirection[0] show
	_run_cli -t logentry[0] show
	_run_cli -t recordlog[0] show
	_run_cli -t registeredprofile[0]
	_run_cli -t computersystem[0]
	_run_cli -t processor[0]
	_run_cli -t memory[0]
	_run_cli -t asset[0]
	_run_cli -t bootconfig[0]
	_run_cli -t bios[0]
	_run_cli -t powersupply[0]
	_run_cli -t fan[0]
	_run_cli -t software[0]
	_run_cli -t operatingsystem[0]
	_run_cli -t battery[0]
	_run_cli -t user[0]
	_run_cli -t role[0]
	_run_cli -t networkport[0]
	_run_cli -t dhcpclient[0]
	_run_cli -t ipinterface[0]
	_run_cli -t dnsclient[0]
	_run_cli -t opaquemanagementdata[0]
	_run_cli -t textredirection[0]
	_run_cli -t usbredirection[0]
	_run_cli -t indicationfilter[0]
	_run_cli -t filtercollection[0]
	_run_cli -t alertdestination[0]
	_run_cli -t indicationsubscription[0]
	_run_cli -t ethernetport[0]
	_run_cli -t kvmredirection[0]
	_run_cli -t logentry[0]
	_run_cli -t recordlog[0]
}

if [ $# != 0 ]; then
	if [[ $1 == 'all' ]]; then 
		_test_enumerate
		_test_computersystem
		_test_case0
		_test_processor
		_test_misc
	elif  [[ $1 == 'enumerate' ]]; then 
		_test_enumerate
		# echo "_test_enumerate"
	elif  [[ $1 == 'computersystem' ]]; then
		_test_computersystem
		# echo "_test_computersystem"
	elif  [[ $1 == 'case0'  ]];then
		_test_case0
		# echo "_test_case0"
	elif  [[ $1 == 'processor' ]];then
		_test_processor
		# echo "_test_processor"
	elif  [[ $1 == 'misc' ]];then
		_test_misc
		# echo "test_misc"
	else 
		echo "Pass Valid parameters as Follows"
		echo "         (a) 'all' to run all cases"
		echo "         (b) 'computersystem' to run all  computersystem cases"
		echo "         (c) 'case0' to run all _test_case0 cases"
		echo "         (d) 'enumerate' to run all _test_enumerate cases"
		echo "         (e) 'processor' to run all _test_processor cases"
		echo "         (f) 'misc' to run all _test_misc cases"
	fi
else 
	echo "Pass Valid parameters as Follows"
	echo "         (a) 'all' to run all cases"
	echo "         (b) 'computersystem' to run all  computersystem cases"
	echo "         (c) 'case0' to run all _test_case0 cases"
	echo "         (d) 'enumerate' to run all _test_enumerate cases"
	echo "         (e) 'processor' to run all _test_processor cases"
	echo "         (f) 'misc' to run all _test_misc cases"

fi

