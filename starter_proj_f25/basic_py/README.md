
## Update your packages:

```bash
sudo apt update
```

## Install python:

```bash
sudo apt install python3.13 python3-pip
```


## Update bashrc path (Windows w/ WSL only):

```bash
cd
```

```bash
explorer.exe .
```

Right click and edit `.bashrc` file in a text editor (Vscode, notepad, etc.)

Add the following line at the bottom (Replace with your uniquename) and then save.

```bash
export PATH="$PATH:/home/<your_linux_username>/.local/bin"
```

Then run

```bash
source ~/.bashrc
```


## Verify it worked

```bash
python3 --version
pip3 --version
```

It should should say something like 

```
Python 3.12.6
pip 25.0.1 from /home/jodab/.local/lib/python3.12/site-packages/pip (python 3.12)
```