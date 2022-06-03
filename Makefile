PYTHON_HOME    := /Library/Frameworks/Python.framework/Versions/3.10
PYTHON_BIN     := $(PYTHON_HOME)/bin
PYTHON		   := $(PYTHON_BIN)/python3
PY_INCLUDES	   := PySide6,shiboken

BUILD_DIR	   := build
DIST_DIR	   := dist
APP_TITLE      := TestPySideRecipe
APP_SCRIPT	   := $(APP_TITLE).py
APP_NAME	   := $(APP_TITLE).app
APP_BIN		   := Contents/MacOS/$(APP_TITLE)

setup.py: $(PYTHON)
	py2applet --includes=$(PY_INCLUDES) --make-setup $(APP_SCRIPT)

$(PYTHON):
	echo Please install a recent python 3.10 build from https://www.python.org/downloads/
	exit 1

$(DIST_DIR)/$(APP_NAME): setup.py
	$(PYTHON) setup.py py2app

.PHONY: pips
pips:
	$(PYTHON) -m pip install --upgrade pip # use the latest version of pip
	$(PYTHON) -m pip install pyside6

.PHONY: alias
alias: setup.py
	$(PYTHON) setup.py py2app -A

.PHONY: build
build: $(DIST_DIR)/$(APP_NAME)

.PHONY: clean
clean:
	[ -f setup.py ] && rm setup.py || true
	while [ -d $(BUILD_DIR) ]; do rm -rf $(BUILD_DIR); done
	while [ -d $(DIST_DIR) ]; do rm -rf $(DIST_DIR); done

.PHONY: debug
debug: $(DIST_DIR)/$(APP_NAME)
	$(DIST_DIR)/$(APP_NAME)/$(APP_BIN)
	