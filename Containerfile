ARG BASE_IMAGE_NAME="${BASE_IMAGE_NAME:-silverblue}"
ARG IMAGE_FLAVOR="${IMAGE_FLAVOR}:-main"
ARG SOURCE_IMAGE="${SOURCE_IMAGE:-${BASE_IMAGE_NAME}${IMAGE_FLAVOR}}"
ARG BASE_IMAGE="ghcr.io/ublue-os/${SOURCE_IMAGE}"
ARG FEDORA_MAJOR_VERSION="${FEDORA_MAJOR_VERSION:-38}"

FROM ${BASE_IMAGE}:${FEDORA_MAJOR_VERSION} AS asus

ARG BASE_IMAGE_NAME="${BASE_IMAGE_NAME:-silverblue}"
ARG FEDORA_MAJOR_VERSION="${FEDORA_MAJOR_VERSION:-38}"

# Copy shared files between all images.
COPY asus-install.sh /tmp/asus-install.sh
COPY asus-packages.json /tmp/asus-packages.json

# Remove Deck services when building for Ally
RUN if grep -q "deck" <<< ${BASE_IMAGE_NAME}; then \
    systemctl disable jupiter-fan-control.service && \
    systemctl disable jupiter-biosupdate.service && \
    systemctl disable jupiter-controller-update.service && \
    systemctl disable vpower.service && \
    systemctl --global disable sdgyrodsu.service && \
    rpm-ostree override remove \
        jupiter-fan-control \
        jupiter-hw-support-btrfs \
        powerbuttond \
        vpower \
        sdgyrodsu && \
    rm -rf /usr/lib/jupiter-dock-updater \
; fi

# Add Copr magic
RUN wget https://copr.fedorainfracloud.org/coprs/lukenukem/asus-linux/repo/fedora-$(rpm -E %fedora)/lukenukem-asus-linux-fedora-$(rpm -E %fedora).repo -O /etc/yum.repos.d/_copr_lukenukem-asus-linux.repo && \
    wget https://copr.fedorainfracloud.org/coprs/lukenukem/asus-kernel/repo/fedora-$(rpm -E %fedora)/lukenukem-asus-kernel-fedora-$(rpm -E %fedora).repo -O /etc/yum.repos.d/_copr_lukenukem-asus-kernel.repo

# Install Asus kernel
RUN rpm-ostree override replace \
    --experimental \
    --from repo=copr:copr.fedorainfracloud.org:lukenukem:asus-kernel \
        kernel \
        kernel-core \
        kernel-modules \
        kernel-modules-core \
        kernel-modules-extra \
        kernel-uki-virt

# Setup things which are the same for every image
RUN /tmp/asus-install.sh && \
    rm -rf /tmp/* /var/* && \    
    ostree container commit && \
    mkdir -p /var/tmp && chmod -R 1777 /tmp /var/tmp
