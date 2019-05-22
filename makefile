.PHONY: help setup test run

VENV_NAME?=venv
VENV_ACTIVATE=. $(VENV_NAME)/bin/activate
PYTHON=${VENV_NAME}/bin/python

BLACK ?= \033[0;30m
RED ?= \033[0;31m
GREEN ?= \033[0;32m
YELLOW ?= \033[0;33m
BLUE ?= \033[0;34m
PURPLE ?= \033[0;35m
CYAN ?= \033[0;36m
GRAY ?= \033[0;37m
COFF ?= \033[0m

.DEFAULT: help
help:
	@echo "\n$(YELLOW) make setup $(COFF)"
	@echo "$(GREEN)       execute all setup processes, use only once $(COFF)"
	@echo "\n$(YELLOW) make test $(COFF)"
	@echo "$(GREEN)       display the pip list $(COFF)"
	@echo "\n$(YELLOW) make run $(COFF)"
	@echo "$(GREEN)       run App $(COFF)\n\n"

setup:
	make _setup -s

_setup:
	@printf "\n$(YELLOW) SETTING UP GLS Fullstack Exercise $(COFF)\n\n"
	make venv
	@printf "\n\n$(PURPLE) ===========================================  $(COFF)\n";
	@printf "\n$(YELLOW)   == GLS Fullstack Exercise Setup Complete ==   $(COFF)\n";
	@printf "\n$(PURPLE)   ===========================================  $(COFF)\n";
	@printf "\n$(RED)   === Please execute 'make run' command =====  $(COFF)\n";

venv: venv/bin/activate

venv/bin/activate: requirements.txt
	test -d venv || virtualenv -p python3 venv
	. venv/bin/activate; pip install -Ur requirements.txt
	touch venv/bin/activate

test: venv
	$(VENV_ACTIVATE) && pip list

clean:
	rm -rf venv
	find -iname "*.pyc" -delete

run: venv
	$(VENV_ACTIVATE) && python app.py
	@printf "\n$(RED) Apps are running, please verify at http://localhost:5000/.   $(COFF)\n\n\n";
