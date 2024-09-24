FROM debian
RUN apt-get update
RUN apt-get install curl -y

ENV DEBIAN_VERSION="12.7.0"
ENV ISOFILE="debian-${DEBIAN_VERSION}-amd64-netinst.iso"
WORKDIR /build
RUN curl -LO https://cdimage.debian.org/debian-cd/${DEBIAN_VERSION}/amd64/iso-cd/$ISOFILE

COPY root/ /
RUN apt-get install p7zip-full xorriso cpio -y
CMD preseed_iso.sh