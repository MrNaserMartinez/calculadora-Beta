% raices_multiples.m
% Método de raíces múltiples con detención anticipada al hallar la raíz

clc;
clear;
syms x;

fprintf('MÉTODO DE RAÍCES MÚLTIPLES\n');
fprintf('--------------------------\n');

% Función simbólica
f = input('Ingresa la función f(x): ', 's');
f = str2sym(f);

% Derivadas simbólicas
f1 = diff(f, x);
f2 = diff(f1, x);

fprintf('\nDerivada primera:   f''(x)  = %s\n', char(f1));
fprintf('Derivada segunda:   f''''(x) = %s\n', char(f2));

% Convertir a funciones numéricas
f_fun = matlabFunction(f);
f1_fun = matlabFunction(f1);
f2_fun = matlabFunction(f2);

% Parámetros
x0 = input('\nIngresa la aproximación inicial x0: ');
tol = input('Ingresa la tolerancia deseada (ej: 1e-6): ');
max_iter = input('Ingresa el número máximo de iteraciones: ');

% Inicialización
iter = 0;
error = 1;

fprintf('\n%-10s %-15s %-15s %-15s\n', 'Iteración', 'x_n', 'f(x_n)', 'Error');

while error > tol && iter < max_iter
    fx = f_fun(x0);
    
    % Verificación anticipada: f(x) ≈ 0
    if abs(fx) < tol
        fprintf('%-10d %-15.8f %-15.8f %-15.8f\n', iter, x0, fx, 0);
        fprintf('\n¡Raíz encontrada con f(x) ≈ 0!\n');
        break;
    end

    f1x = f1_fun(x0);
    f2x = f2_fun(x0);
    den = f1x^2 - fx * f2x;

    if abs(den) < 1e-12
        fprintf('\n⚠️  Denominador muy pequeño: posible división por cero.\n');
        fprintf('Último x_n válido: %.10f\n', x0);
        break;
    end

    x1 = x0 - (fx * f1x) / den;
    error = abs(x1 - x0);

    fprintf('%-10d %-15.8f %-15.8f %-15.8f\n', iter, x0, fx, error);

    x0 = x1;
    iter = iter + 1;
end

% Mostrar si se alcanzó el criterio por error
if error <= tol
    fprintf('\nRaíz encontrada: %.10f\n', x0);
    fprintf('Iteraciones:     %d\n', iter);
end

% Gráfica
fplot(f_fun, [x0 - 5, x0 + 5], 'LineWidth', 2); hold on;
plot(x0, f_fun(x0), 'ro', 'MarkerSize', 8, 'LineWidth', 2);
grid on;
title('Función f(x) y raíz encontrada');
xlabel('x'); ylabel('f(x)');
legend('f(x)', 'Raíz aproximada');
