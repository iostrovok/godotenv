##
## List of commands:
##

## default:
all: mod test

test:
	@echo "======================================================================"
	@echo "Run race test for ./..."
	go test -cover -race ./

mod:
	@echo "======================================================================"
	@echo "Run MOD"
	GO111MODULE=on GONOSUMDB="*" GOPROXY=direct go mod verify
	GO111MODULE=on GONOSUMDB="*" GOPROXY=direct go mod tidy
	GO111MODULE=on GONOSUMDB="*" GOPROXY=direct go mod vendor
	GO111MODULE=on GONOSUMDB="*" GOPROXY=direct go mod download
	GO111MODULE=on GONOSUMDB="*" GOPROXY=direct go mod verify

clean-cache:
	@echo "clean-cache started..."
	go clean -cache
	go clean -testcache
	@echo "clean-cache complete!"
	@echo "clean-cache complete!"
