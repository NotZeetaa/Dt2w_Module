unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
unzip -o "$ZIPFILE" 'mode/*' -d $TMPDIR >&2
mkdir -p $MODPATH/system/bin

ui_print " "
ui_print "    ×××××××××××××××××××××××××××××××"
ui_print "       Select Dt2w Mode:  📳     "
ui_print "    ×××××××××××××××××××××××××××××××"
ui_print " "
ui_print "  Vol+ = Next; Vol- = Select"
ui_print " "
ui_print "  1. Dt2w Enabler "
ui_print "  2. Dt2w Disabler "
ui_print " "
ui_print "  Select: "
DT=1
while true; do
ui_print "   $DT"
	if $VKSEL; then
		DT=$((DT + 1))
	else 
		break
	fi
	if [ $DT -gt 2 ]; then
		DT=1
	fi
done
ui_print " "
ui_print "  Selected: $DT"
#
case $DT in
 1 ) FCTEXTAD1="Dt2w Enabler"; cp -af $TMPDIR/mode/dtE $MODPATH/system/bin;;
 2 ) FCTEXTAD1="Dt2w Disabler"; cp -af $TMPDIR/mode/dtD $MODPATH/system/bin;;
esac
ui_print " "
ui_print "- Mode: $FCTEXTAD1 "
sleep 3