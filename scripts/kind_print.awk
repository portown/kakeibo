# kind_print.awk
# Copyright (C) 2011 YASUDA Jiro

# Author  : YASUDA Jiro
# Time    : '11/04/27


BEGIN {
  total = 0;
}


{
  total += $1;
  printf( "%s: %s円\n", $2, gen_money_string( $1 ) );
}


END {
  printf( "合計: %s円\n", gen_money_string( total ) );
}



# EOF
