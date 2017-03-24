// Atividade 1
// Encontrar as raizes de 5*x^7 + 3*x^6 -5*x^3 +2*x^2 -1
// e seu gráfico

function a=p(x)
    a = sin(x)-x+2;
endfunction

x= -0:0.001:5;
a=gca();
a.x_location = "origin";
a.y_location = "origin";
plot(x,p(x));

r = fsolve(2, p);
disp(r);
