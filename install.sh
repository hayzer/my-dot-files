# install my dot files locally
home=${HOME}
source=my-dot-files.tar.gz

(
	cd /tmp
	echo \* Downloading..
	curl -s -L -o ${source} http://github.com/hayzer/my-dot-files/tarball/master
	echo \* Opening archive..
	tar zxf ${source}
	echo \* Update bash environment
	cd hayzer-*/
	for file in $(find bash/ -type f); do
		cp ${file} ${home}/.${file#bash/}
	done
	echo \* Update vim configuration
	mkdir -p ${home}/.vim/colors
	cp -r vim/vim_colors/* ${home}/.vim/colors/
	cd - > /dev/null
	echo \* Clean the sources..
	rm -fr hayzer-*/ ${source}
)
