# Makefile
# Copyright (C) 2011 YASUDA Jiro

# author:  YASUDA Jiro
# Time:    '11/04/07


# Variables

NOW_DATE = $(shell date +%Y_%m)


# Pattern Rules

%.rest: org/%.org
	gawk -f scripts/rest.awk $<

%.graph: org/%.org
	gawk -f scripts/graph.awk $< > graph.dat
	gnuplot scripts/graph_wxt.gp

%.png: org/%.org
	gawk -f scripts/graph.awk $< > graph.dat
	gnuplot scripts/graph_png.gp > graph.png


# Phony Targets

.PHONY: clean
clean:
	rm -f fit.log graph.dat

.PHONY: rest
rest: $(NOW_DATE).rest

.PHONY: graph
graph: $(NOW_DATE).graph

.PHONY: png
png: $(NOW_DATE).png


# EOF
