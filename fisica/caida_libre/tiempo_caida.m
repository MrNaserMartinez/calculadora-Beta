function tiempo_caida()
% TIEMPO_CAIDA Calcula el tiempo que tarda un objeto en caer hasta el suelo
%   Esta función calcula cuánto tiempo tarda un objeto en caer desde una
%   determinada altura hasta el suelo, considerando la física de caída libre.
    
    clc;
    disp("=== CÁLCULO DE TIEMPO DE CAÍDA LIBRE ===");
    disp("Esta función calcula cuánto tiempo tarda un objeto en caer hasta el suelo.");
    

    h0 = input("Ingrese la altura inicial (metros): ");
    

    tiene_v0 = input("¿El objeto tiene velocidad inicial? (1=Sí, 0=No): ");
    
    if tiene_v0 == 1
        v0 = input("Ingrese la velocidad inicial (m/s, positiva si es hacia arriba, negativa si es hacia abajo): ");
    else
        v0 = 0; 
    end
    
    % Verificar que la altura inicial sea positiva
    if h0 <= 0
        error("Error: La altura inicial debe ser positiva para calcular el tiempo de caída.");
    end
    
    g = 9.8; % m/s²
    
    % Calcular el tiempo de caída
    if v0 == 0
        t_caida = sqrt(2*h0/g);
        fprintf("\nEl objeto cae desde reposo durante %.2f segundos antes de llegar al suelo.\n", t_caida);
        
    else

        a = 0.5*g;
        b = -v0;
        c = -h0;
        
        discriminante = b^2 - 4*a*c;
        
        if discriminante < 0
            error("Error: La ecuación no tiene soluciones reales con los datos proporcionados.");
        end
        
        t1 = (-b + sqrt(discriminante))/(2*a);
        t2 = (-b - sqrt(discriminante))/(2*a);
        

        tiempos_validos = [];
        if t1 > 0
            tiempos_validos(end+1) = t1;
        end
        if t2 > 0
            tiempos_validos(end+1) = t2;
        end
        
        if isempty(tiempos_validos)
            error("Error: No hay soluciones positivas para el tiempo con los datos proporcionados.");
        end
        
        
        % Interpretación del resultado
        if v0 > 0
            fprintf("\nEl objeto es lanzado hacia ARRIBA desde %.2f metros.\n", h0);
            fprintf("Tarda %.2f segundos en volver a la altura inicial.\n", t_caida);
            
            % Si hay dos soluciones, mostrar también cuando llega al suelo
            if length(tiempos_validos) > 1
                t_suelo = max(tiempos_validos);
                fprintf("Tardará un total de %.2f segundos en llegar al suelo.\n", t_suelo);
            end
        else
            fprintf("\nEl objeto es lanzado hacia ABAJO desde %.2f metros.\n", h0);
            fprintf("Tardará %.2f segundos en llegar al suelo.\n", t_caida);
        end
    end
    
    % Información adicional
    disp("\nInformación adicional:");
    
    v_impacto = v0 + g*t_caida;
    fprintf("Velocidad de impacto: %.2f m/s\n", v_impacto);
    

    disp("\n¿Desea conocer la altura en un tiempo específico antes del impacto?");
    calcular_altura = input("1=Sí, 0=No: ");
    
    if calcular_altura == 1
        t_consulta = input("Ingrese el tiempo (segundos): ");
        
        if t_consulta > t_caida || t_consulta < 0
            warning("El tiempo ingresado está fuera del rango de caída (0 a %.2f segundos).", t_caida);
        end
        
        h = h0 + v0*t_consulta - 0.5*g*t_consulta^2;
        fprintf("Altura a los %.2f segundos: %.2f metros\n", t_consulta, h);
    end
end