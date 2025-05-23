function calcular_aceleracion()
% CALCULAR_ACELERACION Calcula la aceleración en MRUA
%   Utiliza diferentes fórmulas según los datos disponibles
    clc;
    disp("=== CÁLCULO DE ACELERACIÓN EN MRUA ===");
    disp("Nota: La aceleración es constante en MRUA.");
    
    disp("¿Qué datos tiene disponibles?");
    disp("1. Velocidades y tiempo: a = (v - v₀)/t");
    disp("2. Posiciones, velocidad inicial y tiempo: a = 2(x - x₀ - v₀t)/t²");
    disp("3. Velocidades y desplazamiento: a = (v² - v₀²)/(2Δx)");
    
    opcion = input("Seleccione una opción (1-3): ");
    
    switch opcion
        case 1
            v0 = input("Ingrese la velocidad inicial (m/s): ");
            v = input("Ingrese la velocidad final (m/s): ");
            t = input("Ingrese el tiempo (s): ");
            
            if t <= 0
                error("Error: El tiempo debe ser positivo.");
            end
            
            % Calcular aceleración
            a = (v - v0)/t;
            
            fprintf("\nRESULTADOS:\n");
            fprintf("Velocidad inicial (v₀): %.2f m/s\n", v0);
            fprintf("Velocidad final (v): %.2f m/s\n", v);
            fprintf("Tiempo (t): %.2f s\n", t);
            fprintf("\nAceleración (a): %.2f m/s²\n", a);
            
            dx = v0*t + 0.5*a*t^2;
            fprintf("\nInformación adicional:\n");
            fprintf("Desplazamiento: %.2f m\n", dx);
            
        case 2
            x0 = input("Ingrese la posición inicial (m): ");
            x = input("Ingrese la posición final (m): ");
            v0 = input("Ingrese la velocidad inicial (m/s): ");
            t = input("Ingrese el tiempo (s): ");
            
            if t <= 0
                error("Error: El tiempo debe ser positivo.");
            end
            
            % Calcular aceleración
            a = 2*(x - x0 - v0*t)/(t^2);
         
            fprintf("\nRESULTADOS:\n");
            fprintf("Posición inicial (x₀): %.2f m\n", x0);
            fprintf("Posición final (x): %.2f m\n", x);
            fprintf("Velocidad inicial (v₀): %.2f m/s\n", v0);
            fprintf("Tiempo (t): %.2f s\n", t);
            fprintf("\nAceleración (a): %.2f m/s²\n", a);
            
            v = v0 + a*t;
            fprintf("\nInformación adicional:\n");
            fprintf("Velocidad final: %.2f m/s\n", v);
            
        case 3
            % Usando velocidades y desplazamiento
            v0 = input("Ingrese la velocidad inicial (m/s): ");
            v = input("Ingrese la velocidad final (m/s): ");
            dx = input("Ingrese el desplazamiento (m): ");
          
            if dx == 0
                error("Error: El desplazamiento no puede ser cero para este método.");
            end
            
            a = (v^2 - v0^2)/(2*dx);
            
            % Mostrar resultado
            fprintf("\nRESULTADOS:\n");
            fprintf("Velocidad inicial (v₀): %.2f m/s\n", v0);
            fprintf("Velocidad final (v): %.2f m/s\n", v);
            fprintf("Desplazamiento (Δx): %.2f m\n", dx);
            fprintf("\nAceleración (a): %.2f m/s²\n", a);
            
            % Calcular tiempo para información adicional
            if a ~= 0
                t = (v - v0)/a;
                fprintf("\nInformación adicional:\n");
                fprintf("Tiempo: %.2f s\n", abs(t));
            else
                disp("\nLa aceleración es cero (Movimiento Rectilíneo Uniforme).");
                if v0 ~= 0
                    t = dx/v0;
                    fprintf("Tiempo: %.2f s\n", abs(t));
                end
            end
            
        otherwise
            disp("Opción no válida.");
            return;
    end
    
    % Interpretación física de la aceleración
    fprintf("\nInterpretación física:\n");
    if a > 0
        disp("La aceleración es positiva: el móvil aumenta su velocidad en sentido positivo");
        disp("o disminuye su velocidad en sentido negativo.");
    elseif a < 0
        disp("La aceleración es negativa: el móvil disminuye su velocidad en sentido positivo");
        disp("o aumenta su velocidad en sentido negativo.");
    else
        disp("La aceleración es cero: el móvil se mueve con velocidad constante (MRU).");
    end
    
end