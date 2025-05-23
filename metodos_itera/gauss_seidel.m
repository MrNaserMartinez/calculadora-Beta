% gauss_seidel.m
% Método de Gauss-Seidel simple con control de error e iteraciones

clc;
clear;

fprintf('MÉTODO DE GAUSS-SEIDEL\n');
fprintf('----------------------\n');

% Ingreso de datos
A = input('Ingresa la matriz A (cuadrada): ');
b = input('Ingresa el vector b: ');
x0 = input('Ingresa el vector inicial x0: ');
tol = input('Ingresa la tolerancia deseada (ej: 1e-6): ');
max_iter = input('Ingresa el número máximo de iteraciones: ');

% Verificaciones básicas
[n, m] = size(A);
if n ~= m
    error('La matriz A debe ser cuadrada.');
end
if length(b) ~= n || length(x0) ~= n
    error('El vector b y el vector x0 deben tener la misma longitud que A.');
end

% Inicialización
x = x0(:);           % Vector columna
error = Inf;
iter = 0;

% Encabezado
fprintf('\n%-10s', 'Iteración');
for i = 1:n
    fprintf('x(%d)         ', i);
end
fprintf('Error\n');

% Iteraciones
while error > tol && iter < max_iter
    x_old = x;
    for i = 1:n
        suma1 = A(i, 1:i-1) * x(1:i-1);
        suma2 = A(i, i+1:end) * x_old(i+1:end);
        x(i) = (b(i) - suma1 - suma2) / A(i, i);
    end
    iter = iter + 1;
    error = norm(x - x_old, Inf);
    fprintf('%-10d', iter);
    fprintf('%-13.6f', x);
    fprintf('%e\n', error);
end

% Resultados finales
fprintf('\nSolución aproximada:\n');
disp(x);
fprintf('Iteraciones: %d\n', iter);
