FROM quay.io/vektorcloud/python:3

ENV NUMPY_VERSION 1.12.1
ENV PANDAS_VERSION 0.19.2

RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
      openblas \
      python3-dev \
      freetype-dev \
      make \
      g++ \
      gfortran \
      musl

COPY numpy-site.cfg /root/.numpy-site.cfg
RUN ln -sv /usr/include/locale.h /usr/include/xlocale.h && \
  pip install --no-cache-dir Cython --install-option="--no-cython-compile" && \
  pip install --no-cache-dir numpy=="$NUMPY_VERSION" pandas=="$PANDAS_VERSION" && \
  python -c 'import numpy, pandas; print("NUMPY VERSION: ", numpy.__version__, "\nPANDAS VERSION: ", pandas.__version__)'

