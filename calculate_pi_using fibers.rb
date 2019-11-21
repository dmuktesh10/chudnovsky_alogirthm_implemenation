#!/usr/bin/env ruby
require 'bigdecimal'

def calculate_pi(digit)
  k_equation_val =0.0
  kk=0
  pi = Fiber.new do
        loop do
          k_equation_val += k_equation(kk)
          cal = (426880*Math.sqrt(10005))/k_equation_val
          Fiber.yield(cal.to_s[kk])
          kk+=1
        end
      end
  print "pi: "    
  (0..digit).each do |v|
    print pi.resume
  end
end

def k_equation(k)
  numo = numerator(k)
  deno = denominator(k)
  numo/deno
end

def numerator(k)
  BigDecimal(fact(6*k)*((545140134*k)+13591409))
end

def denominator(k)
  (fact(3*k)*((fact(k)**3)*(BigDecimal(-262537412640768000)**k)))
end

def fact(num)
  result = (1..num).inject(:*) || 1
  BigDecimal(result)
end
calculate_pi(1000)
