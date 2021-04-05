# install my dot files locally
SOURCE=my-dot-files.tar.gz

function msg () {
   echo \* $1
}

# Backup old environment
msg "Backup old environment"
if [ -e ${HOME}/.bashrc ]; then
    mv ${HOME}/.bashrc ${HOME}/.OLD_BASHRC
fi

if [ -e ${HOME}/.bash_profile ]; then
    mv ${HOME}/.bash_profile ${HOME}/.OLD_BASH_PROFILE
fi

if [ -e ${HOME}/.profile ]; then
    mv ${HOME}/.profile ${HOME}/.OLD_PROFILE
fi

(
	cd /tmp
	msg "Downloading dot files"
	curl -s -L -o ${SOURCE} http://github.com/hayzer/my-dot-files/tarball/master
	msg "Opening archive"
	tar zxf ${SOURCE}
	msg "Update bash environment"
	cd hayzer-*/
	for file in $(find bash/ -type f); do
		cp ${file} ${HOME}/.${file#bash/}
	done
	msg "Clean the sources"
	rm -fr hayzer-*/ ${SOURCE}
)
exit 0
