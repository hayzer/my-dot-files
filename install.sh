# install my dot files locally
home=${HOME}
source=my-dot-files.tar.gz

(
	cd /tmp
	curl -s -L -o ${source} http://github.com/hayzer/my-dot-files/tarball/master
	tar zxf ${source}
	cd hayzer-*/
	ls -la
	cd -
	rm -fr hayzer-*/ ${source}
)
