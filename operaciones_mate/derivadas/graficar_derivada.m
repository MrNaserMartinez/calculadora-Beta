% filepath: c:\Users\mario\Desktop\Calculadora\derivadas\graficar_derivada.m
function graficar_derivada(func, x0, h, deriv_exacta)
% GRAFICAR_DERIVADA - Crea una gráfica de la función y su derivada
%
% Inputs:
%   func        - Handle de la función a graficar
%   x0          - Punto donde se evalúa la derivada
%   h           - Paso para el cálculo de la derivada
%   deriv_exacta - (Opcional) Handle de la función derivada exacta

    % Crear una nueva figura
    figure('Name', 'Función y su derivada', 'NumberTitle', 'off');
    
    % Determinar un rango adecuado para graficar
    rango = max(abs(x0) * 2, 5);
    x = linspace(x0 - rango, x0 + rango, 1000);
    
    % Evaluar la función
    y = arrayfun(@(xi) func(xi), x);
    
    % Calcular la derivada numérica para cada punto
    dy = zeros(size(x));
    for i = 1:length(x)
        [~, dy(i), ~] = derivar_funcion(func, x(i), h);
    end
    
    % Crear subplot para la función
    subplot(2, 1, 1);
    plot(x, y, 'b-', 'LineWidth', 1.5);
    hold on;
    plot(x0, func(x0), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
    grid on;
    xlabel('x');
    ylabel('f(x)');
    title(['Función: f(x)   (Punto de interés: x = ' num2str(x0) ')']);
    
    % Crear subplot para la derivada
    subplot(2, 1, 2);
    plot(x, dy, 'g-', 'LineWidth', 1.5);
    hold on;
    
    % Derivada numérica en el punto de interés
    [~, deriv_centrada, ~] = derivar_funcion(func, x0, h);
    plot(x0, deriv_centrada, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
    
    % Si se proporciona la derivada exacta, graficarla también
    if nargin >= 4 && ~isempty(deriv_exacta)
        dy_exacta = arrayfun(@(xi) deriv_exacta(xi), x);
        plot(x, dy_exacta, 'r--', 'LineWidth', 1);
        legend('Derivada numérica', 'Punto de interés', 'Derivada exacta');
    else
        legend('Derivada numérica', 'Punto de interés');
    end
    
    grid on;
    xlabel('x');
    ylabel('f''(x)');
    title(['Derivada: f''(x)   (En x = ' num2str(x0) ', f''(x) ≈ ' num2str(deriv_centrada) ')']);
    
    % Ajustar el tamaño de la figura
    set(gcf, 'Position', [100, 100, 800, 600]);
end