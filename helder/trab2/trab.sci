// Criado por Marlon Henry Schweigert
// Jonathan de Oliveira Cardoso

format(25)

function y=F(x)
    y(1)=8*x(1)+x(2)-sin(x(1)-x(2))
    y(2)=-x(1)+8*x(2)+cos(x(1)*x(2))
endfunction

function y=J(x)
    y(1,1)=8-cos(x(1)-x(2))
    y(1,2)=cos(x(1)-x(2))+1
    y(2,1)=-x(2)*sin(x(1)*x(2))-1
    y(2,2)=8-x(1)*sin(x(1)*x(2))
endfunction

function y=Newton(x)
    delta=-J(x)\F(x)
    y=x+delta
endfunction

function [e,x1]=I(x)
    x1=Newton(x)
    e=max(abs(x-x1)/abs(x1))
endfunction

function y=Solve(x)
    for i = 1:100,
        [e,x] = I(x)
        disp("   Interaçao ")
        disp(i)
        
        disp("   Erro:")
        disp(e)
        
        disp("   Soluçao Parcial")
        disp(x)
        if e < 10**-5,
            break
        end
    end
    y=x
endfunction

x=[0;0]
xs = Solve(x)
disp(xs)
