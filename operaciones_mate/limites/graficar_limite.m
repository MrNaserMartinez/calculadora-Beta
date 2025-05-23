% filepath: c:\Users\mario\Desktop\Calculadora\limites\graficar_limite.m
function graficar_limite(func, punto, tipo_limite, valor_limite, existe, es_infinito)
% GRAFICAR_LIMITE - Crea una gráfica de la función alrededor del punto donde se calcula el límite
%
% Inputs:
%   func        - Handle de la función a graficar
%   punto       - Punto donde se calcula el límite
%   tipo_limite - Tipo de límite: 'bilateral', 'izquierda' o 'derecha'
%   valor_limite - Valor aproximado del límite
%   existe      - Indica si el límite existe
%   es_infinito - Indica si el límite es infinito

    % Crear una nueva figura
    figure('Name', 'Análisis de Límite', 'NumberTitle', 'off');
    
    % Determinar un rango adecuado para graficar
    rango = max(abs(punto) * 0.5, 2);
    
    % Puntos para graficar
    x_izq = linspace(punto - rango, punto - 0.001, 500);
    x_der = linspace(punto + 0.001, punto + rango, 500);
    
    % Evaluar la función a ambos lados del punto
    try
        y_izq = arrayfun(@(x) evaluar_seguro(func, x), x_izq);
        y_der = arrayfun(@(x) evaluar_seguro(func, x), x_der);
    catch
        disp('Error al evaluar la función para graficarla.');
        return;
    end
    
    % Graficar la función
    hold on;
    
    % Líneas verticales y horizontales de referencia
    line([punto - rango, punto + rango], [0, 0], 'Color', [0.7, 0.7, 0.7], 'LineStyle', '-');
    line([punto, punto], [-10, 10], 'Color', [0.7, 0.7, 0.7], 'LineStyle', '--');
    
    % Graficar la parte izquierda y derecha por separado
    plot(x_izq, y_izq, 'b-', 'LineWidth', 1.5);
    plot(x_der, y_der, 'b-', 'LineWidth', 1.5);
    
    % Marcar el punto de interés
    plot(punto, valor_limite, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
    
    % Intentar evaluar la función en el punto
    try
        valor_punto = func(punto);
        plot(punto, valor_punto, 'go', 'MarkerSize', 8, 'MarkerFaceColor', 'g');
        
        % Añadir leyenda con el valor en el punto
        legend('Función', '', '', ['Límite en x = ' num2str(punto)], ['f(' num2str(punto) ') = ' num2str(valor_punto)]);
    catch
        legend('Función', '', '', ['Límite en x = ' num2str(punto)]);
    end
    
    % Configurar aspecto de la gráfica
    grid on;
    xlabel('x');
    ylabel('f(x)');
    
    % Título según el tipo de límite
    switch tipo_limite
        case 'bilateral'
            titulo = ['Límite cuando x → ' num2str(punto)];
        case 'izquierda'
            titulo = ['Límite cuando x → ' num2str(punto) '⁻ (por la izquierda)'];
        case 'derecha'
            titulo = ['Límite cuando x → ' num2str(punto) '⁺ (por la derecha)'];
    end
    
    % Añadir valor del límite al título
    if ~existe
        titulo = [titulo ': No existe'];
    elseif es_infinito
        if valor_limite > 0
            titulo = [titulo ': +∞'];
        else
            titulo = [titulo ': -∞'];
        end
    else
        titulo = [titulo ': ' num2str(valor_limite)];
    end
    
    title(titulo);
    
    % Ajustar límites para mejor visualización
    if existe && ~es_infinito
        ylim([valor_limite - rango, valor_limite + rango]);
    else
        ylim([-10, 10]); % Valores por defecto si no hay límite o es infinito
    end
    
    xlim([punto - rango, punto + rango]);
    
    % Añadir recta horizontal en el valor del límite si existe y no es infinito
    if existe && ~es_infinito
        line([punto - rango, punto + rango], [valor_limite, valor_limite], 'Color', 'r', 'LineStyle', ':');
    end
end

function y = evaluar_seguro(func, x)
% Evalúa la función de manera segura, devolviendo NaN en caso de error
    try
        y = func(x);
        if ~isfinite(y)
            y = NaN;
        end
    catch
        y = NaN;
    end
end