# gen_money_string.awk
# Copyright (C) 2011 YASUDA Jiro

# Author  : YASUDA Jiro
# Time    : '11/04/19


function gen_money_string( money_amount )
{
  ret = "";
  sign = "";
  digit = 0;

  if ( money_amount == 0 )
  {
    return "0";
  }

  if ( money_amount < 0 )
  {
    sign = "-";
    money_amount = -money_amount;
  }

  while ( money_amount > 0 )
  {
    if ( digit == 3 )
    {
      ret = "," ret;
      digit = 0;
    }

    ret = money_amount % 10 ret;
    ++digit;

    money_amount = int( money_amount / 10 );
  }

  ret = sign ret;

  return ret;
}



# EOF
