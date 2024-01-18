#!/bin/sh

set -ouex pipefail

# Define Power Services
PPD="power-profiles-daemon"
TLP="tlp"

CPU_VENDOR=$(lshw -json -class CPU | jq -r ".[].vendor")

swap_power(){
  case $1 in
    amd)
      systemctl is-enabled ${TLP} > /dev/null && systemctl disable --now ${TLP} 
      echo "Enabling ${PPD}"
      systemctl is-enabled ${PPD} > /dev/null || systemctl enable --now ${PPD} 
      ;;
    # Default to TLP
    *)
      systemctl is-enabled ${PPD} > /dev/null && systemctl disable --now ${PPD} 
      echo "Enabling ${TLP}"
      systemctl is-enabled ${TLP} > /dev/null || systemctl enable --now ${TLP}       
      ;;
  esac
}

if [[ "${CPU_VENDOR^^}" =~ "AMD" ]]; then
  swap_power amd
elif [[ "${CPU_VENDOR^^}" =~ "INTEL" ]]; then
  swap_power intel
fi
