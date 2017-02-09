To get data from S3, do

import boto3
s3 = boto3.resource('s3')
data = s3.Object('bucket-name', 'path/to/object').get()['Body'].read()


To read an image directly into memory, do

import boto3
import Image
from StringIO import StringIO

s3 = boto3.resource('s3')
body = s3.Object('bucket-name', 'path/to/object').get()['Body'].read() # octet-stream
bytes = bytearray(body) # Convert octet-stream to bytearray
image = Image.open(StringIO(bytes)) # Convert bytearray to image
image.show()


To remove a Git submodule:

* Delete the relevant section from .gitmodules:

  [submodule "deleteme"]
    path = deleteme
    url = git://github.com/username/deleteme.git

* Stage the .gitmodules changes

  git add .gitmodules

* Delete the relevant section from .git/config

  [submodule "deleteme"]
    url = git://github.com/username/deleteme.git

* Run (ensure there is no trailing slash)

  git rm --cached path/to/submodule

* Commit

* Delete the submodule directory

  rm -rf path/to/submodule


To install docker and docker-compose, do

curl -fsSL https://yum.dockerproject.org/gpg | sudo apt-key add -
apt-key fingerprint 58118E89F3A912897C070ADBF76221572C52609D
sudo add-apt-repository \
       "deb https://apt.dockerproject.org/repo/ \
       ubuntu-$(lsb_release -cs) \
       main"
sudo apt-get update
sudo apt-get -y install docker-engine
sudo curl -L "https://github.com/docker/compose/releases/download/1.10.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose
sudo groupadd docker
sudo gpasswd -a ${USER} docker
sudo service docker restart

then log out and log back in.
