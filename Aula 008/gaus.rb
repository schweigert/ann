class Matriz
  def initialize x,y
    @matriz = []
    for i in 0..(x-1)
      @matriz[i] = []
      for j in 0..(y-1)
        @matriz[i][j] = 0
      end
    end
  end
end
