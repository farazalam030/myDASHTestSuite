import xml.etree.ElementTree as ET
xmlfile='misc_new.xml'

tree = ET.parse(xmlfile)
root = tree.getroot()
# print (root.tag)

# for child in root:
#     print(child)
    
for case in  root.findall('./misc'):
    data = str(ET.tostring((case[1])))
    data = data[2:]
    data = data.replace("<data>",'')
    data = data.replace('\\n','')
    data = data.replace('</data>','')
    data=data.strip()

    cmd = str(ET.tostring(case[0]))
    cmd=cmd[2:]
    cmd = cmd.replace("<cmd>",'')
    cmd = cmd.replace('\\n','')
    cmd = cmd.replace('</cmd>','')
    cmd=cmd.strip()
    if ("Error" in data or "error" in data):
        out = cmd + ', '+data
        print (out)
        # print (data)
    # dt=str(ET.tostring(data))
    # command = 
    # if ("Error" in dt or "error" in dt):
    #     print (dt)