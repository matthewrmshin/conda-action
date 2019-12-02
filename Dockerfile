FROM ubuntu:latest

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

COPY entrypoint.sh /entrypoint.sh

RUN apt-get update -y \
    && apt-get install -y curl \
    && curl -L -o '/miniconda.sh' \
       'https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh' \
    && /bin/bash '/miniconda.sh' -b -p '/opt/conda' \
    && rm -f '/miniconda.sh' \
    && /opt/conda/bin/conda clean -tipsy \
    && ln -s '/opt/conda/etc/profile.d/conda.sh' '/etc/profile.d/conda.sh'

ENTRYPOINT ["/entrypoint.sh"]
