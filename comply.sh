echo "Administrator password will be required for security settings, such as FileVault."

# 45 CFR §164.306(a)(2)
# https://www.govinfo.gov/content/pkg/CFR-2018-title45-vol1/xml/CFR-2018-title45-vol1-sec164-306.xml
# "Protect against any reasonably anticipated threats or hazards to the security or integrity of such [ePHI]."
defaults write com.apple.commerce AutoUpdate -bool true # Turn on app auto-update
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1 # Check for software updates daily
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1 # Install System data files & security updates
sudo softwareupdate -ia #install all software updates

# 45 CFR §164.306(a)(3)
# https://www.govinfo.gov/content/pkg/CFR-2018-title45-vol1/xml/CFR-2018-title45-vol1-sec164-306.xml
# "Protect against [disclosures] of such information that are not permitted or required under subpart E of this part."
defaults write com.apple.CrashReporter DialogType -string "none" #Disable the crash reporter

# 45 CFR §164.312(a)(2)(iii)
# https://www.govinfo.gov/content/pkg/CFR-2018-title45-vol1/xml/CFR-2018-title45-vol1-sec164-312.xml
# "Implement electronic procedures that terminate an electronic session after a predetermined time of inactivity."
sudo pmset -b displaysleep 2 #turn off display after 2 minutes on battery
sudo pmset -c displaysleep 10 #turn off display after 10 minutes on cable power
defaults write com.apple.screensaver askForPassword -int 1 #require password when display off
defaults write com.apple.screensaver askForPasswordDelay -int 10 #delay password requirement 10 seconds

# 45 CFR §164.312(b)
# https://www.govinfo.gov/content/pkg/CFR-2018-title45-vol1/xml/CFR-2018-title45-vol1-sec164-312.xml
# "Implement [mechanisms] that record and examine activity in information systems that contain or use [ePHI]."
sudo perl -p -i -e 's/format=bsd/format=bsd mode=0640 rotate=utc compress file_max=5M ttl=3650/g' "/etc/asl/com.apple.install" #Log installation events for 10 years

# 45 CFR §164.312(e)(2)(ii) & §164.312(a)(2)(iv)
# https://www.govinfo.gov/content/pkg/CFR-2018-title45-vol1/xml/CFR-2018-title45-vol1-sec164-312.xml
# "Implement a mechanism to encrypt [ePHI] whenever deemed appropriate." & "Implement a mechanism to encrypt and decrypt [ePHI]."
sudo fdesetup enable #Turn on FileVault Full Disk Encryption FIPS 140-2 Compliant https://support.apple.com/en-us/HT207497

# 45 CFR §164.310(d)
# https://www.govinfo.gov/content/pkg/CFR-2018-title45-vol1/xml/CFR-2018-title45-vol1-sec164-310.xml
# Maintain a record of the movements of hardware and electronic media and any person responsible therefore.
FULLSERIAL=$(system_profiler SPHardwareDataType | sed '/^ *Serial Number (system):*/!d;s###;s/ //') # Get the Apple 12 digit serial number
UNIQUEPARTOFSERIAL=$(echo $FULLSERIAL | cut -c 6-8) # Get the 3 unique digits from the serial number https://www.macrumors.com/2010/04/16/apple-tweaks-serial-number-format-with-new-macbook-pro/
sudo scutil --set ComputerName $UNIQUEPARTOFSERIAL # Set short name based  on serial number
sudo scutil --set HostName $UNIQUEPARTOFSERIAL # Set short name based  on serial number
sudo scutil --set LocalHostName $UNIQUEPARTOFSERIAL # Set short name based  on serial number
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $UNIQUEPARTOFSERIAL # Set short name based  on serial number
