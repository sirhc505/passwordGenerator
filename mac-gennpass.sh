# ------------------------------------------------------------------------------
#  Title: win-genpass.ps1
# ------------------------------------------------------------------------------
#  Purpose:
#          This will generate a human readable password that can be 
#          typed and remembered but is also complex enough so that
#          it cannot be practically guessed using password cracker
#          or similar.
# ------------------------------------------------------------------------------
# NOTES:
#        This app depends on https://random-word-api.herokuapp.com
#        being up and reachable. If the site goes down than this
#        script will fail to work. It will at some point..
#
#        They all do :(
#
# ------------------------------------------------------------------------------
# Variables
#           MIN_WORD_LEN: will set the minimum length of any of the selected
#           words. So if set to 5 then words like `food` would be ignored from
#           the dictionary. I would recommend not choosing a setting under 7
#
#           NUM_OF_WORDS: This specifies the number of words to return as 
#           part of the password. If you use a longer word length (eq 8 / 9)
#           then it would be safe to choose something smaller such as 5
#
#           WORD_SPACER: Most passwords require a special character so this is
#           where you can specify what it is. The following: $%@!., are almost 
#           universally accepted but may need to be adjusted for your use case.
#
#           MIN_RND_NUM & MAX_RND_NUM: Set the minimum and maximum 
#           range to randomly choose a number from.
#
# Example:
#           So with 7 / 7 / . / 1 / 50 you could get the following password
#           Tubaist.Placard.Perused.Amotion.Plaints.Copalms.Scutate.11
# ------------------------------------------------------------------------------

MIN_WORD_LEN=7
NUM_OF_WORDS=7
WORD_SPACER="."

MIN_RND_NUM=1
MAX_RND_NUM=50

# Get Random Number
ENDING=`awk -v min=$MIN_RND_NUM -v max=$MAX_RND_NUM 'BEGIN{srand(); print int(min+rand()*(max-min+1))}'`


# Make API Call
JSON_LIST=`curl "https://random-word-api.herokuapp.com/word?length=$MIN_WORD_LEN&number=$NUM_OF_WORDS"`

# Convert Password list to Base Password using the separator specified in WORD_SPACER
BASE_PW=`echo $JSON_LIST | jq -c 'map( (.[0:1] | ascii_upcase) + .[1:] )' | tr -d '""' | tr -d '[]' | sed -r "s/,/$WORD_SPACER/g"`

# Build and display final password
echo $BASE_PW$WORD_SPACER$ENDING


