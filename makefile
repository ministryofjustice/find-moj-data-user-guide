IMAGE := ghcr.io/ministryofjustice/tech-docs-github-pages-publisher@sha256:35699473dbeefeeb8b597de024125a241277ee03587d5fe8e72545e4b27b33f8 # v5.0.0

# Use this to run a local instance of the documentation site, while editing
.PHONY: preview package

preview:
	docker run --rm --platform=linux/amd64 \
		-v $$(pwd)/config:/tech-docs-github-pages-publisher/config \
		-v $$(pwd)/source:/tech-docs-github-pages-publisher/source \
		-p 4567:4567 \
		-it $(IMAGE) /usr/local/bin/preview

package:
	docker run --rm --platform=linux/amd64 \
		-v $$(pwd)/config:/tech-docs-github-pages-publisher/config \
		-v $$(pwd)/source:/tech-docs-github-pages-publisher/source \
		-it $(IMAGE) /usr/local/bin/package
