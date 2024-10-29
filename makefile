IMAGE := docker.io/ministryofjustice/tech-docs-github-pages-publisher@sha256:cd3513beca3fcaf5dd34cbe81a33b3ff30337d8ada5869b40a6454c21d6f7684 # v4.0.0

# Use this to run a local instance of the documentation site, while editing
.PHONY: preview package

preview:
	docker run --rm --platform=linux/amd64 \
		-v $$(pwd)/config:/app/config \
		-v $$(pwd)/source:/app/source \
		-p 4567:4567 \
		-it $(IMAGE) /usr/local/bin/preview

package:
	docker run --rm --platform=linux/amd64 \
		-v $$(pwd)/config:/app/config \
		-v $$(pwd)/source:/app/source \
		-it $(IMAGE) /usr/local/bin/package
