uidir = $(datadir)/gde2-calc
ui_DATA = \
	preferences.ui \
	buttons-basic.ui \
	buttons-advanced.ui \
	buttons-financial.ui \
	buttons-programming.ui

gsettings_SCHEMAS = org.gde2.calc.gschema.xml
@INTLTOOL_XML_NOMERGE_RULE@
@GSETTINGS_RULES@

Utilitiesdir = $(datadir)/applications
Utilities_in_files = gde2-calc.desktop.in
Utilities_DATA = $(Utilities_in_files:.desktop.in=.desktop)
@INTLTOOL_DESKTOP_RULE@

man1_MANS = gde2-calc.1 gde2-calc-cmd.1

EXTRA_DIST = $(ui_DATA) org.gde2.calc.gschema.xml.in gde2-calc.desktop.in $(man1_MANS)

DISTCLEANFILES = \
	Makefile.in \
	gde2-calc.desktop \
	$(gsettings_SCHEMAS)
