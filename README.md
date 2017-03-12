### Python

This project has a number of python dependencies used in testing. Additionally
it requires ansible 2.1, not the latest 2.2 for now. To install the needed
files, run the following commands.

```
virtualenv venv --python python2.7
source venv/bin/activate
pip install -r requirements.txt
```

Note that `source venv/bin/activate` needs to be run for every shell-
session in which you want to work with this project.

### Local deployment to stage

the ssh-key for the manual-ci-user must be saved in `.sshkey`. The key is stored in a secret [gitlab variable](https://git.uber.space/uberspace/manual/variables/14).


```
./run-local.sh
```

The created URL will be shown after the build is suceeded, e.g.:

```
Sunday 12 March 2017  10:33:57 +0100 (0:00:03.433)       0:00:10.851 ********** 
=============================================================================== 
TASK: copy manual to host ----------------------------------------------- 3.65s
TASK: create .htaccess -------------------------------------------------- 3.43s
TASK: setup ------------------------------------------------------------- 1.81s
TASK: create document root ---------------------------------------------- 1.57s
TASK: Drop private-key -------------------------------------------------- 0.27s
TASK: Add manual host to ansible inventory ------------------------------ 0.07s

check out http://local-MacBook-Pro-e8996e1.docs.corona.uberspace.de
```

### Local building
```
make html
```

The HTML pages are in `_build/html`
