### Windows Subsystem for Linux (WSL)
- [Windows Subsystem for Linux Documentation](https://docs.microsoft.com/en-us/windows/wsl/about)
- [User Accounts and Permissions for Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/user-support?redirectedfrom=MSDN)
### WSL - Python
#### [UPDATED: Windows 10 Subsystem for Linux (WSL) for Python developers](https://www.betteridiot.tech/blog/pop/2019/9/updated-windows-10-subsystem-for-linux-wsl-for-python-developers)  

> Once the setup step is complete, Ubuntu will asks you for a Username and password, and you have two choices:  
>  - close it (if you want to be root by default)  
>  - fill it out (if you don't want to be root by default)  
> Whichever you choose is up to you, and the only real things this affects (since this is your own computer and not a shared system) is what your $HOME directory will be named and whether or not you have to type su[do] for some commands.  
> I, personally, use the first method (I think I just gave a sysadmin an aneurysm somewhere).  

 - Thought about being root by default, but this made me nervous, so I'm going with the second option.
- **Holy crap! This article provides THE PATH!!** [See below](https://github.com/briesenberg07/libraryNotes/blob/master/computerNotes.md#creating-a-quick-access-link-to-my-ubuntu-home-directory)  
- The post above refers to:
> We want to make Ubuntu have some good creature comforts and allow it act responsively with Windows programs. To do this, I have created a helpful [GitHub repository](https://github.com/betteridiot/terminal_support) chock-full of useful settings that you don't have to agonize over.  

[betteridiot/terminal_support](https://github.com/betteridiot/terminal_support)
*2019-10-31: I did not finish with all the steps in the article, I stopped at **Step 4: Making Ubuntu's $HOME feel like home***
- Python 3.6.7 was already installed  
- Tried to uninstall and install 3.7, failed
#### Install Anaconda on WSL
[@kauffmanes kauffmanes/install_anaconda.md](https://gist.github.com/kauffmanes/5e74916617f9993bc3479f401dfec7da)
- `$ wget https://repo.continuum.io/archive/Anaconda2-2019.10-Linux-x86_64.sh`
- `$ bash Anaconda2-2019.10-Linux-x86_64.sh`
- `$ which python`: This gives `/home/ries07nix/anaconda2/bin/python`, which is as it should be ("a path that has anaconda in it")
#### Install Python libraries recommended by Alexis KM
- `$ pip install rdfLib`: It worked--I didn't even know that I had pip...
- `$ pip install Pyshacl`: It worked
#### Install Spyder on WSL
[Anaconda Python + Spyder on Windows Subsystem for Linux](https://www.scivision.dev/anaconda-python-with-windows-subsystem-for-linux/)
- `$ sudo apt install libxcomposite libxss1`
- **NO** not succeeding here... Don't want to try and install VcXsrv Windows X Server and all of that...
How about this:  
[Upgrading Windows Subsystem Linux (WSL)](http://notebook.chaopricha.com/?p=116)
- Tried `$ spyder`: But no, it doesn't look like it was installed along with Anaconda

### ~~~Starting Over (Again)~~~
#### Windows Subsystem for Linux
- Uninstall
- Check that my WSL home folder is gone
 - (What about previous WSL home folders? Are any of them hanging around?)
#### (Re)install Ubuntu 18.04 for WSL
- Reminder--to get to Windows files from the Ubuntu CLI start with `/mnt/c`
- Getting git up and running (again)
```
$ git config --global user.email "ries07@uw.edu"
$ git config --global user.name "briesenberg07"
```
- Note that I still need to save UN and password locally for easier pushes
#### Python *in* WSL
- `python3 -V`: Python 3.6.7
- `pip3`: Command 'pip3' not found, but can be installed with: `sudo apt install python3-pip`
 - So now **I'm going to run that command**
- Dang! `E: Unable to locate package python3-pip`
### Install pip for Python 3 in Ubuntu 18.04 on WSL (whew)
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
- Now on to:
#### Creating a *Quick access* link to my Ubuntu home directory
- Per [UPDATED: Windows 10 Subsystem for Linux (WSL) for Python developers](https://www.betteridiot.tech/blog/pop/2019/9/updated-windows-10-subsystem-for-linux-wsl-for-python-developers)
- The path to my WSL Ubuntu home directory:
```
C:\Users\ries07\AppData\Local\Packages\CanonicalGroupLimited.Ubuntu18.04onWindows_79rhkp1fndgsc\LocalState\rootfs\home\ries07nix
```
- Added this to *Quick access*
- *Now to try Pyshacl!!*
---
#### Other resources
- [Python setup on the Windows subsystem for Linux (WSL)](https://medium.com/@rhdzmota/python-development-on-the-windows-subsystem-for-linux-wsl-17a0fa1839d) (Meh.)
- [How to Install Python 3.7 on Windows 10 (Ubuntu Subsystem)](https://youtu.be/ueBJnCOcbI4): Helped some. Mostly reminded me to check and see how to properly check my version of Python in the terminal. There is a difference between `python3 -v` and `python3 -V`!
