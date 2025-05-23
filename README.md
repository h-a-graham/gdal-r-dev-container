# GDAL-R Container: Latest GDAL Built for R Development

This repository contains a Dockerfile for building a GDAL-R container. The 
container is based on the latest GDAL version and is designed for R development.

There are three main things provided:

- The latest development version of the Geospatial Data Abstraction Library 
(GDAL), built from source.
- The latest R version, from the r-base [rocker](https://rocker-project.org/) 
image.
- The latest version of the [gdalraster](https://usdaforestservice.github.io/gdalraster/),
R package, which "provides an R interface to the Raster and Vector APIs of the 
GDAL".

## Why?
GDAL develops quickly, with new features being added all the time. Binaries 
are often not available for the latest version, and building from source can be
a pain. This container provides a simple way to get the latest GDAL version
without having to worry about the build process. 

R is (in my opinion) a wonderful language to use for interacting with GDAL, 
in part because of the rich ecosystem of pacakges, but also becaus the 
(relatively new) gdalraster package provides a rich interface to the GDAL 
that is powerful and massively underutilized. 

My personal selfish reasons for needing this is the development of the 
[vrtility](https://github.com/Permian-Global-Research/vrtility/tree/main) which
aims to make use of some of the lesser known features of GDAL, such as the 
extensive functionality in the virtual raster format (VRT). 

## Installation

### Prerequisites

- make sure you have [Docker](https://docs.docker.com/) and [Make](https://www.gnu.org/software/make/) installed on your machine. 
## Instructions


1. Build the Docker image

```bash
make build
```

This will create a Docker image named `gdal-r-container` with the latest GDAL built from source.

2. Running the container

You have several options:

To open a bash shell in the container:

```bash
make run
```
To open an R console in the container:

```bash
make r-console
```

3. Cleaning up

To remove the Docker image when you're done:

```bash
make clean
```

4. Help

For a list of all available commands:

```bash
make help
```

## Note

The initial build may take some time (approx. 30 mins on my machine ) as it compiles GDAL from source with all dependencies. Subsequent runs will be much faster.
