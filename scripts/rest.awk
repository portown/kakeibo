# rest.awk
# Copyright (C) 2011 YASUDA Jiro

# Author  : YASUDA Jiro
# Time    : '11/04/08


BEGIN {
  total = 0;
  FS = "|";
}


/^[^#]/ && NR >= 3 {
  gsub( /[ \t]+/, "" );

  if ( $3 == "収入" )
    total += $5;
  else if ( $3 == "支出" )
    total -= $5;
}


END {
  print "残金：" total "円";
}


# EOF
