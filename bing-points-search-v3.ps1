
# Edge Options
# --new-window

# Start-Process Options
# -wait

function Get-RandomWord
{
 if(-not $words)
 {
  $Script:words = (Invoke-WebRequest -Uri https://raw.githubusercontent.com/RazorSh4rk/random-word-api/master/words.json).content | convertfrom-json
 }
 $words["$(get-random -Maximum ($words.count))"]
}


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