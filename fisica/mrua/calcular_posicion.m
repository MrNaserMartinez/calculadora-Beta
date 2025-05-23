function calcular_posicion()
% CALCULAR_POSICION Calcula la posición final en MRUA
%   Utiliza la fórmula: x = x0 + v0*t + (1/2)*a*t^2
    clc;
    disp("=== CÁLCULO DE POSICIÓN FINAL EN MRUA ===");
    disp("Forma: x = x₀ + v₀·t + ½·a·t²");
    
    x0 = input("Ingrese la posición inicial (m): ");
    v0 = input("Ingrese la velocidad inicial (m/s): ");
    a = input("Ingrese la aceleración (m/s²): ");
    t = input("Ingrese el tiempo (s): ");
    
    if t < 0
        error("Error: El tiempo no puede ser negativo.");
    end
    
    % Calcular posición final
    x = x0 + v0*t + 0.5*a*t^2;
    
    fprintf("\nRESULTADOS:\n");
    fprintf("Posición inicial (x₀): %.2f m\n", x0);
    fprintf("Velocidad inicial (v₀): %.2f m/s\n", v0);
    fprintf("Aceleración (a): %.2f m/s²\n", a);
    fprintf("Tiempo (t): %.2f s\n", t);
    fprintf("\nPosición final (x): %.2f m\n", x);
    
    fprintf("\nInformación adicional:\n");
    desplazamiento = x - x0;
    fprintf("Desplazamiento: %.2f m ", desplazamiento);
    if desplazamiento > 0
        fprintf("(hacia la derecha)\n");
    elseif desplazamiento < 0
        fprintf("(hacia la izquierda)\n");
    else
        fprintf("(sin desplazamiento)\n");
    end
    
    % Velocidad final
    v = v0 + a*t;
    fprintf("Velocidad final (v): %.2f m/s ", v);
    if v > 0
        fprintf("(hacia la derecha)\n");
    elseif v < 0
        fprintf("(hacia la izquierda)\n");
    else
        fprintf("(en reposo)\n");
    end
    
end