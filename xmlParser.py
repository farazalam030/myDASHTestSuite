import sys
import xml.etree.ElementTree as ET
xmlfile=sys.argv[1]


tree = ET.parse(xmlfile)
root = tree.getroot()
# print (root.tag)

# for child in root:
#     print(child)

version = (root[0][0].text).strip() + ", "  
print( version  )

for case in  root.findall('./case'):
    result = str(ET.tostring((case[2])))
    result = result[10:-12]
    result = result.replace('\\n','')
    result=result.strip()
    # print (result)
    cmd = str(ET.tostring(case[1]))
    cmd=cmd[7:-9]
    cmd = cmd.replace('\\n','')
    cmd=cmd.strip()
    # print (cmd)
    if ("Error" in result or "error" in result):
        out = cmd + ', '+result
        print (out)