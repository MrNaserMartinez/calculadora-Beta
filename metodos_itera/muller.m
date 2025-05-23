% muller.m
% Método de Müller para encontrar raíces

clc;
clear;

fprintf('MÉTODO DE MÜLLER\n');
fprintf('----------------\n');

% Entrada
f = input('Ingresa la función como @(x): ');
x0 = input('Ingresa x0: ');
x1 = input('Ingresa x1: ');
x2 = input('Ingresa x2: ');
tol = input('Ingresa la tolerancia: ');
max_iter = input('Ingresa el número máximo de iteraciones: ');

iter = 0;
error = Inf;

fprintf('\n%-10s %-15s %-15s\n', 'Iteración', 'x', 'Error');

while error > tol && iter < max_iter
    h1 = x1 - x0;
    h2 = x2 - x1;
    d1 = (f(x1) - f(x0)) / h1;
    d2 = (f(x2) - f(x1)) / h2;
    a = (d2 - d1) / (h2 + h1);
    b = a * h2 + d2;
    c = f(x2);

    rad = sqrt(b^2 - 4 * a * c);
    if abs(b + rad) > abs(b - rad)
        den = b + rad;
    else
        den = b - rad;
    end

    if den == 0
        error('División por cero detectada.');
    end

    dx = -2 * c / den;
    x3 = x2 + dx;

    error = abs(dx);
    iter = iter + 1;
    fprintf('%-10d %-15.10f %-15.10e\n', iter, real(x3), error);

    % Actualizar puntos
    x0 = x1;
    x1 = x2;
    x2 = x3;
end

% Resultados finales
fprintf('\nRaíz aproximada: %.10f\n', real(x3));
fprintf('Iteraciones: %d\n', iter);

% ----------------------
% Gráfica de la función y la raíz encontrada
% ----------------------
fprintf('\nGenerando gráfica...\n');

x_vals = linspace(real(x3) - 5, real(x3) + 5, 500);
y_vals = arrayfun(f, x_vals);

figure;
plot(x_vals, y_vals, 'b-', 'LineWidth', 2);
hold on;
plot(real(x3), f(real(x3)), 'ro', 'MarkerSize', 10, 'LineWidth', 2);
yline(0, 'k--'); % línea horizontal en y = 0

xlabel('x');
ylabel('f(x)');
title('Método de Müller - Raíz aproximada');
legend('f(x)', 'Raíz encontrada', 'Ubicación f(x)=0', 'Location', 'best');
grid on;