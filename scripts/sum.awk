# sum.awk
# Copyright (C) 2011 YASUDA Jiro

# Author  : YASUDA Jiro
# Time    : '11/04/08


BEGIN {
  in_total = 0;
  out_total = 0;
  rest = 0;
  FS = "|";
}


/^[^#]/ && NR >= 3 {
  gsub( /[ \t]+/, "" );

  if ( $3 == "収入" )
    in_total += $5;
  else if ( $3 == "支出" )
    out_total += $5;
  else if ( $3 == "繰越" )
    rest += $5;
}


END {
  printf( "収入: %10s円\n", gen_money_string( in_total ) );
  printf( "支出: %10s円\n", gen_money_string( out_total ) );
  printf( "合計: %10s円\n", gen_money_string( in_total - out_total ) );
  printf( "残金: %10s円\n", gen_money_string( rest + in_total - out_total ) );
}


# EOF
