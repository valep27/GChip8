default: build

bootstrap:
	go get github.com/urfave/cli
	go get github.com/veandco/go-sdl2
	brew install sdl2
	make updatedeps

build: clean vet lint
	GOOS=darwin GOARCH=amd64 go build -v -o ./bin/GChip8 ./src/main

clean:
	rm -rf ./bin/*

vet:
	go vet ./src/...

lint:
	golint ./src/...

updatedeps:
	rm -rf Godeps	
	godep save ./src/...
	
