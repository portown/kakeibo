# graph.gp
# Copyright (C) 2011 YASUDA Jiro

# Author  : YASUDA Jiro
# Time    : '11/04/09


set xlabel "day"
set ylabel "money"

set xrange [1:31]
set yrange [0:200000]

set xtics 5
set ytics 25000

set grid

set output "/dev/null"
plot 'graph.dat' using 1:2 title "rest money" with linespoints

a=2000
b=10000
f(x)=a*x+b
fit f(x) 'out.dat' using 1:2 via a,b

replot f(x) title "approximate" with lines

set output
replot 'out.dat' using 1:2 title "used money" with linespoints


# EOF
