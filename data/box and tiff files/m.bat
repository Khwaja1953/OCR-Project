@echo off
type *.box | for /f "tokens=1" %%a in ('findstr /r /v "^$"') do @echo %%a >> temp_wordlist.txt
sort temp_wordlist.txt /unique > wordlist.txt
del temp_wordlist.txt
echo Wordlist created as wordlist.txt