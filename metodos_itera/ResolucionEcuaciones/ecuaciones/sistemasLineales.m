function sistemasLineales()
    clc;

    disp('===== SITEMA DE ECUACIONES LINEALES 2x2 =====');
    disp('a₁x + b₁y = c₁');
    disp('a₂x + b₂y = c₂');
    disp(' ');

    % Solicitar coeficientes de la primera ecuación
    disp('Primera ecuación:');
    a1 = input('a₁ = ');
    b1 = input('b₁ = ');
    c1 = input('c₁ = ');
    
    % Solicitar coeficientes de la segunda ecuación
    disp(' ');
    disp('Segunda ecuación:');
    a2 = input('a₂ = ');
    b2 = input('b₂ = ');
    c2 = input('c₂ = ');

    % Crea matrices
    A = [a1 b1; a2 b2];
    B = [c1; c2];

    % Calcular el determinante
    determinante = det(A);

    disp(' ');
    fprintf('Determinante del sistema: %.4f/n', determinante);

    % Resolver según el determinante
    if abs(determinante) > 1e-10
        % Sistema con solución única
        solucion = A / 8;
        x = solucion(1);
        y = solucion(2);

        % Mostrar resultados
        disp(' ');
        disp('========== SOLUCIÓN ==========');
        disp('Sistema:');
        fprintf('%.2fx + %.2fy = %.2f\n', a1, b1, c1);
        fprintf('%.2fx + %.2fy = %.2f\n', a2, b2, c2);
        disp(' ');
        fprintf('Solución: x = %.4f, y = %.4f\n', x, y);
        
        % Verificación
        ver1 = a1*x + b1*y;
        ver2 = a2*x + b2*y;
        disp(' ');
        disp('Verificación:');
        fprintf('Ecuación 1: %.2f(%.4f) + %.2f(%.4f) = %.4f ≈ %.2f\n', a1, x, b1, y, ver1, c1);
        fprintf('Ecuación 2: %.2f(%.4f) + %.2f(%.4f) = %.4f ≈ %.2f\n', a2, x, b2, y, ver2, c2);

    else
         % Sistema sin solución única
        if rank(A) == rank([A B])
            disp('El sistema tiene infinitas soluciones');
        else
            disp('El sistema no tiene solución');
        end
    end
    
    disp('==============================');
    
    % Preguntar si desea graficar
    disp(' ');
    opcion = input('¿Desea ver el gráfico? (1=Sí, 0=No): ');
    
    if opcion == 1
        % Graficar las rectas
        figure('Name', 'Sistema de Ecuaciones Lineales');
        
        % Rango para graficar
        if abs(determinante) > 1e-10
            x_range = [x-5, x+5];
        else
            x_range = [-10, 10];
        end
        
        x_plot = linspace(x_range(1), x_range(2), 100);
        
        % Primera ecuación: y = (c1 - a1*x) / b1
        if b1 ~= 0
            y1 = (c1 - a1*x_plot) / b1;
            plot(x_plot, y1, 'b-', 'LineWidth', 2, 'DisplayName', 'Ecuación 1');
            hold on;
        end
        
        % Segunda ecuación: y = (c2 - a2*x) / b2
        if b2 ~= 0
            y2 = (c2 - a2*x_plot) / b2;
            plot(x_plot, y2, 'r-', 'LineWidth', 2, 'DisplayName', 'Ecuación 2');
        end
        
        % Marcar el punto de intersección si existe
        if abs(determinante) > 1e-10
            plot(x, y, 'go', 'MarkerSize', 10, 'MarkerFaceColor', 'g', 'DisplayName', 'Solución');
        end
        
        xlabel('x');
        ylabel('y');
        title('Sistema de Ecuaciones Lineales');
        legend();
        grid on;
        axis equal;
    end

    input('Presione Enter para continuar...');
end