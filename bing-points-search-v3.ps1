# Script to open a bunch of tabs in Edge and seach using Bing on a random word.

# Other possible Edge Options
# --new-window

# Other possible Start-Process Options
# -wait

# Function to get a random word
function Get-RandomWord
{
 if(-not $words)
 {
  $Script:words = (Invoke-WebRequest -Uri https://raw.githubusercontent.com/RazorSh4rk/random-word-api/master/words.json).content | convertfrom-json
 }
 $words["$(get-random -Maximum ($words.count))"]
}

##### MAIN #####
$word=1
for (;$word -lt 40;$word++)
{
    try {
       $myword = Get-RandomWord
    }
    catch {
    }

    Start-Process -FilePath "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" -ArgumentList "https://www.bing.com/search?q=$myword" # --new-window"
}
