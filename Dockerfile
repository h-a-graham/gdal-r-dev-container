FROM rocker/r-base

# Install build dependencies
RUN apt-get update && apt-get install -y \
  git \
  build-essential \
  cmake \
  libproj-dev \
  libgeos-dev \
  libsqlite3-dev \
  libcurl4-openssl-dev \
  libxml2-dev \
  libtiff5-dev \
  libgeotiff-dev \
  libjpeg-dev \
  libpng-dev \
  libnetcdf-dev \
  libhdf5-dev \
  libopenjp2-7-dev \
  libwebp-dev \
  libexpat1-dev \
  zlib1g-dev \
  python3-dev \
  python3-numpy \
  python3-pip \
  python3-setuptools \
  python3-pytest \
  python3-pytest-sugar \
  python3-pytest-benchmark \
  python3-lxml \
  python3-jsonschema \
  python3-filelock \
  swig \
  && rm -rf /var/lib/apt/lists/*

# Clone and build GDAL from source
WORKDIR /tmp
RUN git clone https://github.com/OSGeo/gdal.git
WORKDIR /tmp/gdal
RUN mkdir build
WORKDIR /tmp/gdal/build
RUN cmake .. \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/usr/local
RUN cmake --build .
RUN cmake --build . --target install

# Update library path
RUN ldconfig

# Clean up
WORKDIR /
RUN rm -rf /tmp/gdal

# Install pak package from CRAN and gdalraster from GitHub
RUN R -e "install.packages('pak', repos='https://cloud.r-project.org/')" && \
  R -e "pak::pkg_install('devtools')"
ENV PKG_SYSREQS FALSE
RUN R -e "pak::pkg_install('USDAForestService/gdalraster')" 
ENV PKG_SYSREQS TRUE



# Set working directory back to root
WORKDIR /