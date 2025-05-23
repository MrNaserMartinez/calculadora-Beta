% segunda_ley_newton.m
% Cálculo interactivo de la Segunda Ley de Newton: F = m * a

clc;
clear;

fprintf('SEGUNDA LEY DE NEWTON: F = m * a\n');
fprintf('-------------------------------\n');

% Solicitar masa
m = input('Ingresa la masa del objeto (kg): ');
while m <= 0
    fprintf('Error: La masa debe ser mayor que 0.\n');
    m = input('Por favor, ingresa una masa válida (kg): ');
end

% Solicitar aceleración
a = input('Ingresa la aceleración del objeto (m/s^2): ');

% Calcular fuerza
F = m * a;

% Mostrar resultados
fprintf('\nRESULTADOS:\n');
fprintf('Masa:        %.2f kg\n', m);
fprintf('Aceleración: %.2f m/s²\n', a);
fprintf('Fuerza:      %.2f N\n', F);

% Graficar F vs a (variando a con m constante)
a_vals = linspace(-10, 10, 100);
F_vals = m * a_vals;

figure;
plot(a_vals, F_vals, 'b-', 'LineWidth', 2);
xlabel('Aceleración (m/s²)');
ylabel('Fuerza (N)');
title(sprintf('Fuerza vs Aceleración (Masa = %.2f kg)', m));
grid on;
