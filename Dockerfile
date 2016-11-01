FROM quay.io/vektorcloud/python3:latest

ENV NUMPY_VERSION 1.11.2
ENV PANDAS_VERSION 0.19.0

RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
      openblas \
      python3-dev \
      freetype-dev \
      make \
      g++ \
      gfortran \
      musl

RUN ln -sv /usr/include/locale.h /usr/include/xlocale.h && \
  pip install --no-cache-dir Cython --install-option="--no-cython-compile" && \
  pip install --no-cache-dir numpy=="$NUMPY_VERSION" pandas=="$PANDAS_VERSION" && \
  python -c 'import numpy, pandas; print("NUMPY VERSION: ", numpy.__version__, "\nPANDAS VERSION: ", pandas.__version__)'

RUN apk del build-dependencies
