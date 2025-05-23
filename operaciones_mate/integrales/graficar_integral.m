% filepath: c:\Users\mario\Desktop\Calculadora\integrales\graficar_integral.m
function graficar_integral(func, a, b)
% GRAFICAR_INTEGRAL - Visualiza la integral de una función en un intervalo
%
% Sintaxis:
%   graficar_integral(func, a, b)
%
% Entradas:
%   func - Handle de función a integrar
%   a    - Límite inferior
%   b    - Límite superior
%
% Salidas:
%   Una visualización gráfica de la integral

    % Crear puntos para graficar la función
    x = linspace(a, b, 1000);
    y = zeros(size(x));
    
    % Calcular valores de la función
    for i = 1:length(x)
        try
            y(i) = func(x(i));
        catch
            y(i) = NaN;
        end
    end
    
    % Crear la figura
    figure;
    
    % Graficar la función
    plot(x, y, 'b-', 'LineWidth', 2);
    hold on;
    
    % Rellenar el área bajo la curva
    area_x = [a, x, b];
    area_y = [0, y, 0];
    fill(area_x, area_y, 'g', 'FaceAlpha', 0.3);
    
    % Líneas verticales en los límites
    plot([a, a], [0, func(a)], 'r--', 'LineWidth', 1.5);
    plot([b, b], [0, func(b)], 'r--', 'LineWidth', 1.5);
    
    % Línea del eje x
    plot([a, b], [0, 0], 'k-', 'LineWidth', 1);
    
    % Etiquetas y título
    xlabel('x');
    ylabel('f(x)');
    title(['Integral de ', func2str(func), ' desde ', num2str(a), ' hasta ', num2str(b)]);
    
    % Mostrar el valor de la integral
    integral_valor = calcular_integral_definida(func, a, b, 'quad');
    text(a + (b-a)*0.1, max(y)*0.8, ['Integral = ', num2str(integral_valor)], 'FontSize', 12);
    
    % Mejorar la apariencia
    grid on;
    box on;
    
    % Ajustar los límites para una mejor visualización
    xlim([a - (b-a)*0.1, b + (b-a)*0.1]);
    if any(~isnan(y))
        max_y = max(y(~isnan(y)));
        min_y = min(y(~isnan(y)));
        range_y = max_y - min_y;
        ylim([min(0, min_y) - range_y*0.1, max_y + range_y*0.1]);
    end
    
    hold off;
end