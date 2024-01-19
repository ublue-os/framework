#!/bin/sh

set -ouex pipefail

# Define Power Services
PPD="power-profiles-daemon"
TLP="tlp"

CPU_VENDOR=$(lshw -json -class CPU | jq -r ".[].vendor")

disable_service() {
  service="$1"

  if systemctl is-enabled ${service}; then
    echo "Disabling ${service}"
    systemctl stop ${service}
    systemctl disable "${service}"
  else
    echo "${service} is not enabled"
  fi
}

enable_service() {
  service=$1

  if systemctl is-enabled ${service}; then
    echo "${service} is already enabled"
  else
    echo "Enabling ${service}"
    systemctl enable "${service}"
    systemctl start "${service}"
  fi
}

if [[ "${CPU_VENDOR^^}" =~ "AMD" ]]; then
    disable_service "${TLP}"
    enable_service "${PPD}"
elif [[ "${CPU_VENDOR^^}" =~ "INTEL" ]]; then
    disable_service "${PPD}"
    enable_service "${TLP}"
fi

exit 0
