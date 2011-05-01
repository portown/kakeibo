# Makefile
# Copyright (C) 2011 YASUDA Jiro

# author:  YASUDA Jiro
# Time:    '11/04/07


# Variables

NOW_DATE = $(shell date +%Y_%m)


# Pattern Rules

%.sum: org/%.org
	gawk -f scripts/gen_money_string.awk -f scripts/sum.awk $<

%.kind: org/%.org
ifeq ($(strip $(KIND)),)
	gawk -f scripts/kind.awk $< | sort -n -r | gawk -f scripts/gen_money_string.awk -f scripts/kind_print.awk
else
	gawk -f scripts/kind.awk $< | grep $(addprefix -e ,$(KIND)) | sort -n -r | gawk -f scripts/gen_money_string.awk -f scripts/kind_print.awk
endif

%.graph: org/%.org
	gawk -f scripts/graph.awk $< > graph.dat
	gawk -f scripts/out.awk $< > out.dat
	gnuplot scripts/graph_wxt.gp

%.png: org/%.org
	gawk -f scripts/graph.awk $< > graph.dat
	gnuplot scripts/graph_png.gp > graph.png


# Phony Targets

.PHONY: clean
clean:
	rm -f fit.log graph.dat out.dat

.PHONY: sum
sum: $(NOW_DATE).sum

.PHONY: kind
kind: $(NOW_DATE).kind

.PHONY: graph
graph: $(NOW_DATE).graph

.PHONY: png
png: $(NOW_DATE).png


# EOF
