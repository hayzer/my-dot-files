# install my dot files locally
set +x
home=${HOME}
source=my-dot-files.tar.gz

(
	cd /tmp
	echo \* Downloading..
	curl -s -L -o ${source} http://github.com/hayzer/my-dot-files/tarball/master
	echo \* Opening archive..
	tar zxf ${source}
	echo \* Doing something..
	cd hayzer-*/
	path=$(pwd)
	echo \* The path is ${path}
	ls -la
	cd -
	echo \* Clean the sources..
	rm -fr hayzer-*/ ${source}
)

set -x
