###
# BASICS
###

SHARED_DIR=$1

if [ -f "$SHARED_DIR/install_scripts/config" ]; then
  . $SHARED_DIR/install_scripts/config
fi

cd $HOME_DIR

# Update
apt-get -y update && apt-get -y upgrade

# SSH, build tools, git, vim, wget, and curl
apt-get -y install \
	openssh-server \
	build-essential \
	git \
	vim \
	wget \
	curl
