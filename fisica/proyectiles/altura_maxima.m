function altura_maxima()
% ALTURA_MAXIMA_PROYECTIL Calcula la altura máxima que alcanza un proyectil
% Esta función calcula la altura máxima que alcanza un proyectil durante
% su trayectoria.
    disp("=== CÁLCULO DE ALTURA MÁXIMA DE UN PROYECTIL ===");
    
    % Solicitar datos
    v0 = input("Ingrese la velocidad inicial (m/s): ");
    angulo_grad = input("Ingrese el ángulo de lanzamiento (grados): ");
    h0 = input("Ingrese la altura inicial (m): ");
    
    if v0 <= 0
        error("Error: La velocidad inicial debe ser positiva.");
    end
    
    if angulo_grad < 0 || angulo_grad > 90
        error("Error: El ángulo debe estar entre 0 y 90 grados.");
    end
    
    angulo = angulo_grad * pi / 180;
    
    g = 9.8;
    
    % Componentes de la velocidad inicial
    v0x = v0 * cos(angulo);
    v0y = v0 * sin(angulo);
    
    tiempo_altura_maxima = v0y / g;
    
    % Caso especial: lanzamiento horizontal
    if angulo_grad == 0
        altura_maxima = h0;
        x_altura_maxima = 0;
        tiempo_altura_maxima = 0;
    else
        % Calcular tiempo de vuelo
        if h0 == 0
            tiempo_vuelo = 2 * v0y / g;
        else
            a = 0.5 * g;
            b = -v0y;
            c = h0;
            
            discriminante = b^2 - 4*a*c;
            
            if discriminante < 0
                error("Error: No hay solución real. Revise los datos.");
            end
            
            % Calcular las raíces
            t1 = (-b + sqrt(discriminante))/(2*a);
            t2 = (-b - sqrt(discriminante))/(2*a);
            
            tiempos_positivos = [t1, t2];
            tiempos_positivos = tiempos_positivos(tiempos_positivos > 0);
            
            if isempty(tiempos_positivos)
                error("Error: No hay solución con tiempo positivo.");
            end
            
            tiempo_vuelo = min(tiempos_positivos);
        end
        
        if tiempo_altura_maxima <= tiempo_vuelo && tiempo_altura_maxima > 0
            altura_maxima = h0 + v0y^2 / (2*g);
            x_altura_maxima = v0x * tiempo_altura_maxima;
        else

            if v0y <= 0
                altura_maxima = h0;
                x_altura_maxima = 0;
                tiempo_altura_maxima = 0;
            else
                disp("Advertencia: Condición especial detectada.");
                disp("El proyectil no alcanza su máxima altura teórica antes de impactar el suelo.");
                
                t_test = linspace(0, tiempo_vuelo, 100);
                y_test = h0 + v0y * t_test - 0.5 * g * t_test.^2;
                [altura_maxima, idx] = max(y_test);
                tiempo_altura_maxima = t_test(idx);
                x_altura_maxima = v0x * tiempo_altura_maxima;
            end
        end
    end
    
    % Calcular alcance horizontal
    alcance = v0x * tiempo_vuelo;
    
    % Mostrar resultados
    fprintf("\nRESULTADOS:\n");
    fprintf("Velocidad inicial: %.2f m/s\n", v0);
    fprintf("Ángulo de lanzamiento: %.2f grados\n", angulo_grad);
    fprintf("Altura inicial: %.2f m\n", h0);
    fprintf("\nAltura máxima: %.2f m\n", altura_maxima);
    fprintf("Tiempo para alcanzar altura máxima: %.2f s\n", tiempo_altura_maxima);
    fprintf("Posición horizontal en altura máxima: %.2f m\n", x_altura_maxima);
    
    % Información adicional
    fprintf("\nInformación adicional:\n");
    fprintf("Tiempo total de vuelo: %.2f s\n", tiempo_vuelo);
    fprintf("Alcance horizontal: %.2f m\n", alcance);
end