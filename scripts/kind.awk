# kind.awk
# Copyright (C) 2011 YASUDA Jiro

# Author  : YASUDA Jiro
# Time    : '11/04/12


BEGIN {
  FS = "|";
}


/^[^#]/ && NR >= 3 {
  gsub( /[ \t]+/, "" );

  if ( $4 == "" )
    kind = "未分類";
  else
    kind = $4;

  if ( $3 == "支出" )
    kind_total[kind] += $5;
}


END {
  for ( k in kind_total )
  {
    print k ": " kind_total[k];
  }
}


# EOF
