# extract
Short script for data extraction from a rooted Android device. Repository also contains firepwd.py for decrypting login credentials from Firefox browser for Android and ADB binary which is used to connect to an Android device connected to the workstation through USB. 

Script creates three folders - firefox_pass, which contains two files with encrypted passwords from the Firefox browser and a text file with decrypted passwords in plain text. The second folder is named recents and contains screenshots of recent activities from the device. The last folder consists mainly of SQLite3 databases and XML files containing sensitive user data. 

Script works simply by running 
```sh
sh script.sh
```
