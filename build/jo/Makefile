PKGDIR=$(realpath pkg)
TAG=latest
NOCACHE=

package:
	docker build --no-cache --tag jo-build:latest .
	docker run --rm -v ${PWD}/pkg:/pkg -it jo-build:latest cp jo /pkg

