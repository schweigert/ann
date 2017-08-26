// Atividade 1
// Encontrar as raizes de 5*x^7 + 3*x^6 -5*x^3 +2*x^2 -1
// e seu gráfico

function a=p(x)
    a = sin(x)-x+2;
endfunction

x= -20:1:20;
a=gca();
a.x_location = "origin";
a.y_location = "origin";
plot(x,p(x));

p1 = poly([-1 0 2 -5 0 0 3 5], 'x', 'c');
r = roots(p1);
disp(r);
