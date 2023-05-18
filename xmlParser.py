import xml.etree.ElementTree as ET
xmlfile='misc_new.xml'

tree = ET.parse(xmlfile)
root = tree.getroot()
print (root.tag)

for child in root:
    print(child)
    
for cmd in root.iter('cmd'):
    print(cmd)