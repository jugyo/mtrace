def fib(n)
  return n if n == 0 or n == 1
  fib(n-1) + fib(n-2) if n > 1
end
fib(4)
