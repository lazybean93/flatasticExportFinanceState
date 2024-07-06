#File
File="Flatastic _ Web App-Dateien/a.html"

Content="$(cat "$File")"
#cut head
Content="$(echo "$Content" | sed 's/EXP__YOUR_STATUS/\nEXP__YOUR_STATUS/g' | grep -A999999999 EXP__YOUR_STATUS)"
#cut tail & work
Content="$(echo "$Content" | sed 's/ng-binding\">Pancakes Workplace/\n/;s/EXP__TOTAL_SUM/\n/g;s/ng-binding\"/\n/g;s/<\/[ds]/\n/g')"
#filter & finalize
Content="$(echo "$Content" | grep '^>' | sed 's/^> //g;s/^>//g;s/ $//g')"

for i in $(seq 1 $(($(echo "$Content" | wc -l)/4))); do
	SUM="$(echo "$Content" | head -n $(($(($i*4))-0)) | tail -n1)"
	TITLE="$(echo "$Content" | head -n $(($(($i*4))-1)) | tail -n1)"
	DATE="$(echo "$Content" | head -n $(($(($i*4))-2)) | tail -n1)"
	NAME="$(echo "$Content" | head -n $(($(($i*4))-3)) | tail -n1)"

	#Getting German Month
	MONTH="$(echo "$DATE" | sed 's/ /\n/g' | head -n2 | tail -n1)"
	if [ "$MONTH" = "Jan." ]; then MONTH=01; fi
	if [ "$MONTH" = "Feb." ]; then MONTH=02; fi
	if [ "$MONTH" = "März" ]; then MONTH=03; fi
	if [ "$MONTH" = "Apr." ]; then MONTH=04; fi
	if [ "$MONTH" = "Mai" ]; then MONTH=05; fi
	if [ "$MONTH" = "Juni" ]; then MONTH=06; fi
	if [ "$MONTH" = "Juli" ]; then MONTH=07; fi
	if [ "$MONTH" = "Aug." ]; then MONTH=08; fi
	if [ "$MONTH" = "Sep." ]; then MONTH=09; fi
	if [ "$MONTH" = "Okt." ]; then MONTH=10; fi
	if [ "$MONTH" = "Nov." ]; then MONTH=11; fi
	if [ "$MONTH" = "Dez." ]; then MONTH=12; fi

	YEAR="$(echo "$DATE" | sed 's/ /\n/g' | head -n3 | tail -n1)"
	DAY="$(echo "$DATE" | sed 's/ /\n/g' | head -n1 | sed 's/\.//g')"
	DATE=$(date -d"$YEAR""-""$MONTH""-""$DAY" +%d.%m.%Y)
	if [ "$NAME" = "Carola" ]; then
		echo $DATE";"$SUM";0,00;"$TITLE
	else
		echo $DATE";0,00;"$SUM";"$TITLE
	fi
done
