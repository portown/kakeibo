# graph.gp
# Copyright (C) 2011 YASUDA Jiro

# Author  : YASUDA Jiro
# Time    : '11/04/09


set xlabel "day"
set ylabel "money"

set xrange [1:31]
set yrange [0:200000]

set output "/dev/null"
plot 'graph.dat' using 1:2 title "real money" with lines

a=-1000
b=200000
f(x)=a*x+b
fit f(x) 'graph.dat' using 1:2 via a,b

set output
replot f(x) title "approximate" with lines


# EOF
