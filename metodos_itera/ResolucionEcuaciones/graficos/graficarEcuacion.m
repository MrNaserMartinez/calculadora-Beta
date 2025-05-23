function graficarEcuacion(tipo, varargin)
    % Crear figura
    figure('Name', 'Gráfico de Ecuación', 'Position', [100 100 700 500]);

    switch tipo
        case 'lineal'
            a = varargin(1);
            b = varargin(2);

            % Rango para graficar
            x = linspace (-10, 10, 100);
            y = a*x + b;

            % Graficar la línea
            plot(x, y, 'b-', 'LineWidth', 2);
            hold on;

            % Marcas la intersección con el eje x
            if a ~= 0
                x_inter = -b/a;
                plot(x_inter, 0, 'ro', 'MarkerSize', 'r');
                text(x_inter, 0.5, sprintf('x = %.2f', x_inter), 'HorizontalAligment', 'center');
            end
            % Configuración
            xlabel('x');
            ylabel('y');
            title(sprintf('Ecuación Lineal: %.2fx + %.2f = 0', a, b));
            grid on;
            axline(0, 0, 'k-');
            
        case 'cuadratica'
            a = varargin{1};
            b = varargin{2};
            c = varargin{3};
            
            % Rango para graficar
            x = linspace(-10, 10, 1000);
            y = a*x.^2 + b*x + c;
            
            % Graficar la parábola
            plot(x, y, 'b-', 'LineWidth', 2);
            hold on;
            
            % Calcular y marcar las raíces si son reales
            discriminante = b^2 - 4*a*c;
            if discriminante >= 0
                x1 = (-b + sqrt(discriminante)) / (2*a);
                x2 = (-b - sqrt(discriminante)) / (2*a);
                plot(x1, 0, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
                plot(x2, 0, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
                
                if discriminante > 0
                    text(x1, 1, sprintf('x₁ = %.2f', x1), 'HorizontalAlignment', 'center');
                    text(x2, 1, sprintf('x₂ = %.2f', x2), 'HorizontalAlignment', 'center');
                else
                    text(x1, 1, sprintf('x = %.2f', x1), 'HorizontalAlignment', 'center');
                end
            end
            
            % Marcar el vértice
            x_vertice = -b/(2*a);
            y_vertice = a*x_vertice^2 + b*x_vertice + c;
            plot(x_vertice, y_vertice, 'go', 'MarkerSize', 10, 'MarkerFaceColor', 'g');
            text(x_vertice, y_vertice + 1, 'Vértice', 'HorizontalAlignment', 'center');
            
            % Configuración
            xlabel('x');
            ylabel('y');
            title(sprintf('Ecuación Cuadrática: %.2fx² + %.2fx + %.2f = 0', a, b, c));
            grid on;
            axline(0, 0, 'k-');
            ylim([-20 20]);
            
        case 'exponencial'
            a = varargin{1};
            b = varargin{2};
            x_sol = varargin{3};
            
            % Rango para graficar
            x = linspace(x_sol-5, x_sol+5, 1000);
            y = a.^x;
            
            % Graficar la función exponencial
            plot(x, y, 'b-', 'LineWidth', 2);
            hold on;
            
            % Línea horizontal en y = b
            yline(b, 'r--', 'LineWidth', 2, 'Label', sprintf('y = %.2f', b));
            
            % Marcar el punto de intersección
            plot(x_sol, b, 'go', 'MarkerSize', 10, 'MarkerFaceColor', 'g');
            text(x_sol, b*1.1, sprintf('x = %.3f', x_sol), 'HorizontalAlignment', 'center');
            
            % Configuración
            xlabel('x');
            ylabel('y');
            title(sprintf('Ecuación Exponencial: %.2f^x = %.2f', a, b));
            grid on;
            
        case 'logaritmica'
            a = varargin{1};
            b = varargin{2};
            x_sol = varargin{3};
            
            % Rango para graficar
            x = linspace(0.01, max(x_sol*2, 10), 1000);
            y = log(x) ./ log(a);
            
            % Graficar la función logarítmica
            plot(x, y, 'b-', 'LineWidth', 2);
            hold on;
            
            % Línea horizontal en y = b
            yline(b, 'r--', 'LineWidth', 2, 'Label', sprintf('y = %.2f', b));
            
            % Marcar el punto de intersección
            plot(x_sol, b, 'go', 'MarkerSize', 10, 'MarkerFaceColor', 'g');
            text(x_sol, b*1.1, sprintf('x = %.3f', x_sol), 'HorizontalAlignment', 'center');
            
            % Configuración
            xlabel('x');
            ylabel('y');
            title(sprintf('Ecuación Logarítmica: log_{%.2f}(x) = %.2f', a, b));
            grid on;
            xlim([0 max(x_sol*2, 10)]);
    end
    
    hold off;
end

