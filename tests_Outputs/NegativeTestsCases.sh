
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t computersystem[0] user add user1 user1pass [UserCompany]
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t computersystem[0] bootconfig add 2 0 1
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t computersystem[0] opaquemanagementdata create myomd 222
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t sensor[0] show
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t sensor[0] reading
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t sensor[0] setthreshold lnc 100
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t fan[0] show
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t fan[0] setspeed 100
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t fan[0] enumerate asset
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t user[2] show
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t user[2] assignroles Admin
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t user[2] show
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t user[2] removeroles Admin
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t user[2] show
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t user[2] changepassword testpasswd
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t user[2] delete
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t user[2] show
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t role[1] delete
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek indication createfilter CQL SELECT * FROM CIM_AlertIndication
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek indication createdestination http://192.168.0.101:8080/eventsink
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek indication staticsubscribe http://192.168.0.101:8080/eventsink push 0 1
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek indication dynamicsubscribe http://192.168.1.101:80
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t indicationsubscription[0] show
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t usbredirection[0] listlocaldrives
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t usbredirection[0] startvmr image c:/images/fedora8.iso
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t usbredirection[0] disconnect
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t bootconfig[0] show
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t bootconfig[0] setnext
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t opaquemanagementdata[0] show
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t opaquemanagementdata[0] read 1000 5
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t opaquemanagementdata[0] write 0 abcd
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t opaquemanagementdata[0] importfromuri 0 100 http://dash.com
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t opaquemanagementdata[0] exportfromuri 0 100 http://dash.com
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t opaquemanagementdata[0] reassignowner guest
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t opaquemanagementdata[0] assignaccess Guest Read
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t opaquemanagementdata[0] lock true
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t opaquemanagementdata[0] delete
dashcli version
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t bios[0] restoredefaults
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t indicationfilter[0] show
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t indicationsubscription[0] show
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t indicationsubscription[0] delete
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t alertdestination[0] show
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t logentry[0] show
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t fan[0]
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t opaquemanagementdata[0]
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t indicationfilter[0]
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t alertdestination[0]
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t indicationsubscription[0]
dashcli version
dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t logentry[0]
