#!/bin/sh

echo "HTTP Tests begin"

bash testScripts_Edited.sh enumerate &> tests_Outputs/dashcli_unitTest_http_enumerate.txt
echo "enumerate tests done"
bash testScripts_Edited.sh computersystem &> tests_Outputs/dashcli_unitTest_http_computersystem.txt
echo "computersystem tests done"
bash testScripts_Edited.sh case0 &> tests_Outputs/dashcli_unitTest_http_case0.txt
echo "case0 tests done"
bash testScripts_Edited.sh processor &> tests_Outputs/dashcli_unitTest_http_processor.txt
echo "processor tests done"
bash testScripts_Edited.sh misc &> tests_Outputs/dashcli_unitTest_http_misc.txt
echo "misc tests done"

echo "HTTP Tests end"


echo "HTTPS Tests begin"
bash testScripts_Edited_https.sh enumerate &> tests_Outputs/dashcli_unitTest_https_enumerate.txt
echo "enumerate tests done"
bash testScripts_Edited_https.sh computersystem &> tests_Outputs/dashcli_unitTest_https_computersystem.txt
echo "computersystem tests done"
bash testScripts_Edited_https.sh case0 &> tests_Outputs/dashcli_unitTest_https_case0.txt
echo "case0 tests done"
bash testScripts_Edited_https.sh processor &> tests_Outputs/dashcli_unitTest_https_processor.txt
echo "processor tests done"
bash testScripts_Edited_https.sh misc &> tests_Outputs/dashcli_unitTest_https_misc.txt
echo "misc tests done"
echo "HTTPS Tests end"

echo "RUN THIS MANUALLY dashcli -v 1 -S http -C -a digest -h 10.138.176.169 -p 623 -u Administrator -P Realtek -t kvmredirection[1] startkvm"
