# Uberspace 7 manual

We want our users to read the fine manual. So here it is!

## Setup

```
git clone --recursive git@git.uber.space:uberspace/manual.git
```

### Python

This project has a number of python dependencies. To install the needed
files, run the following commands.

```
virtualenv venv --python python2.7
source venv/bin/activate
pip install -r requirements.txt
```

Note that `source venv/bin/activate` needs to be run for every shell-
session in which you want to work with this project.

## Repository Structure

* `*.yml`: playbooks used by the CI to build/deploy/delete sphinx documents.
* `lang`: root directory for `.rst` files. As we provide different languages, this folder contains different sphinx projects: `en` and `de`.
* `_static` and `logo`: these are our custom changes to the `sphinx_rtd_theme` theme.
* `conf.py` and `Makefile`: sphinx configuration and makefile used by both projects.
* `run-local.sh`: Emulates the CI on a local machine. 

## Procedure

1. Open issues for articles to revise. This process will be automated from the Uberspace 7 code repo in the future.
2. Revise and assign issues and open a new branch for each issue that needs documentation. Close issues that don't need any action.
3. Checkout the branch that gets created with the issue.
4. Write pretty documentation. Keep in mind that we're doing English first and German afterwards. *Only* change files that correspond to the issue.
5. Commit your changes in your branch and check the staging environment.
6. repeat.
7. When you're happy create a [merge request](https://git.uber.space/uberspace/manual/merge_requests/new) and assign it to kim. Source branch is your working branch, target branch is master.
8. When Kim is happy the merge request gets accepted.
9. When Kim is not happy go to 4. Communicate and discuss in the issues comments.

When the manual sprint is done Kim merges the `master` branch into the `stable` branch. https://manual.uberspace.de gets updated with the `stable` branch by the CI.

## Deployment

### CI

Every branch gets its own [staging environment](https://git.uber.space/uberspace/manual/environments). Unfold `manual` and click the ![open](images/open.png) button to see the staging environment.

Every commit updates the staging environment within a few minutes. The CI posts into Slack channel #uberspace-manual when the build is done.

Staging environments get removed automagically when the branch is merged or deleted.

### Local building
```
make html
```

The HTML pages will be saved to `_build/html`

### Local deployment to stage

*Should not be used because the CI does not know about the staging URLs and can't delete the corresponding folders!* That's more of a backup in case the CI is broke.

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
