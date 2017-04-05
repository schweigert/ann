Aaux = [1 2 3; 2 3 1; 3 1 2]
[L,U] = lu(Aaux)
P = [0 0 1; 0 1 0; 1 0 0]
P*L
P*U

// Resolvendo a Fatoração
A = [0 2 3 4; -3 5 3 2; 8 3 5 2; 3 0 -1 -2];
P = [0 0 0 1; 0 0 1 0; 0 1 0 0; 1 0 0 0];
[L,U] = lu(A);

//L = P*L
U = P*U

// Para trocar linhas, usamos
P = [0 0 1 0; 0 1 0 0; 0 0 0 1; 1 0 0 0]
// Assim, fatoramos corretamente as linhas de L

L = P*L
