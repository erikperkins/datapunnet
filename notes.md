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
