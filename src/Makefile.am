bin_PROGRAMS = gde2-calc gde2-calc-cmd
noinst_PROGRAMS = test-mp test-mp-equation

TESTS = test-mp test-mp-equation

AM_CPPFLAGS = \
	-DUI_DIR=\""$(datadir)/gde2-calc"\" \
	-DVERSION=\""$(VERSION)"\" \
	-DLOCALE_DIR=\""$(localedir)"\" \
	-DGETTEXT_PACKAGE=\"$(GETTEXT_PACKAGE)\" \
	$(WARN_CFLAGS) \
	$(GDE2_CALC_CFLAGS)

gde2_calc_SOURCES = \
	gde2-calc.c \
	currency.c \
	currency.h \
	currency-manager.c \
	currency-manager.h \
	math-buttons.c \
	math-buttons.h \
	math-converter.c \
	math-converter.h \
	math-display.c \
	math-display.h \
	math-equation.c \
	math-equation.h \
	math-preferences.c \
	math-preferences.h \
	math-variables.c \
	math-variables.h \
	math-variable-popup.c \
	math-variable-popup.h \
	math-window.c \
	math-window.h \
	mp.c \
	mp.h \
	mp-binary.c \
	mp-convert.c \
	mp-enums.c \
	mp-enums.h \
	mp-equation.c \
	mp-equation.h \
	mp-private.h \
	mp-serializer.c \
	mp-serializer.h \
	mp-trigonometric.c \
	financial.c \
	financial.h \
  	unit.c \
	unit.h \
	unit-category.c \
	unit-category.h \
	unit-manager.c \
	unit-manager.h \
	prelexer.c \
	prelexer.h \
	lexer.c \
	lexer.h \
	parserfunc.c \
	parserfunc.h \
	parser.c \
	parser.h \
	utility.h

gde2_calc_LDADD = \
	$(GDE2_CALC_LIBS)        

gde2_calc_cmd_SOURCES = \
	gde2-calc-cmd.c \
	currency.c \
	currency.h \
	currency-manager.c \
	currency-manager.h \
	mp.c \
	mp-binary.c \
	mp-convert.c \
	mp-enums.c \
	mp-enums.h \
	mp-equation.c \
	mp-serializer.c \
	mp-serializer.h\
	mp-trigonometric.c \
	unit.c \
	unit.h \
	unit-category.c \
	unit-category.h \
	unit-manager.c \
	unit-manager.h \
	prelexer.c \
	prelexer.h \
	lexer.c \
	lexer.h \
	parserfunc.c \
	parserfunc.h \
	parser.c \
	parser.h

gde2_calc_cmd_LDADD = \
	$(GDE2_CALC_CMD_LIBS) \
	-lm

test_mp_SOURCES = \
	test-mp.c \
	mp.c \
	mp-binary.c \
	mp-convert.c \
	mp-enums.c \
	mp-enums.h \
	mp-serializer.c \
	mp-serializer.h \
	mp-trigonometric.c

test_mp_LDADD = \
	$(GDE2_CALC_CMD_LIBS) \
	-lm

test_mp_equation_SOURCES = \
	test-mp-equation.c \
	currency.c \
	currency.h \
	currency-manager.c \
	currency-manager.h \
	mp.c \
	mp-convert.c \
	mp-binary.c \
	mp-enums.c \
	mp-enums.h \
	mp-equation.c \
	mp-serializer.c \
	mp-serializer.h \
	mp-trigonometric.c \
	unit.c \
	unit.h \
	unit-category.c \
	unit-category.h \
	unit-manager.c \
	unit-manager.h \
	prelexer.c \
	prelexer.h \
	lexer.c \
	lexer.h \
	parserfunc.c \
	parserfunc.h \
	parser.c \
	parser.h

test_mp_equation_LDADD = \
	$(GDE2_CALC_CMD_LIBS) \
	-lm

CLEANFILES = \
	mp-enums.c \
	mp-enums.h

# Generate enum types
mp-enums.h: mp-enums.h.template mp-serializer.h
	$(AM_V_GEN)$(GLIB_MKENUMS) --template $(srcdir)/mp-enums.h.template $(srcdir)/mp-serializer.h > mp-enums.h

mp-enums.c: mp-enums.c.template mp-enums.h mp-serializer.h
	$(AM_V_GEN)$(GLIB_MKENUMS) --template $(srcdir)/mp-enums.c.template $(srcdir)/mp-serializer.h > mp-enums.c

# Fix dependencies
math-serializer.c: mp-enums.h
math-equation.c: mp-enums.h

# Install a symlink between gde2-calc and gde2-calculator
install-exec-hook:
	test -e "$(DESTDIR)$(bindir)/gde2-calculator" \
	|| (cd "$(DESTDIR)$(bindir)" && ln -s gde2-calc gde2-calculator)

# Remove the symlink between gde2-calc and gde2-calculator
uninstall-local:
	test -h "$(DESTDIR)$(bindir)/gde2-calculator" \
	&& rm -f "$(DESTDIR)$(bindir)/gde2-calculator"

EXTRA_DIST = \
	mp-enums.c.template \
	mp-enums.h.template

DISTCLEANFILES = \
	Makefile.in

test: gde2-calc
	./gde2-calc -u
