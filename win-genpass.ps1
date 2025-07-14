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
#           intMinWordLen: will set the minimum length of any of the selected
#           words. So if set to 5 then words like `food` would be ignored from
#           the dictionary. I would recommend not choosing a setting under 7
#
#           intNumOfWords: This specifies the number of words to return as 
#           part of the password. If you use a longer word length (eq 8 / 9)
#           then it would be safe to choose something smaller such as 5
#
#           strWordSep: Most passwords require a special character so this is
#           where you can specify what it is. The following: $%@!., are almost 
#           universally accepted but may need to be adjusted for your use case.
#
#           intMinRandNumber & intMaxRandNumber: Set the minimum and maximum 
#           range to randomly choose a number from.
#
# Example:
#           So with 7 / 7 / . / 1 / 50 you could get the following password
#           Tubaist.Placard.Perused.Amotion.Plaints.Copalms.Scutate.11
# ------------------------------------------------------------------------------

$intMinWordLen = 7
$intNumOfWords = 7

$strWordSep = "."

$intMinRandNumber = 1
$intMaxRandNumber = 50

# Build the API Call
$strApiUrl = [string]::Format("https://random-word-api.herokuapp.com/word?length={0}&number={1}", $intMinWordLen, $intNumOfWords)
$headers = @{
    "Accept"        = "application/json"
}

# Make the API Call
$fhResult = Invoke-RestMethod -Uri $strApiUrl -Headers $headers -Method Get
$fhResult | ConvertTo-Json

# Loop through each item and build the string
foreach ($item in $fhResult) {

    $pwdWord = (Get-Culture).TextInfo.ToTitleCase( $item.ToLower() )
    $pwdString = [string]::Format("{0}{1}{2}", $pwdString,  $pwdWord, $strWordSep)
}
$intRandonNumnber = Get-Random -Minimum $intMinRandNumber -Maximum $intMaxRandNumber
$pwdString = $pwdString + [string]$intRandonNumnber

# Output the new password
Write-Output  $pwdString