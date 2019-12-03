FROM ubuntu:latest AS install-conda

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

COPY entrypoint.sh /entrypoint.sh

RUN apt-get update -y \
    && apt-get install -y curl \
    && curl -L -o '/miniconda.sh' \
       'https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh' \
    && /bin/bash '/miniconda.sh' -b -p '/opt/conda' \
    && /opt/conda/bin/conda clean -tipsy

FROM ubuntu:latest

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

COPY --from=install-conda /opt/conda /opt/conda
COPY entrypoint.sh /entrypoint.sh

RUN apt-get update -y

ENTRYPOINT ["/entrypoint.sh"]
