PKGDIR=$(realpath pkg)
TAG=latest
NOCACHE=

package:
	docker build ${NOCACHE} build -t jo
	docker run --rm -v ${PKGDIR}:/build jo

%: package
	docker build ${NOCACHE} . -t jo:${TAG}

