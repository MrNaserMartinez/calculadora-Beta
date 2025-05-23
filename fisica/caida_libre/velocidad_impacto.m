function velocidad_impacto()
% VELOCIDAD_IMPACTO Calcula la velocidad con la que un objeto impacta el suelo
%   Esta función calcula la velocidad final con la que un objeto golpea el
%   suelo después de caer desde una determinada altura.
    clc;
    disp("=== CÁLCULO DE VELOCIDAD DE IMPACTO ===");
    disp("Esta función calcula la velocidad con la que un objeto golpea el suelo");

    h0 = input("Ingrese la altura inicial (metros): ");

    tiene_v0 = input("¿El objeto tiene velocidad inicial? (1=si, 0=No): ");

    if tiene_v0 == 1
        v0 = input("Ingrese la velocidad inicial (m/s, positiva si es hacia arriba, negativa si es hacia abajo): ");
    else
        v0 = 0; 
    end

    if h0 <= 0
        error("Error: La altura inicial debe ser positiva para calcular la velocidad de impacto.");
    end

    g = 9.8;

    % Calculamos el valor absoluto de la velocidad primero
    v_impacto_abs = sqrt(v0^2 + 2*g*h0);
    

    v_impacto = -v_impacto_abs;
    
    
    fprintf("\nRESULTADOS:\n");
    fprintf("Velocidad de impacto: %.2f m/s (hacia abajo)\n", abs(v_impacto));
    
    %info adicional
    energia_cinetica = 0.5 * 1 * v_impacto^2; 
    fprintf("Energía cinética en el impacto (por unidad de masa): %.2f J/kg\n", abs(energia_cinetica));
    
    if abs(v_impacto) < 5
        fprintf("Esta velocidad es similar a dejar caer un objeto desde la altura de una mesa.\n");
    elseif abs(v_impacto) < 10
        fprintf("Esta velocidad es comparable a la de un objeto lanzado suavemente con la mano.\n");
    elseif abs(v_impacto) < 20
        fprintf("Esta velocidad es similar a la de una pelota de tenis lanzada con fuerza moderada.\n");
    else
        fprintf("¡Esta es una velocidad considerable! Comparable a un vehículo moviéndose a %.1f km/h.\n", abs(v_impacto)*3.6);
    end
    
    % Calcular el tiempo que tardó en caer
    if v0 == 0
        tiempo_caida = sqrt(2*h0/g);
        fprintf("Tiempo de caída: %.2f segundos\n", tiempo_caida);
    else
        a = 0.5*g;
        b = -v0;
        c = -h0;
        
        discriminante = b^2 - 4*a*c;
        
        if discriminante >= 0
            t1 = (-b + sqrt(discriminante))/(2*a);
            t2 = (-b - sqrt(discriminante))/(2*a);
            
            % Seleccionamos el tiempo positivo más pequeño
            tiempos_validos = [t1, t2];
            tiempos_validos = tiempos_validos(tiempos_validos > 0);
            
            if ~isempty(tiempos_validos)
                tiempo_caida = min(tiempos_validos);
                fprintf("Tiempo de caída: %.2f segundos\n", tiempo_caida);
            end
        end
    end
    
    disp("\n¿Desea calcular otra magnitud?");
    disp("1. Calcular altura en un instante específico");
    disp("2. Calcular velocidad en un instante específico");
    disp("3. Volver al menú anterior");
    
    opcion = input("Seleccione una opción: ");
    
    switch opcion
        case 1
            % Calcular altura en un instante específico
            t = input("Ingrese el tiempo (segundos): ");
            
            if t < 0
                error("El tiempo no puede ser negativo.");
            elseif t > tiempo_caida
                disp("Advertencia: El tiempo ingresado es mayor al tiempo de caída.");
                disp("El objeto ya habría impactado el suelo.");
            else
                h = h0 + v0*t - 0.5*g*t^2;
                fprintf("Altura a los %.2f segundos: %.2f metros\n", t, h);
            end
            
        case 2
            % Calcular velocidad en un instante específico
            t = input("Ingrese el tiempo (segundos): ");
            
            if t < 0
                error("El tiempo no puede ser negativo.");
            elseif t > tiempo_caida
                disp("Advertencia: El tiempo ingresado es mayor al tiempo de caída.");
                disp("El objeto ya habría impactado el suelo.");
            else
                v = v0 - g*t;
                fprintf("Velocidad a los %.2f segundos: %.2f m/s\n", t, v);
                
                if v > 0
                    fprintf("(el objeto está subiendo)\n");
                elseif v < 0
                    fprintf("(el objeto está bajando)\n");
                else
                    fprintf("(el objeto está en su punto más alto)\n");
                end
            end
            
        case 3
            return;
            
        otherwise
            disp("Opción no válida.");
    end
end