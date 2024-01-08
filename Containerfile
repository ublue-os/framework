ARG BASE_IMAGE_NAME="${BASE_IMAGE_NAME:-silverblue}"
ARG IMAGE_FLAVOR="${IMAGE_FLAVOR:-main}"
ARG SOURCE_IMAGE="${SOURCE_IMAGE:-${BASE_IMAGE_NAME}${IMAGE_FLAVOR}}"
ARG BASE_IMAGE="ghcr.io/ublue-os/${SOURCE_IMAGE}"
ARG FEDORA_MAJOR_VERSION="${FEDORA_MAJOR_VERSION:-39}"

FROM ${BASE_IMAGE}:${FEDORA_MAJOR_VERSION} AS framework
ARG BASE_IMAGE_NAME="${BASE_IMAGE_NAME:-silverblue}"
ARG FEDORA_MAJOR_VERSION="${FEDORA_MAJOR_VERSION:-39}"
ARG TARGET_CPU="${TARGET_CPU}"

# Store a copy of files so we not have to polute
# every image with image specific files.
COPY system_files/ /tmp/
# Copy shared files between all images.
COPY system_files/shared /
COPY framework-install.sh /tmp/framework-install.sh
COPY framework-packages.json /tmp/framework-packages.json

# Setup specific files and commands for Silverblue based flavors
RUN if grep -q "silverblue" <<< "${BASE_IMAGE_NAME}"; then \
    rsync -rvK /tmp/silverblue/ / && \    
    systemctl enable dconf-update \
; fi

# Setup things which are the same for every image
RUN wget https://copr.fedorainfracloud.org/coprs/ublue-os/staging/repo/fedora-$(rpm -E %fedora)/ublue-os-staging-fedora-$(rpm -E %fedora).repo -O /etc/yum.repos.d/_copr_ublue-os_staging.repo && \
    /tmp/framework-install.sh && \
    cat /tmp/just/custom.just >> /usr/share/ublue-os/just/60-custom.just && \
    sed -i 's@enabled=1@enabled=0@g' /etc/yum.repos.d/_copr_ublue-os_staging.repo && \
    rm -rf /tmp/* /var/* && \
    ostree container commit && \
    mkdir -p /var/tmp && \
    chmod -R 1777 /tmp /var/tmp