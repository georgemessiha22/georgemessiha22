FROM registry.gitlab.com/islandoftex/images/texlive:latest
# FROM debian:stable

LABEL maintainer="George Messiha (gmessiha)"

WORKDIR /

RUN apt update && apt install -y python3 # texlive wget
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1


RUN tlmgr update --self --all skipcache
RUN tlmgr install \
 academicons \
 arydshln \
 etextools \
 fontawesome5 \
 ifmtarg \
 latexmk \
 moderncv \
 multirow \
 texliveonfly\
 xpatch \
 xstring

WORKDIR /data

COPY build/entrypoint.sh  /entrypoint
RUN chmod +x /entrypoint

ENTRYPOINT ["/entrypoint"]
