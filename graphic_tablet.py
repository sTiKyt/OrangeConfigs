# very primitive script to automatically configure my graphical tablet
# TO-DO make sure systemd runs this on tablet connected
from subprocess import Popen, PIPE, check_output

# DEPENDENCIES CHECK
XSETWACOM = False
XSETWACOM_COMMAND = 'xsetwacom'
STYLUS_1060 = False
TABLET_1060 = False
STYLUS_ID = ''
TABLET_ID = ''

xsetwacom_check = Popen(['which', XSETWACOM_COMMAND], stdout=PIPE, stderr=PIPE)
xsetwacom_stdout = xsetwacom_check.communicate()
if XSETWACOM_COMMAND in str(xsetwacom_stdout):
    XSETWACOM = True

if XSETWACOM == False:
    print("Can't continue without xsetwacom, install and try again.")
    exit()

devices_connected_raw = Popen([XSETWACOM_COMMAND, 'list', 'devices'], stdout=PIPE, stderr=PIPE).stdout.read().decode('utf-8').splitlines()
devices_connected = []
for device in devices_connected_raw:
    item_raw = device.split('\t')
    item = []
    for element in item_raw:
        item.append(element.strip())
    
    item_name = item[0]
    item_id = item[1].split(':')[1]
    item_type = item[2].split(':')[1]

    processed_item = [item_id, item_type, item_name]

    devices_connected.append(processed_item)

for device in devices_connected:
    if '1060' in str(device):
        if 'STYLUS' in str(device):
            STYLUS_1060 = True
            STYLUS_ID = device[0].strip()
        elif 'PAD' in str(device):
            TABLET_1060 = True
            TABLET_ID = device[0].strip()

if TABLET_1060 is False:
    print("Don't see your tablet connected, make sure cable is connected correctly")
    exit()

if STYLUS_1060 is False:
    print("Don't see your stylus, strange shit...")
    exit()


# Check rotation, easy way didn't work so i'll have to parse output of all
stylus_check_raw = Popen([XSETWACOM_COMMAND, 'get', STYLUS_ID, 'all'], stdout=PIPE, stderr=PIPE).stdout.read().decode('utf-8')
stylus_check_options = stylus_check_raw.splitlines()
stylus_rotation = ''
for item in stylus_check_options:
    if 'rotate' in str(item).lower():
        stylus_rotation = str(item).split()[2]

# set rotation to half if it's different
if stylus_rotation != 'half':
    Popen([XSETWACOM_COMMAND, 'set', STYLUS_ID, 'rotate', 'half'])

# Check currently connected monitors and find primary one, make sure you are running X server
monitors = check_output(["xrandr"]).decode('utf-8').splitlines()
primary_monitor = ''
for line in monitors:
    if 'primary' in str(line).lower():
        primary_monitor = line.split()[0]
#Makes sure tablet works on primary monitor only
Popen(['xinput', 'map-to-output', STYLUS_ID, primary_monitor])
