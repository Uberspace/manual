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

### Building
```
sphinx-build lang/en html/en
sphinx-build lang/de html/de
```
