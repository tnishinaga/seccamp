url_base = "https://raw.githubusercontent.com/raspberrypi/firmware/master/boot/"
files = [
    "bootcode.bin",
    "fixup.dat",
    "fixup_cd.dat",
    "fixup_db.dat",
    "fixup_x.dat",
    "start.elf",
    "start_cd.elf",
    "start_db.elf",
    "start_x.elf"
]

import subprocess

for ff in files:
    subprocess.call(["curl", "-O", url_base + ff])