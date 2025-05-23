function altura_maxima()
% ALTURA_MAXIMA Calcula la altura máxima en un tiro vertical
%   Esta función calcula la altura máxima que alcanza un objeto
%   lanzado verticialmente hacia arriba.

    clc;
    disp("=== CÁLCULO DE ALTURA MÁXIMA EN TIRO VERTICAL ===");
    disp("Esta función calcula qué tan alto llegará un objeto lanzado hacia arriba.");
    
    h0 = input("Ingrese la altura inicial (metros): ");
    v0 = input("Ingrese la velocidad inicial (m/s, positiva si es hacia arriba): ");
    
    % Verificar que la altura inicial no sea negativa
    if h0 < 0
        error("Error: La altura inicial no puede ser negativa.");
    end
    
    g = 9.8; 
    
    if v0 <= 0
        disp("NOTA: Con velocidad inicial cero o negativa, no hay subida.");
        disp("      La altura máxima es la altura inicial.");
        h_max = h0;
    else
        h_max = h0 + (v0^2)/(2*g);
        t_max = v0/g;
    end
    
    % Mostrar resultados
    fprintf("\nRESULTADOS:\n");
    fprintf("Altura máxima: %.2f metros\n", h_max);
    
    if v0 > 0
        fprintf("Tiempo hasta la altura máxima: %.2f segundos\n", t_max);
        fprintf("Tiempo total de vuelo (hasta volver a la altura inicial): %.2f segundos\n", 2*t_max);
    end
    

    if h_max > 100
        disp("¡Eso es muy alto! Más de 100 metros.");
    end
    
    % Preguntar si el usuario quiere calcular otra magnitud
    disp("\n¿Desea calcular otra información?");
    disp("1. Velocidad en un tiempo específico");
    disp("2. Altura en un tiempo específico");
    disp("3. Volver al menú anterior");
    
    opcion = input("Seleccione una opción: ");
    
    switch opcion
        case 1
            t = input("Ingrese el tiempo (segundos): ");
            v = v0 - g*t;
            fprintf("Velocidad a los %.2f segundos: %.2f m/s\n", t, v);
            
        case 2
            t = input("Ingrese el tiempo (segundos): ");
            h = h0 + v0*t - 0.5*g*t^2;
            fprintf("Altura a los %.2f segundos: %.2f metros\n", t, h);
            
        case 3
            return;
    end
end