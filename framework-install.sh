#!/bin/sh

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

echo "Building package default package list for $TARGET_CPU"

INCLUDED_PACKAGES=($(jq -r "[(.\"$TARGET_CPU\".include | (.\"$TARGET_CPU\", select(.\"$BASE_IMAGE_NAME\" != null).\"$BASE_IMAGE_NAME\")[]), \
                             (select(.\"$FEDORA_MAJOR_VERSION\" != null).\"$FEDORA_MAJOR_VERSION\".include | (.\"$TARGET_CPU\", select(.\"$BASE_IMAGE_NAME\" != null).\"$BASE_IMAGE_NAME\")[])] \
                             | sort | unique[]" /tmp/framework-packages.json))
                             
EXCLUDED_PACKAGES=($(jq -r "[(.\"$TARGET_CPU\".exclude | (.\"$TARGET_CPU\", select(.\"$BASE_IMAGE_NAME\" != null).\"$BASE_IMAGE_NAME\")[]), \
                             (select(.\"$FEDORA_MAJOR_VERSION\" != null).\"$FEDORA_MAJOR_VERSION\".exclude | (.\"$TARGET_CPU\", select(.\"$BASE_IMAGE_NAME\" != null).\"$BASE_IMAGE_NAME\")[])] \
                             | sort | unique[]" /tmp/framework-packages.json))

if [[ "${#EXCLUDED_PACKAGES[@]}" -gt 0 ]]; then
    EXCLUDED_PACKAGES=($(rpm -qa --queryformat='%{NAME} ' ${EXCLUDED_PACKAGES[@]}))
fi

if [[ "${#INCLUDED_PACKAGES[@]}" -gt 0 && "${#EXCLUDED_PACKAGES[@]}" -eq 0 ]]; then
    rpm-ostree install \
        ${INCLUDED_PACKAGES[@]}

elif [[ "${#INCLUDED_PACKAGES[@]}" -eq 0 && "${#EXCLUDED_PACKAGES[@]}" -gt 0 ]]; then
    rpm-ostree override remove \
        ${EXCLUDED_PACKAGES[@]}

elif [[ "${#INCLUDED_PACKAGES[@]}" -gt 0 && "${#EXCLUDED_PACKAGES[@]}" -gt 0 ]]; then
    rpm-ostree override remove \
        ${EXCLUDED_PACKAGES[@]} \
        $(printf -- "--install=%s " ${INCLUDED_PACKAGES[@]})

else
    echo "No packages to install."

fi
