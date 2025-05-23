function inecuacion_lineal()
% INECUACION_LINEAL Resuelve inecuaciones lineales de la forma ax + b < 0
%   Esta función solicita los coeficientes de una inecuación lineal y
%   muestra la solución, incluyendo la interpretación gráfica.
    clc;
    disp("=== RESOLUCIÓN DE INECUACIONES LINEALES ===");
    disp("Forma general: ax + b < 0  (o >, ≤, ≥)");
    
    a = input("Ingrese el coeficiente a: ");
    b = input("Ingrese el coeficiente b: ");
    
    disp("Seleccione el tipo de desigualdad:");
    disp("1. < (menor que)");
    disp("2. > (mayor que)");
    disp("3. <= (menor o igual que)");
    disp("4. >= (mayor o igual que)");
    
    tipo_desigualdad = input("Seleccione una opción (1-4): ");
    
    if a == 0
        disp("Error: El coeficiente 'a' no puede ser cero.");
        disp("Sería una desigualdad constante, no una inecuación.");
        return;
    end
    
    punto_critico = -b / a;
    
    fprintf("\nPaso 1: Encontrar el punto crítico\n");
    fprintf("x = -b/a = -(%g)/(%g) = %g\n", b, a, punto_critico);
    
    fprintf("\nPaso 2: Analizar la dirección de la desigualdad\n");
    if a > 0
        fprintf("Como a = %g > 0, la recta crece de izquierda a derecha.\n", a);
    else
        fprintf("Como a = %g < 0, la recta decrece de izquierda a derecha.\n", a);
    end
    
    fprintf("\nPaso 3: Determinar la solución\n");
    switch tipo_desigualdad
        case 1  % 
            if a > 0
                fprintf("Para ax + b < 0 con a > 0: x < -b/a\n");
                fprintf("Solución: x < %g\n", punto_critico);
                intervalo = sprintf("(-∞, %g)", punto_critico);
            else
                fprintf("Para ax + b < 0 con a < 0: x > -b/a\n");
                fprintf("Solución: x > %g\n", punto_critico);
                intervalo = sprintf("(%g, ∞)", punto_critico);
            end
        case 2  % >
            if a > 0
                fprintf("Para ax + b > 0 con a > 0: x > -b/a\n");
                fprintf("Solución: x > %g\n", punto_critico);
                intervalo = sprintf("(%g, ∞)", punto_critico);
            else
                fprintf("Para ax + b > 0 con a < 0: x < -b/a\n");
                fprintf("Solución: x < %g\n", punto_critico);
                intervalo = sprintf("(-∞, %g)", punto_critico);
            end
        case 3  % <=
            if a > 0
                fprintf("Para ax + b ≤ 0 con a > 0: x ≤ -b/a\n");
                fprintf("Solución: x ≤ %g\n", punto_critico);
                intervalo = sprintf("(-∞, %g]", punto_critico);
            else
                fprintf("Para ax + b ≤ 0 con a < 0: x ≥ -b/a\n");
                fprintf("Solución: x ≥ %g\n", punto_critico);
                intervalo = sprintf("[%g, ∞)", punto_critico);
            end
        case 4  % >=
            if a > 0
                fprintf("Para ax + b ≥ 0 con a > 0: x ≥ -b/a\n");
                fprintf("Solución: x ≥ %g\n", punto_critico);
                intervalo = sprintf("[%g, ∞)", punto_critico);
            else
                fprintf("Para ax + b ≥ 0 con a < 0: x ≤ -b/a\n");
                fprintf("Solución: x ≤ %g\n", punto_critico);
                intervalo = sprintf("(-∞, %g]", punto_critico);
            end
        otherwise
            disp("Tipo de desigualdad no válido.");
            return;
    end
    
    % Mostrar resumen
    fprintf("\nResumen:\n");
    
    % Construir la inecuación en formato texto
    signo = "";
    switch tipo_desigualdad
        case 1, signo = "<";
        case 2, signo = ">";
        case 3, signo = "≤";
        case 4, signo = "≥";
    end
    
    fprintf("La inecuación %gx + %g %s 0 tiene como solución: x ∈ %s\n", a, b, signo, intervalo);
    
end 