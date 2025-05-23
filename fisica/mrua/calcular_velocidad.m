function calcular_velocidad()
% CALCULAR_VELOCIDAD Calcula la velocidad final en MRUA
%   Utiliza la fórmula: v = v0 + a*t
clc;
    disp("=== CÁLCULO DE VELOCIDAD FINAL EN MRUA ===");
    disp("Forma: v = v₀ + a·t");
    disp("Nota: También se puede calcular con v² = v₀² + 2·a·Δx");
    
    disp("¿Qué fórmula desea utilizar?");
    disp("1. v = v₀ + a·t (usando tiempo)");
    disp("2. v² = v₀² + 2·a·Δx (usando desplazamiento)");
    formula = input("Seleccione una opción (1-2): ");
    
    if formula == 1
        v0 = input("Ingrese la velocidad inicial (m/s): ");
        a = input("Ingrese la aceleración (m/s²): ");
        t = input("Ingrese el tiempo (s): ");
        

        if t < 0
            error("Error: El tiempo no puede ser negativo.");
        end
        v = v0 + a*t;
        
        fprintf("\nRESULTADOS:\n");
        fprintf("Velocidad inicial (v₀): %.2f m/s\n", v0);
        fprintf("Aceleración (a): %.2f m/s²\n", a);
        fprintf("Tiempo (t): %.2f s\n", t);
        fprintf("\nVelocidad final (v): %.2f m/s\n", v);
        
    elseif formula == 2
        % Usando desplazamiento
        v0 = input("Ingrese la velocidad inicial (m/s): ");
        a = input("Ingrese la aceleración (m/s²): ");
        x0 = input("Ingrese la posición inicial (m): ");
        x = input("Ingrese la posición final (m): ");
        
        dx = x - x0;
        
        v_cuadrado = v0^2 + 2*a*dx;
        
        if v_cuadrado >= 0
            v = sqrt(v_cuadrado);
            if (v0 < 0 && a < 0) || (v0 < 0 && a >= 0 && abs(v0) > sqrt(2*a*dx))
                v = -v;
            end
        else
            error("Error: No es posible calcular la velocidad con estos datos (raíz cuadrada de un número negativo).");
        end
        
        % Mostrar resultado
        fprintf("\nRESULTADOS:\n");
        fprintf("Velocidad inicial (v₀): %.2f m/s\n", v0);
        fprintf("Aceleración (a): %.2f m/s²\n", a);
        fprintf("Desplazamiento (Δx): %.2f m\n", dx);
        fprintf("\nVelocidad final (v): %.2f m/s\n", v);
    else
        disp("Opción no válida.");
        return;
    end
    
    % Información adicional
    fprintf("\nInterpretación física:\n");
    if formula == 1
        dx = v0*t + 0.5*a*t^2;
        fprintf("Desplazamiento: %.2f m\n", dx);
    end
    
    if v > 0
        disp("El móvil se mueve hacia la derecha (sentido positivo).");
    elseif v < 0
        disp("El móvil se mueve hacia la izquierda (sentido negativo).");
    else
        disp("El móvil está en reposo.");
    end
    
    if v0 * v < 0
        disp("El móvil cambió de dirección durante el movimiento.");
    end
    
    if a * v < 0
        disp("El móvil está frenando (la aceleración se opone al movimiento).");
    elseif a * v > 0 && a ~= 0
        disp("El móvil está acelerando (la aceleración va en la misma dirección del movimiento).");
    end
end