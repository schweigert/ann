# Escrito por Marlon Henry
# ANN - UDESC - 2017.2
# sudo apt-get install ruby
# user@machine:~/../..$ ruby metodo1.rb


def f x
  2**x - 6*Math.log(x)
end

class Config

  @xInicial =  0.0
  @xFinal   = 10.0
  @xPassos  =  0.5

  class << self
    attr_reader :xInicial
    attr_reader :xFinal
    attr_reader :xPassos
  end

end

intervalo = (Config.xInicial .. Config.xFinal).step(Config.xPassos).to_a

raizes = []
analise = []

for i in 1...intervalo.size
  fa = f(intervalo[i-1])
  fb = f(intervalo[i])
  puts "Intervalo: (#{intervalo[i-1]},#{intervalo[i]})"
  puts "fa: #{fa}"
  puts "fb: #{fb}"
  teorema = ((fa > 0 and fb < 0) or (fb > 0 and fa < 0))
  puts teorema

  if fa == 0
    raizes << intervalo[i-1]
    puts "Raiz Exata: #{intervalo[i-1]}"
  end

  if fb == 0
    raizes << intervalo[i]
    puts "Raiz Exata: #{intervalo[i]}"
  end

  analise << [intervalo[i-1], intervalo[i]] if teorema
  puts "----"*5
end

puts "Raizes encontradas nos intervalos:"

for i in analise
  puts "[#{i[0]},#{i[1]}]"
end

def secante x0, x1, k = 300

  fx1 = f x1
  fx0 = f x0

  x2 = x1 - fx1*(x0 - x1)/(fx0 - fx1)

  fx2 = f x2

  puts "Secante: k #{k}"
  puts "\tx0:  #{x0}"
  puts "\tx1:  #{x1}"
  puts "\tx2:  #{x2}"
  puts "\tf(x0): #{fx0}"
  puts "\tf(x1): #{fx1}"
  puts "\tf(x2): #{fx2}"

  e = fx2.abs

  return x2 if e < 0.0000001
  return x2 if k <= 0

  return secante(x1, x2, k-1)


end


for i in analise
  puts "Análise da raiz #{i.to_s}"
  m = secante(i[0],i[1])
  puts "Resultado: #{m}"
  puts "---"*5
  raizes << m
end

puts "\n\n"
puts "Raizes:"

for i in raizes
  puts "#{i}\t\t#{f i}"
end
