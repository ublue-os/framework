# Add boot parameters needed for a Framework 13 laptop
framework-13:
    #!/usr/bin/env bash
    CPU_MODEL=$(grep -m 1 "model name" /proc/cpuinfo)
    if grep -q "13th Gen" <<< $CPU_MODEL
    then
      rpm-ostree kargs --append="module_blacklist=hid_sensor_hub" --append="rd.luks.options=discard"
    elif grep -q "12th Gen" <<< $CPU_MODEL
    then
      rpm-ostree kargs --append="module_blacklist=hid_sensor_hub"
    fi

# Add boot parameters needed for a Framework 16 laptop
#framework-16:
#  rpm-ostree kargs --append="module_blacklist=hid_sensor_hub" --append="nvme.noacpi=1" --append="tpm_tis.interrupts=0" --append="rd.luks.options=discard"
