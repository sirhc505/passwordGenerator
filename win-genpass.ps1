

$intMinWordLen = 5
$intNumOfWords = 7

$strWordSep = "."

$intMinRandNumber = 1
$intMaxRandNumber = 50

$strApiUrl = [string]::Format("https://random-word-api.herokuapp.com/word?length={0}&number={1}", $intMinWordLen, $intNumOfWords)

$headers = @{
    "Accept"        = "application/json"
}

$fhResult = Invoke-RestMethod -Uri $strApiUrl -Headers $headers -Method Get

$fhResult | ConvertTo-Json

# Loop through each item
foreach ($item in $fhResult) {

    $pwdWord = (Get-Culture).TextInfo.ToTitleCase( $item.ToLower() )
    $pwdString = [string]::Format("{0}{1}{2}", $pwdString,  $pwdWord, $strWordSep)
}

$intRandonNumnber = Get-Random -Minimum $intMinRandNumber -Maximum $intMaxRandNumber

 $pwdString = $pwdString + [string]$intRandonNumnber

 Write-Output  $pwdString