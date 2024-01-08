#!/bin/sh

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

DEFAULT_PACKAGES="/tmp/framework-packages.json"

echo "Building package default package list for $TARGET_CPU"

INCLUDED_PACKAGES=(
	$(jq -r "([.all.include, (.\"$TARGET_CPU\".include | (.packages, .\"$FEDORA_MAJOR_VERSION-packages\"))] | flatten | sort | unique[])" ${DEFAULT_PACKAGES})
)

EXCLUDED_PACKAGES=(
	$(jq -r "([.all.exclude, (.\"$TARGET_CPU\".exclude | (.packages, .\"$FEDORA_MAJOR_VERSION-packages\"))] | flatten | sort | unique[])" ${DEFAULT_PACKAGES})
)


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
