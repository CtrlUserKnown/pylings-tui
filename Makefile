.PHONY: build build-universal clean run

build:
	swift build -c release

build-universal:
	swift build -c release --arch arm64 --arch x86_64

clean:
	rm -rf .build

run:
	swift run -c release
