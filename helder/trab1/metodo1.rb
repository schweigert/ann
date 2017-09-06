# Escrito por Marlon Henry
# ANN - UDESC - 2017.2
# sudo apt-get install ruby
# user@machine:~/../..$ ruby metodo1.rb


def f x
  2**x - 6*Math.log(x)
end

class Config

  @xInicial =  1.0
  @xFinal   = 10.0
  @xPassos  =  0.5

  class << self
    attr_reader :xInicial
    attr_reader :xFinal
    attr_reader :xPassos
  end

end

def bissecao a, b, k = 300

  fa = f a
  fb = f b

  m = (a+b)/2.0

  fm = f m

  e = fm.abs

  puts "bissecao: #{k}"
  puts "\ta:  #{a}"
  puts "\tfa: #{fa}"
  puts "\tb:  #{b}"
  puts "\tfb: #{fb}"
  puts "\tm:  #{m}"
  puts "\tfm: #{fm}"
  puts "\te:  #{e}"

  # Condições de parada
  return m if e < 0.0000001
  return m if k <= 0
  return m if a == m or b == m

  if fa > 0 and fb < 0
    return bissecao m, b, k-1 if fm > 0
    return bissecao a, m, k-1 if fm < 0
  elsif fa < 0 and fb > 0
    return bissecao a, m, k-1 if fm > 0
    return bissecao m, b, k-1 if fm < 0
  end

  # Se der algum erro

  return m

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

if analise.size > 0

  for i in analise
    puts "[#{i[0]},#{i[1]}]"
  end

  for i in analise
    puts "Análise da raiz #{i.to_s}"
    m = bissecao(i[0],i[1])
    puts "Resultado: #{m}"
    puts "---"*5
    raizes << m
  end

  puts "\n\n"
  puts "Raizes:"

  for i in raizes.uniq
    puts "#{i}\t\t#{f i}"
  end

else
  puts "Não foi encontrado nenhuma possível raiz pelos passos indicados."
  puts "Aplicando o algoritmo no domínio completo indicado"
  m = bissecao(Config.xInicial, Config.xFinal)
  puts "Raizes:"
  puts "#{m}\t\t#{f m}"
end
