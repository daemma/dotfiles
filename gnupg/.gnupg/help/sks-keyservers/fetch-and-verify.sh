#!  /usr/bin/env bash
### ############################################################################
##! @file       fetch-and-verify.sh
##! @brief      Fetch (retrieve) and verify  
##! @author     0xD62EE11516877AA8
##! @date       2015-03-07
##! @copyright  GPLv3+
##
## Get sks-keyservers.netCA.pem from (0xFC3B17DE05E136A0):
##   https://sks-keyservers.net/sks-keyservers.netCA.pem
##   https://sks-keyservers.net/sks-keyservers.netCA.pem.asc
## We use Tor for key-retrieval:
##   socks5-hostname://127.0.0.1:9050
##

# ## +++++++++++++++++++++++++++++++++++++
# ## Download the signing key (over Tor)
# echo "Downloading 0xFC3B17DE05E136A0 ... "
# gpg --recv-keys 0xFC3B17DE05E136A0

## +++++++++++++++++++++++++++++++++++++
## Download the certificate over Tor
echo
echo "Downloading sks-keyservers.netCA.pem ... "
curl --socks5-hostname 127.0.0.1:9050  \
     --output sks-keyservers.netCA.pem \
     https://sks-keyservers.net/sks-keyservers.netCA.pem

## +++++++++++++++++++++++++++++++++++++
## Download the certificate signature over Tor
echo
echo "Downloading sks-keyservers.netCA.pem.asc ... "
curl --socks5-hostname 127.0.0.1:9050  \
     --output sks-keyservers.netCA.pem.asc \
     https://sks-keyservers.net/sks-keyservers.netCA.pem.asc

## +++++++++++++++++++++++++++++++++++++
## Verify the signature of the certificate
echo
echo "Verifying certificate signature ... "
gpg --verify sks-keyservers.netCA.pem.asc sks-keyservers.netCA.pem


### end fetch-and-verify.sh
### ############################################################################
