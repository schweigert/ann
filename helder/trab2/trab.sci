// Criado por Marlon Henry Schweigert
// Jonathan de Oliveira Cardoso

// Matriz de funções do sistema
function y=F(x)
    y(1)=8*x(1)+x(2)-sin(x(1)-x(2))
    y(2)=-x(1)+8*x(2)+cos(x(1)*x(2))
endfunction

// Matriz de derivadas do sistema
// ...           ...
// |∂f1/∂x1 ∂f1/∂x2|
// |∂f2/∂x1 ∂f2/∂x2|
// ...           ...
function y=J(x)
    y(1,1)=8-cos(x(1)-x(2))
    y(1,2)=cos(x(1)-x(2))+1
    y(2,1)=-x(2)*sin(x(1)*x(2))-1
    y(2,2)=8-x(1)*sin(x(1)*x(2))
endfunction

// Aplica a interação
function y=Newton(x)
    delta=-J(x)\F(x)
    y=x+delta
endfunction

// Aplica a próxima iteração,
// calculando o erro relativo
// entre cada iteração.
function [e,x1]=I(x)
    x1=Newton(x)
    e=max(abs(x-x1)/abs(x1))
endfunction

// Aplica o algoritmo de Newton
// para resolver sistemas com no
// máximo 100 passos ou erro relativo
// menor que 10⁻⁵.
function y=Solve(x)
    for i = 1:100,
        [e,x] = I(x)
        if e < 10**-5,
            break
        end
    end
    y=x
endfunction

x=[0;0]
xs = Solve(x)
disp(xs)
