#File
File="Flatastic _ Web App-Dateien/a.html"

#Dates
#DATES="$(cat Flatastic\ _\ Web\ App_files/saved_resource.html | sed 's/ <\/span> <span style="float:right;white-space:nowrap" class="ng-binding"> /\n/g' | sed 's/ <\/span> <\/div>/\n/g' | sed 's/Keine weiteren Einträge vorhanden/\n\n/g' | grep -v '<\|=\|\/\|^$\|’\|,')"
#cat "$File" | sed 's/ <\/span> <span style="float:right;white-space:nowrap" class="ng-binding"> /\n/g' | sed 's/ <\/span> <\/div>/\n/g' | sed 's/Keine weiteren Einträge vorhanden/\n\n/g' | grep -v '<\|=\|\/\|^$\|’\|,' > dates.tmp

#Names
#NAMES="$(cat Flatastic\ _\ Web\ App_files/saved_resource.html | sed 's/<\/span> <div class="ft-card__header"> <span class="ng-binding"> /\n/g' | sed 's/ <\/span> <span style="float:right;white-space:nowrap" class="ng-binding">/\n/g' | sed 's/Keine weiteren Einträge vorhanden/\n\n/g' | grep -v '[0-9]\|"\| \|^$')"
#cat "$File" | sed 's/<\/span> <div class="ft-card__header"> <span class="ng-binding"> /\n/g' | sed 's/ <\/span> <span style="float:right;white-space:nowrap" class="ng-binding">/\n/g' | sed 's/Keine weiteren Einträge vorhanden/\n\n/g' | grep -v '[0-9]\|"\| \|^$' > names.tmp

#Title
#TITLE="$(cat Flatastic\ _\ Web\ App_files/saved_resource.html | sed 's/ng-binding">/\n/g' | sed 's/<\/div> <\/div> <div class="ft-card__footer">/\n/g' | grep -v '^$\|<span\|</span\|&#39;\|<div\|<!DOCTYPE\|https://\|http://\|<title>Flatastic App</title>\|Ionicons\|Android-style icons\|Modified icons to')"
#cat "$File" | sed 's/ng-binding">/\n/g' | sed 's/<\/div> <\/div> <div class="ft-card__footer">/\n/g' | grep -v '^$\|<span\|</span\|&#39;\|<div\|<!DOCTYPE\|https://\|http://\|<title>Flatastic App</title>\|Ionicons\|Android-style icons\|Modified icons to' > titles.tmp

#Sums
#SUMS="$(cat Flatastic\ _\ Web\ App_files/saved_resource.html | sed 's/ng-binding">/\n/g' | sed 's/€<\/span><\/span>/\n/g' | grep -v '[a-z]\|[A-Z]\|^$')"
#cat "$File" | sed 's/ng-binding">/\n/g' | sed 's/€<\/span><\/span>/\n/g' | grep -v '[a-z]\|[A-Z]\|^$' > sums.tmp

#for i in $(seq 1 $(cat sums.tmp | wc -l)); do
#	DATE="$(cat dates.tmp | head -n $i | tail -n 1)"
#	NAME="$(cat names.tmp | head -n $i | tail -n 1)"
#	TITLE="$(cat titles.tmp | head -n $i | tail -n 1 | sed 's/\&amp;/\&/g')"
#	SUM="$(cat sums.tmp | head -n $i | tail -n 1 | sed 's/\.//')"
#	#echo "$(date -d $DATE)""\t""$NAME""\t""$SUM""\t""$TITLE"
##	echo "$(date -d $DATE)"

	#Getting German Month
#	MONTH="$(echo "$DATE" | sed 's/ /\n/g' | head -n2 | tail -n1)"
#	if [ "$MONTH" = "Jan." ]; then MONTH=01; fi
#	if [ "$MONTH" = "Feb." ]; then MONTH=02; fi
#	if [ "$MONTH" = "März" ]; then MONTH=03; fi
#	if [ "$MONTH" = "Apr." ]; then MONTH=04; fi
#	if [ "$MONTH" = "Mai" ]; then MONTH=05; fi
#	if [ "$MONTH" = "Juni" ]; then MONTH=06; fi
#	if [ "$MONTH" = "Juli" ]; then MONTH=07; fi
#	if [ "$MONTH" = "Aug." ]; then MONTH=08; fi
#	if [ "$MONTH" = "Sep." ]; then MONTH=09; fi
#	if [ "$MONTH" = "Okt." ]; then MONTH=10; fi
#	if [ "$MONTH" = "Nov." ]; then MONTH=11; fi
#	if [ "$MONTH" = "Dez." ]; then MONTH=12; fi
#	YEAR="$(echo "$DATE" | sed 's/ /\n/g' | head -n3 | tail -n1)"
#	DAY="$(echo "$DATE" | sed 's/ /\n/g' | head -n1 | sed 's/\.//g')"
#	DATE=$(date -d"$YEAR""-""$MONTH""-""$DAY" +%d.%m.%Y)
#	if [ "$NAME" = "Carola" ]; then
#		echo $DATE";"$SUM";0,00;"$TITLE
#	else
#		echo $DATE";0,00;"$SUM";"$TITLE
#	fi
#done

#rm dates.tmp names.tmp titles.tmp sums.tmp

Content="$(cat "$File")"
#cut head
Content="$(echo "$Content" | sed 's/EXP__YOUR_STATUS/\nEXP__YOUR_STATUS/g' | grep -A999999999 EXP__YOUR_STATUS)"
#cut tail & work
Content="$(echo "$Content" | sed 's/ng-binding\">Pancakes Workplace/\n/;s/EXP__TOTAL_SUM/\n/g;s/ng-binding\"/\n/g;s/<\/[ds]/\n/g')"
#filter & finalize
Content="$(echo "$Content" | grep '^>' | sed 's/^> //g;s/^>//g;s/ $//g')"

echo "$Content"
