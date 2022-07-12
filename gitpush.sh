
#git config --global user.email "chokyungyeul@gmail.com"
#git config --global user.name "cho"
#token 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

#gitpush.sh
Y=$(date +%Y)
M=$(date +%m)
D=$(date +%d)
 
Ym=$Y-$M
Ymd=$Y-$M-$D
GitRep="terraform"
 
HomeDir="/mnt/c/terraform/terraformTogithub"
GitDir="$HomeDir/$GitRep"
FileDir="$HomeDir/$GitRep/$Ym"
FileNm="$Ymd".md
 
cd $GitDir
git add .
git commit -m "commit $FileNm"
git push terraform master
