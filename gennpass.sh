
# https://random-word-api.herokuapp.com/word?length=7&number=5

MIN_WORD_LEN=5
NUM_OF_WORDS=7
WORD_SPACER="."

MIN_RND_NUM=1
MAX_RND_NUM=50
ENDING=`awk -v min=$MIN_RND_NUM -v max=$MAX_RND_NUM 'BEGIN{srand(); print int(min+rand()*(max-min+1))}'`


# DEBUG
JSON_LIST=`curl "https://random-word-api.herokuapp.com/word?length=$MIN_WORD_LEN&number=$NUM_OF_WORDS"`

echo "Got wordlist : $JSON_LIST"

BASE_PW=`echo $JSON_LIST | jq -c 'map( (.[0:1] | ascii_upcase) + .[1:] )' | tr -d '""' | tr -d '[]' | sed -r "s/,/$WORD_SPACER/g"`

echo $BASE_PW$WORD_SPACER$ENDING


