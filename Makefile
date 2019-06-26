SOURCES=$(shell find src -name "*.js")

.PHONY: all clean coverage lint test major-version minor-version patch-version \
	publish site

all: dist/flyps.js

dist/flyps.js: $(SOURCES)
	npm run build

test:
	npm test

coverage:
	npm test -- --coverage

lint:
	npm run lint

major-version:
	npm version major -m "Release v%s"

minor-version:
	npm version minor -m "Release v%s"

patch-version:
	npm version patch -m "Release v%s"

publish:
	npm publish

site:
	make -C site

clean:
	rm -f dist/*