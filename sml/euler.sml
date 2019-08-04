fun pow(_, 0) = 1
    |  pow(n : IntInf.int, x : IntInf.int) = n * pow(n, x-1);

fun gcd(0:IntInf.int,n) = n
    | gcd(m:IntInf.int,n) = gcd(n mod m, m);

fun lcm(x : IntInf.int,y) = x * (y div gcd(x,y));

fun call_lcm(m : IntInf.int, n, streak) = if n > streak then 1
                                                                        else if n = streak then lcm(m, n)
                                                                        else call_lcm(lcm(m,n), n+1, streak);

fun P(limit, streak) = 
      let
        val multiple = streak
        val limit = limit - 2
        val multiple  : IntInf.int = call_lcm(multiple,2, streak)
        val minimum : IntInf.int = limit div multiple
        val multiple = lcm(multiple, streak+1)
        val maximum : IntInf.int = limit div multiple
      in
        minimum - maximum
      end;


fun findResult(1) = P(pow(4, 1),1)
  |    findResult(i : IntInf.int) = P(pow(4, i), i) + findResult(i-1);

val result = findResult (31);