# graph.awk
# Copyright (C) 2011 YASUDA Jiro

# Author  : YASUDA Jiro
# Time    : '11/04/08


BEGIN {
  FS = "|";
  day_max = 0;
}


/^[^#]/ && NR >= 3 {
  gsub( /[ \t]+/, "");

  if ( day_max < $2 )
    day_max = $2;

  if ( $3 == "収入" )
    day_total[$2] += $5;
  else if ( $3 == "支出" )
    day_total[$2] -= $5;
}


END {
  total = 0;
  for ( day = 1; day <= day_max; ++day )
  {
    total += day_total[day];
    print day, total;
  }
}


# EOF
