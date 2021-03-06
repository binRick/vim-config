all:
	# Init and fetch vundle submodule from github
	git submodule init
	env GIT_SSL_NO_VERIFY=true git submodule update

	# Create neccesary bundle folder if it doesn't already exists
	[ -d ~/.vim/bundle ] || mkdir -p ~/.vim/bundle

	# Backup existing .vimrc if one exists
	[ ! -f ~/.vimrc ] || cp ~/.vimrc .vimrc.bak

	# Copy vundle and and .vimrc
	rsync -a --exclude .git/ .vim/ ~/.vim/
	cp .vimrc ~/.vimrc

	# Update Bundles
	env GIT_SSL_NO_VERIFY=true vim +BundleInstall +qall

clean:
	# Cleanup what was created
	rm -rf ~/.vim/bundle/vundle
	[ ! -f .vimrc.bak ] || cp .vimrc.bak ~/.vimrc
