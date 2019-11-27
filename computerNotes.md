## git
### git > Providing username + email; storing credentials
- Provide username and email
```
$ git config --global user.email "ries07@uw.edu"
$ git config --global user.name "briesenberg07"
```
- Save UN and password locally so I won't have to enter for every push
  - Using [EXAMPLES](https://git-scm.com/docs/git-credential-store#_examples) from git documentation, git-credential-store - Helper to store credentials on disk  
```
$ git config credential.helper store
$ git push http://example.com/repo.git
Username: <type your username>
Password: <type your password>
[several days later]
$ git push http://example.com/repo.git
[your credentials are used automatically]
```
### git: Find deleted files
Try this in bash to find deleted files in git:
`git log --diff-filter=D --summary`
### git > Syncing my clone with the upstream repository
- I've done this a million times but I have to look it up every time!
- A couple of resources, each slightly different:
   - [Syncing a fork](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/syncing-a-fork): This is what I've used in the past and will use again right now
   - [Merging an upstream repository into your fork](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/merging-an-upstream-repository-into-your-fork): This is slightly different from what I've done in the past...
### git > Revert a single file back to the current repo state
`git checkout -- scripts/json2xml.xsl`
- Where `scripts/json2xml.xsl` is the filepath to the file I want to revert
---
## Atom
### Atom > Notes
- I disabled autocorrect because it was bugging me in **Settings** > **Packages**
![acApi](https://github.com/briesenberg07/libraryNotes/blob/master/images/acApi.png)
- Also (?) disabled autocomplete-plus

---
## WSL / Windows Subsystem for Linux
### WSL > Install [Apache Jena](https://jena.apache.org/index.html) for use in the WSL
- [Download](https://jena.apache.org/download/index.cgi#apache-jena)
- Unzip to ries07 directory
- In **Command-line and other tools for Jena developers**, follow directions for [Setting up your Environment](https://jena.apache.org/documentation/tools/#setting-up-your-environment)
```
$ export JENA_HOME=/mnt/c/Users/ries07/apache-jena-3.13.1/
$ export PATH=$PATH:$JENA_HOME/bin
```
- Wow it looks like it worked(!):
```
$ sparql --version
Jena:       VERSION: 3.13.1
Jena:       BUILD_DATE: 2019-10-06T18:57:39+0000
```
### WSL > Apache Jena > Learn to use ARQ:
- [Jena documentation overview](https://jena.apache.org/documentation/)
  - A ha: [ARQ - Command Line Applications](https://jena.apache.org/documentation/query/cmds.html)
    - Hmm... No, something's not right:  
    ```
    $ arq.query --help
    arq.query: command not found
    ```
- [ARQ - Basic Federated SPARQL Query](https://jena.apache.org/documentation/query/service.html)
- ...
**Questions**
- Need Java Development environment? If so, check and install from WSL Ubuntu terminal? Current status:  
```
$ java --version
openjdk 11.0.4 2019-07-16
OpenJDK Runtime Environment (build 11.0.4+11-post-Ubuntu-1ubuntu218.04.3)
OpenJDK 64-Bit Server VM (build 11.0.4+11-post-Ubuntu-1ubuntu218.04.3, mixed mode, sharing)
```
### WSL > Notes
- Directories/files in the WSL home directory are write-protected
- I learned this this morning when trying to run Pyshacl using a data graph and shape graph that I had stored there
- When I moved these to my Windows home directory I was able to run the pyShacl command (!)
- Also, when looking at WSL-related stuff I keep seeing **DON'T CHANGE ANYTHING IN THE WSL DIRECTORY**
### WSL > (Re)install Ubuntu 18.04 for WSL
- Reminder--to get to Windows files from the Ubuntu CLI start with `/mnt/c`
### WSL > Creating a *Quick access* link to my Ubuntu home directory
- Per [UPDATED: Windows 10 Subsystem for Linux (WSL) for Python developers](https://www.betteridiot.tech/blog/pop/2019/9/updated-windows-10-subsystem-for-linux-wsl-for-python-developers)
- The path to my WSL Ubuntu home directory:
```
C:\Users\ries07\AppData\Local\Packages\CanonicalGroupLimited.Ubuntu18.04onWindows_79rhkp1fndgsc\LocalState\rootfs\home\ries07nix
```
- Added this to *Quick access*
### WSL > Python
- `python3 -V`: Python 3.6.7
#### WSL > Python > Install pip for Python 3 in Ubuntu 18.04
- `pip3`: Command 'pip3' not found, but can be installed with: `sudo apt install python3-pip`
  - So now **I'm going to run that command**
  - Dang! `E: Unable to locate package python3-pip`
- [How to Install Pip on Ubuntu 18.04](https://linuxize.com/post/how-to-install-pip-on-ubuntu-18.04/)
  - My thinking here is, "Let's try installing this just as if I was running an Ubuntu OS, not just Ubuntu in the WSL, and see what happens."
```
$ sudo apt update
$ apt list --upgradable
```
- `$ sudo apt update` seemed alright, except it told me that 126 packages could be upgraded, and told me that I could list them using the `--upgradable` command, but then didn't tell me how to actually do this (upgrade the packages!)
- But then I **was** able to do the following, so `sudo apt update` did something
```
$ sudo apt install python3-pip
```
- But this is working now! Currently installing!
 - So `sudo apt update` *did* do something!?
- Up next:
```
$ pip3 install rdfLib
$ pip3 install Pyshacl
```
- Done
#### WSL > Python > Uninstalling Alexis' shaclgen
- For until I can install it using pip3
- *NOTE* Does this following output give me hints about my PATH!?
```
ries07nix@LIB-KLINDLANPC:/mnt/c/Users/ries07$ pip3 uninstall shaclgen
Uninstalling shaclgen-0.1.0:
  /home/ries07nix/.local/bin/shaclgen
  /home/ries07nix/.local/lib/python3.6/site-packages/shaclgen-0.1.0.egg-info
  /home/ries07nix/.local/lib/python3.6/site-packages/shaclgen/__main__.py
  /home/ries07nix/.local/lib/python3.6/site-packages/shaclgen/__pycache__/__main__.cpython-36.pyc
  /home/ries07nix/.local/lib/python3.6/site-packages/shaclgen/__pycache__/prefixes.cpython-36.pyc
  /home/ries07nix/.local/lib/python3.6/site-packages/shaclgen/__pycache__/shaclgen.cpython-36.pyc
  /home/ries07nix/.local/lib/python3.6/site-packages/shaclgen/prefixes.py
  /home/ries07nix/.local/lib/python3.6/site-packages/shaclgen/shaclgen.py
Proceed (y/n)? y
  Successfully uninstalled shaclgen-0.1.0
```
#### WSL > Python > Other resources
- [Python setup on the Windows subsystem for Linux (WSL)](https://medium.com/@rhdzmota/python-development-on-the-windows-subsystem-for-linux-wsl-17a0fa1839d) (Meh.)
- [How to Install Python 3.7 on Windows 10 (Ubuntu Subsystem)](https://youtu.be/ueBJnCOcbI4): Helped some. Mostly reminded me to check and see how to properly check my version of Python in the terminal. There is a difference between `python3 -v` and `python3 -V`!
#### WSL > Python > More pyShacl!
- Interesting to note: I just used the -o/--output option with pyshacl CLI, and I had to create the directory and an empty file (with filename to specify in command) in order to get the output option to work.
- (Later) This ^^ is no longer the case. I can simply specify the directory/filename in the command as you would think to do.
