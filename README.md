# Password Generator

## Purpose

This will generate a human readable password that can be 
typed and remembered but is also complex enough so that
it cannot be practically guessed using password cracker
or similar.

## Notes

This app depends on https://random-word-api.herokuapp.com
being up and reachable. If the site goes down than this
script will fail to work. It will at some point..

They all do :(

## Variables - Mac

- **MIN_WORD_LEN**: will set the minimum length of any of the selected words. So if set to 5 then words like `food` would be ignored from the dictionary. I would recommend not choosing a setting under 7
- **NUM_OF_WORDS**: This specifies the number of words to return as part of the password. If you use a longer word length (eq 8 / 9) then it would be safe to choose something smaller such as 5
- **WORD_SPACER**: Most passwords require a special character so this is where you can specify what it is. The following: $%@!., are almost 
universally accepted but may need to be adjusted for your use case.
- **MIN_RND_NUM** & **MAX_RND_NUM**: Set the minimum and maximum range to randomly choose a number from.



## Variables - Windows

- **intMinWordLen**: will set the minimum length of any of the selected words. So if set to 5 then words like `food` would be ignored from the dictionary. I would recommend not choosing a setting under 7
- **intNumOfWords**: This specifies the number of words to return as part of the password. If you use a longer word length (eq 8 / 9) then it would be safe to choose something smaller such as 5
- **strWordSep**: Most passwords require a special character so this is where you can specify what it is. The following: $%@!., are almost universally accepted but may need to be adjusted for your use case.
- **intMinRandNumber** & **intMaxRandNumber**: Set the minimum and maximum range to randomly choose a number from.


## Example:

So with `7` / `7` / `.` / `1` / `50` you could get the following password

```
Tubaist.Placard.Perused.Amotion.Plaints.Copalms.Scutate.11
```
## Versions

- v1 created by chris dot tarricone at gmail dot com 2025