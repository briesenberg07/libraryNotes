### WSL Note
- Directories/files in the WSL home directory are write-protected
- I learned this this morning when trying to run Pyshacl using a data graph and shape graph that I had stored there
- When I moved these to my Windows home directory I was able to run the pyShacl command (!)

### Atom Note
- I disabled autocorrect because it was bugging me in **Settings** > **Packages**
![acApi](https://github.com/briesenberg07/libraryNotes/blob/master/images/acApi.png)

### Uninstalling Alexis' shaclgen
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

## ~~~Starting Over (Again)~~~ with Windows Subsystem for Linux
- Uninstall
- Check that my WSL home folder is gone
 - (What about previous WSL home folders? Are any of them hanging around?)

### (Re)install Ubuntu 18.04 for WSL
- Reminder--to get to Windows files from the Ubuntu CLI start with `/mnt/c`
- Getting git up and running (again)
```
$ git config --global user.email "ries07@uw.edu"
$ git config --global user.name "briesenberg07"
```
- Note that I still need to save UN and password locally for easier pushes

### Python *in* WSL
- `python3 -V`: Python 3.6.7
- `pip3`: Command 'pip3' not found, but can be installed with: `sudo apt install python3-pip`
 - So now **I'm going to run that command**
- Dang! `E: Unable to locate package python3-pip`

#### Install pip for Python 3 in Ubuntu 18.04 on WSL (whew)
[How to Install Pip on Ubuntu 18.04](https://linuxize.com/post/how-to-install-pip-on-ubuntu-18.04/)
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
- Now on to...

### Creating a *Quick access* link to my Ubuntu home directory
- Per [UPDATED: Windows 10 Subsystem for Linux (WSL) for Python developers](https://www.betteridiot.tech/blog/pop/2019/9/updated-windows-10-subsystem-for-linux-wsl-for-python-developers)
- The path to my WSL Ubuntu home directory:
```
C:\Users\ries07\AppData\Local\Packages\CanonicalGroupLimited.Ubuntu18.04onWindows_79rhkp1fndgsc\LocalState\rootfs\home\ries07nix
```
- Added this to *Quick access*
- *Now to try Pyshacl!!*
---
### Other resources
- [Python setup on the Windows subsystem for Linux (WSL)](https://medium.com/@rhdzmota/python-development-on-the-windows-subsystem-for-linux-wsl-17a0fa1839d) (Meh.)
- [How to Install Python 3.7 on Windows 10 (Ubuntu Subsystem)](https://youtu.be/ueBJnCOcbI4): Helped some. Mostly reminded me to check and see how to properly check my version of Python in the terminal. There is a difference between `python3 -v` and `python3 -V`!

### Git trick
Try this in bash to find deleted files in git:
`git log --diff-filter=D --summary`
