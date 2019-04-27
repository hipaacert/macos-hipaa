echo "Administrator password will be required for security settings, such as FileVault."

# CFR §164.312(a)(2)(iv) & §164.312(e)(2)(ii)
sudo fdesetup enable #Turn on FileVault Full Disk Encryption FIPS 140-2 Compliant https://support.apple.com/en-us/HT207497

# CFR §164.312(b)
sudo perl -p -i -e 's/format=bsd/format=bsd mode=0640 rotate=utc compress file_max=5M ttl=3650/g' "/etc/asl/com.apple.install" #Log installation events for 10 years

# CFR §164.306(a)(3)
defaults write com.apple.CrashReporter DialogType -string "none" #Disable the crash reporter

# CFR §164.312(a)(2)(iii)
sudo pmset -b displaysleep 2 #turn off display after 2 minutes on battery
sudo pmset -c displaysleep 10 #turn off display after 10 minutes on cable power
defaults write com.apple.screensaver askForPassword -int 1 #require password when display off
defaults write com.apple.screensaver askForPasswordDelay -int 10 #delay password requirement 10 seconds

# CFR §164.308(a)(5)(ii)(A) & §164.310(c)
defaults write com.apple.commerce AutoUpdate -bool true # Turn on app auto-update
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1 # Check for software updates daily
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1 # Install System data files & security updates
sudo softwareupdate -ia #install all software updates
