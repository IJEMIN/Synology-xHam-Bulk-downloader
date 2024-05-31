# Synology-xHam-Bulk-downloader
Simple youtube-dl scripts to bulk download xHam videos


## Setup

* Install Community FFMPEG from Synocommunity
DSM7 has built-in FFMPEG but it's old one.

### Install Python3 (Python 3.9)

DSM 7 has built-in Python3 (3.8 or something) but that Python3 always require sudo permissions.

* Frist, install Python 3.9 from Package Center

* then remap python3 from built-in python3 to our python3 from terminal connected with nas
```
sudo rm /bin/python3
sudo ln -s /usr/local/bin/python3.9 /bin/python3
```

* install pip with new python3

```python3 -m ensurepip```


