function tiempo_vuelo()
% TIEMPO_VUELO Calcula el tiempo de vuelo de un proyectil
%   Esta función calcula el tiempo que tarda un proyectil en tocar el suelo
%   desde su lanzamiento.

    disp("=== CÁLCULO DE TIEMPO DE VUELO DE UN PROYECTIL ===");
    
    v0 = input("Ingrese la velocidad inicial (m/s): ");
    angulo_grad = input("Ingrese el ángulo de lanzamiento (grados): ");
    h0 = input("Ingrese la altura inicial (m): ");
    
    if v0 <= 0
        error("Error: La velocidad inicial debe ser positiva.");
    end
    
    if angulo_grad < -90 || angulo_grad > 90
        error("Error: El ángulo debe estar entre -90 y 90 grados.");
    end
    
    angulo = angulo_grad * pi / 180;
    
    g = 9.8; 
    
    % Componentes de la velocidad inicial
    v0x = v0 * cos(angulo);
    v0y = v0 * sin(angulo);
    
    if h0 == 0 && v0y <= 0
        disp("Para un lanzamiento horizontal o hacia abajo desde el suelo, el tiempo de vuelo es cero.");
        tiempo_vuelo = 0;
    elseif h0 == 0
        tiempo_vuelo = 2 * v0y / g;
    else
        a = 0.5 * g;
        b = -v0y;
        c = h0;
        
        discriminante = b^2 - 4*a*c;
        
        if discriminante < 0
            error("Error: No hay solución real. Revise los datos.");
        end
        
        t1 = (-b + sqrt(discriminante))/(2*a);
        t2 = (-b - sqrt(discriminante))/(2*a);
        
        if t1 > 0 && t2 > 0
            tiempo_vuelo = min(t1, t2); 
        elseif t1 > 0
            tiempo_vuelo = t1;
        elseif t2 > 0
            tiempo_vuelo = t2;
        else
            error("Error: No hay solución con tiempo positivo.");
        end
    end
    
    alcance = v0x * tiempo_vuelo;
    
    % Calcular altura máxima
    tiempo_altura_maxima = v0y / g;
    
    if tiempo_altura_maxima > 0 && tiempo_altura_maxima < tiempo_vuelo
        altura_maxima = h0 + v0y^2 / (2*g);
    else
        if v0y <= 0
            altura_maxima = h0; 
        else
            altura_maxima = h0 + v0y * tiempo_vuelo - 0.5 * g * tiempo_vuelo^2;
        end
    end
    
    % Mostrar resultados
    fprintf("\nRESULTADOS:\n");
    fprintf("Velocidad inicial: %.2f m/s\n", v0);
    fprintf("Ángulo de lanzamiento: %.2f grados\n", angulo_grad);
    fprintf("Altura inicial: %.2f m\n", h0);
    fprintf("\nTiempo de vuelo: %.2f s\n", tiempo_vuelo);
    
    % Información adicional
    fprintf("\nInformación adicional:\n");
    fprintf("Alcance horizontal: %.2f m\n", alcance);
    fprintf("Altura máxima: %.2f m\n", altura_maxima);
    
    % Velocidad final
    vfy = v0y - g * tiempo_vuelo;
    velocidad_impacto = sqrt(v0x^2 + vfy^2);
    fprintf("Velocidad de impacto: %.2f m/s\n", velocidad_impacto);
    
    % Comparar con el tiempo de caída libre desde h0
    if angulo_grad > 0
        t_caida_libre = sqrt(2 * h0 / g);
        fprintf("\nCuriosidad: Un objeto en caída libre desde %.2f m tardaría %.2f s en llegar al suelo.\n", h0, t_caida_libre);
        if tiempo_vuelo > t_caida_libre
            fprintf("El proyectil tarda más debido a su velocidad vertical inicial hacia arriba.\n");
        elseif tiempo_vuelo < t_caida_libre && h0 > 0
            fprintf("El proyectil tarda menos debido a su velocidad vertical inicial hacia abajo.\n");
        end
    end
   