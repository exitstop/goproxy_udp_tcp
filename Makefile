GOCMD=go
GOBUILD=$(GOCMD) build

build:
	$(GOBUILD) -v -o build/goproxy main.go

sync_smtp: build
	./script/sync.sh goproxy smtp 25 172.31.34.201:25 false false false
