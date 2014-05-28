# install my dot files locally
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
	for file in $(find bash/); do
		echo ${file}
	done
	cd -
	echo \* Clean the sources..
	rm -fr hayzer-*/ ${source}
)
