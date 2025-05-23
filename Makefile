# Variables
IMAGE_NAME = gdal-r-container
IMAGE_TAG = latest

# Default target
.PHONY: all
all: build

# Build the Docker image
.PHONY: build
build:
	@echo "Building $(IMAGE_NAME):$(IMAGE_TAG)..."
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .

# Run the container with an interactive shell
.PHONY: run
run:
	docker run -it --rm $(IMAGE_NAME):$(IMAGE_TAG) /bin/bash

# Run the container with an R session
.PHONY: r-console
r-console:
	docker run -it --rm $(IMAGE_NAME):$(IMAGE_TAG) R

# Clean up Docker images
.PHONY: clean
clean:
	@echo "Removing $(IMAGE_NAME):$(IMAGE_TAG)..."
	docker rmi $(IMAGE_NAME):$(IMAGE_TAG)

# Help target
.PHONY: help
help:
	
		@echo "Available targets:"
	@echo "  all        - Build the Docker image (default)"
	@echo "  build      - Build the Docker image"
	@echo "  run        - Run the container with an interactive shell"
	@echo "  r-console  - Run the container with an R session"
	@echo "  clean      - Remove the Docker image"
	@echo "  help       - Show this help message"
