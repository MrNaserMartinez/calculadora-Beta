% filepath: c:\Users\mario\Desktop\Calculadora\biseccion\graficar_resultado.m
function graficar_resultado(func, a, b, raiz)
% GRAFICAR_RESULTADO - Genera una gráfica para visualizar la función y su raíz
%
% Inputs:
%   func - Handle de la función a graficar
%   a    - Límite inferior del intervalo original
%   b    - Límite superior del intervalo original
%   raiz - Raíz encontrada por el método de bisección

    % Crear una figura nueva
    figure('Name', 'Método de Bisección - Resultado', 'NumberTitle', 'off');
    
    % Ampliar el intervalo para una mejor visualización
    margen = (b - a) * 0.2; % 20% de margen adicional
    x_min = a - margen;
    x_max = b + margen;
    
    % Crear un vector de puntos para graficar la función
    x = linspace(x_min, x_max, 500);
    
    % Evaluar la función de manera segura
    [y, validos] = evaluar_funcion(func, x);
    
    % Si hay puntos no válidos, reemplazarlos con NaN para que no se grafiquen
    if ~all(validos)
        y(~isfinite(y)) = NaN;
    end
    
    % Calcular límites para el eje Y
    y_validos = y(isfinite(y));
    if isempty(y_validos)
        % Si no hay valores válidos, usar límites predeterminados
        y_min = -5;
        y_max = 5;
    else
        rango_y = max(y_validos) - min(y_validos);
        y_min = min(y_validos) - rango_y * 0.2;
        y_max = max(y_validos) + rango_y * 0.2;
    end
    
    % Crear subplot para la función completa
    subplot(2, 1, 1);
    plot(x, y, 'b-', 'LineWidth', 1.5);
    grid on;
    
    % Añadir línea horizontal en y=0
    hold on;
    plot([x_min, x_max], [0, 0], 'k--', 'LineWidth', 0.5);
    
    % Marcar la raíz encontrada
    y_raiz = func(raiz);
    plot(raiz, y_raiz, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
    
    % Añadir etiqueta para la raíz
    text(raiz, y_raiz, ['  Raíz: (' num2str(raiz, '%.6f') ', 0)'], ...
         'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left');
    
    % Configurar límites y etiquetas
    xlim([x_min, x_max]);
    ylim([y_min, y_max]);
    xlabel('x');
    ylabel('f(x)');
    title('Gráfica de la función');
    
    % Crear subplot para zoom alrededor de la raíz
    subplot(2, 1, 2);
    
    % Calcular un intervalo más pequeño alrededor de la raíz
    zoom_factor = 0.1; % 10% del intervalo original
    zoom_width = (b - a) * zoom_factor;
    x_zoom = linspace(raiz - zoom_width, raiz + zoom_width, 200);
    
    % Evaluar la función en el intervalo de zoom
    [y_zoom, validos_zoom] = evaluar_funcion(func, x_zoom);
    
    % Si hay puntos no válidos, reemplazarlos con NaN
    if ~all(validos_zoom)
        y_zoom(~isfinite(y_zoom)) = NaN;
    end
    
    % Graficar la función en el intervalo de zoom
    plot(x_zoom, y_zoom, 'b-', 'LineWidth', 1.5);
    grid on;
    hold on;
    plot([x_zoom(1), x_zoom(end)], [0, 0], 'k--', 'LineWidth', 0.5);
    
    % Marcar la raíz en el zoom
    plot(raiz, y_raiz, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
    
    % Configurar límites y etiquetas para el zoom
    xlabel('x');
    ylabel('f(x)');
    title(['Zoom alrededor de la raíz: ' num2str(raiz, '%.8f')]);
    
    % Ajustar espaciado entre subplots
    set(gcf, 'Position', [100, 100, 800, 600]);
    
    % Mostrar información adicional
    annotation('textbox', [0.15, 0.01, 0.7, 0.05], ...
        'String', ['f(' num2str(raiz, '%.8f') ') = ' num2str(y_raiz, '%.8e')], ...
        'EdgeColor', 'none', 'HorizontalAlignment', 'center');
end