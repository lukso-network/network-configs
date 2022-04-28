#!/usr/bin/env bash


NETWORK="l16-dev"
PLATFORM="unknown";
NETWORK_VERSION="17"
REPOSITORY="https://raw.githubusercontent.com/lukso-network/network-configs/main/l16/network_setup_kit"

# for Apple M1s
if [ "$(uname -s)" == "Darwin" ] && [ "$(uname -m)" == "arm64" ]
then
ARCHITECTURE="amd64"
else
ARCHITECTURE=$(uname -m)
ARCHITECTURE=${ARCHITECTURE/x86_64/amd64}
ARCHITECTURE=${ARCHITECTURE/aarch64/arm64}
fi
readonly os_arch_suffix="$(uname -s | tr '[:upper:]' '[:lower:]')-$ARCHITECTURE"

PLATFORM=""
case "$OSTYPE" in
darwin*) PLATFORM="darwin" ;;
linux*) PLATFORM="linux" ;;
msys*) PLATFORM="windows" ;;
cygwin*) PLATFORM="windows" ;;
*) exit 1 ;;
esac
readonly PLATFORM

if [ "$PLATFORM" == "windows" ]; then
    ARCHITECTURE="amd64.exe"
elif [[ "$os_arch_suffix" == *"arm64"* ]]; then
    ARCHITECTURE="arm64"
fi

if [[ "$ARCHITECTURE" == "armv7l" ]]; then
    color "31" "32-bit ARM is not supported. Please install a 64-bit operating system."
    exit 1
fi

download() {
  URL="$1";
  LOCATION="$2";
  if [[ $PLATFORM == "linux" ]]; then
    wget -O $LOCATION $URL;
  fi

  if [[ $PLATFORM == "darwin" ]]; then
    curl -o $LOCATION -Lk $URL;
  fi
}



# download eth2 validator tool and give exec permission
download https://github.com/lukso-network/lukso-cli/releases/download/v0.0.1-dev/lukso-cli-${PLATFORM}-${ARCHITECTURE} ./lukso-cli
chmod +x ./lukso-cli


echo ""
echo "#################### Please Read Carefully ####################"
echo "use \"lukso-cli --help\" to check available options"
echo "###############################################################"

