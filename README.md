# HIPAA Compliance for MacOS
This tool is designed to assist in HIPAA compliance for Apple MacOS computers. Particular consideration for Standard: workstation security, automatic logoff, and encryption. See CFR §164.310(c), §164.312(a)(2)(iii), and §164.312(a)(2)(iv).

## Instructions
* Hit `Command + Space` and type `terminal` to open.
* In terminal, type `sh <(curl -s https://raw.githubusercontent.com/hipaacert/macos-hipaa/master/comply.sh)`
* Hit return and accept the prompts to secure your machine.

Review [comply.sh](/comply.sh) settings to see exactly what actions are performed.

## HIPAA Law Citations
[45 CFR §164.306(a)(2)](https://www.govinfo.gov/content/pkg/CFR-2018-title45-vol1/xml/CFR-2018-title45-vol1-sec164-306.xml)
> Protect against any reasonably anticipated threats or hazards to the security or integrity of such [ePHI].

[45 CFR §164.306(a)(3)](https://www.govinfo.gov/content/pkg/CFR-2018-title45-vol1/xml/CFR-2018-title45-vol1-sec164-306.xml)
> Protect against [disclosures] of such information that are not permitted or required under subpart E of this part.

[45 CFR §164.312(a)(2)(iii)](https://www.govinfo.gov/content/pkg/CFR-2018-title45-vol1/xml/CFR-2018-title45-vol1-sec164-312.xml)
> Implement electronic procedures that terminate an electronic session after a predetermined time of inactivity.

[45 CFR §164.312(b)](https://www.govinfo.gov/content/pkg/CFR-2018-title45-vol1/xml/CFR-2018-title45-vol1-sec164-312.xml)
> Implement [mechanisms] that record and examine activity in information systems that contain or use [ePHI].

[45 CFR §164.312(e)(2)(ii) & §164.312(a)(2)(iv)](https://www.govinfo.gov/content/pkg/CFR-2018-title45-vol1/xml/CFR-2018-title45-vol1-sec164-312.xml)
> Implement a mechanism to encrypt [ePHI] whenever deemed appropriate." & "Implement a mechanism to encrypt and decrypt [ePHI].

[45 CFR §164.310(d)](https://www.govinfo.gov/content/pkg/CFR-2018-title45-vol1/xml/CFR-2018-title45-vol1-sec164-310.xml)
> Maintain a record of the movements of hardware and electronic media and any person responsible therefore.
