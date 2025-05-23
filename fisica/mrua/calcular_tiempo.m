function calcular_tiempo()
% CALCULAR_TIEMPO Calcula el tiempo en MRUA
%   Utiliza diferentes fórmulas según los datos disponibles
    clc;
    disp("=== CÁLCULO DE TIEMPO EN MRUA ===");
    disp("¿Qué datos tiene disponibles?");
    disp("1. Velocidades y aceleración: t = (v - v₀)/a");
    disp("2. Posición, velocidad inicial y aceleración: ecuación cuadrática");
    disp("3. Velocidades y distancia: ecuación cuadrática o t = 2d/(v + v₀)");
    
    opcion = input("Seleccione una opción (1-3): ");
    
    switch opcion
        case 1
            % Usando velocidades y aceleración
            v0 = input("Ingrese la velocidad inicial (m/s): ");
            v = input("Ingrese la velocidad final (m/s): ");
            a = input("Ingrese la aceleración (m/s²): ");
            
            if a == 0
                if v == v0
                    disp("Con aceleración cero y velocidades iguales, el tiempo puede ser cualquiera.");
                    disp("El móvil se mueve con velocidad constante (MRU).");
                    return;
                else
                    error("Error: La aceleración no puede ser cero si las velocidades son diferentes.");
                end
            end
            
            t = (v - v0)/a;
            
            fprintf("\nRESULTADOS:\n");
            fprintf("Velocidad inicial (v₀): %.2f m/s\n", v0);
            fprintf("Velocidad final (v): %.2f m/s\n", v);
            fprintf("Aceleración (a): %.2f m/s²\n", a);
            
            if t < 0
                fprintf("\nTiempo calculado: %.2f s (negativo)\n", t);
                disp("Un tiempo negativo indica que ese estado habría ocurrido en el pasado.");
                disp("Para que el cálculo tenga sentido físico, considere invertir la dirección");
                disp("de alguna de las variables o usar el valor absoluto del tiempo.");
                
                fprintf("\nTiempo físicamente válido: %.2f s\n", abs(t));
            else
                fprintf("\nTiempo: %.2f s\n", t);
            end
            
            dx = v0*t + 0.5*a*t^2;
            fprintf("\nInformación adicional:\n");
            fprintf("Desplazamiento: %.2f m\n", dx);
            
        case 2
            % Usando posición, velocidad inicial y aceleración
            x0 = input("Ingrese la posición inicial (m): ");
            x = input("Ingrese la posición final (m): ");
            v0 = input("Ingrese la velocidad inicial (m/s): ");
            a = input("Ingrese la aceleración (m/s²): ");
            
            dx = x - x0;
            
            if a == 0
                if v0 == 0
                    if dx == 0
                        disp("Con aceleración cero, velocidad inicial cero y sin desplazamiento,");
                        disp("el tiempo puede ser cualquiera. El móvil está en reposo.");
                    else
                        disp("Con aceleración cero y velocidad inicial cero, no es posible");
                        disp("alcanzar un desplazamiento distinto de cero.");
                    end
                    return;
                else
                    t = dx/v0;
                    
                    fprintf("\nRESULTADOS:\n");
                    fprintf("Con aceleración cero, el móvil se mueve con velocidad constante (MRU).\n");
                    fprintf("Tiempo: %.2f s\n", t);
                    
                    if t < 0
                        disp("El tiempo es negativo, lo que indica que la posición final");
                        disp("se habría alcanzado en el pasado con respecto al estado inicial.");
                    end
                    
                    return;
                end
            end
            
            coef_a = 0.5*a;
            coef_b = v0;
            coef_c = -dx;
            
            discriminante = coef_b^2 - 4*coef_a*coef_c;
            
            if discriminante < 0
                disp("No hay solución real. El móvil no puede alcanzar esa posición.");
                return;
            end
           
            t1 = (-coef_b + sqrt(discriminante))/(2*coef_a);
            t2 = (-coef_b - sqrt(discriminante))/(2*coef_a);
            
            % Mostrar resultado
            fprintf("\nRESULTADOS:\n");
            fprintf("Ecuación cuadrática: %.2f·t² + %.2f·t - %.2f = 0\n", coef_a, coef_b, abs(coef_c));
            fprintf("Solución 1: t = %.2f s\n", t1);
            fprintf("Solución 2: t = %.2f s\n", t2);
            
            fprintf("\nInterpretación física:\n");
            if t1 > 0 && t2 > 0
                disp("Ambas soluciones son positivas. Hay dos instantes en que el móvil");
                disp("pasa por la posición indicada (ida y vuelta).");
                fprintf("El móvil pasa por x = %.2f m primero en t = %.2f s y luego en t = %.2f s.\n", x, min(t1, t2), max(t1, t2));
            elseif t1 > 0
                fprintf("Solo la primera solución (t = %.2f s) es físicamente válida.\n", t1);
                disp("La segunda solución es negativa, lo que indica un evento en el pasado.");
            elseif t2 > 0
                fprintf("Solo la segunda solución (t = %.2f s) es físicamente válida.\n", t2);
                disp("La primera solución es negativa, lo que indica un evento en el pasado.");
            else
                disp("Ambas soluciones son negativas, lo que indica que el móvil habría");
                disp("pasado por esa posición en el pasado respecto al estado actual.");
            end
            
        case 3
            % Usando velocidades y distancia
            v0 = input("Ingrese la velocidad inicial (m/s): ");
            v = input("Ingrese la velocidad final (m/s): ");
            d = input("Ingrese la distancia recorrida (m, valor positivo): ");
            
            if d < 0
                error("Error: La distancia debe ser positiva.");
            end
            
            disp("¿Conoce la aceleración?");
            disp("1. Sí");
            disp("2. No (se calculará a partir de los datos)");
            conoce_a = input("Seleccione una opción (1-2): ");
            
            if conoce_a == 1
                a = input("Ingrese la aceleración (m/s²): ");
                
                if a == 0
                    if v0 == 0
                        disp("Con aceleración cero y velocidad inicial cero, no es posible");
                        disp("recorrer una distancia positiva.");
                        return;
                    else
                        t = d/v0;
                        
                        fprintf("\nRESULTADOS:\n");
                        fprintf("Con aceleración cero, el móvil se mueve con velocidad constante (MRU).\n");
                        fprintf("Tiempo: %.2f s\n", t);
                        
                        if t < 0
                            disp("El tiempo es negativo, lo que no tiene sentido físico.");
                            disp("Revise el signo de la velocidad inicial y la distancia.");
                        end
                        
                        return;
                    end
                end
                
                coef_a = 0.5*a;
                coef_b = v0;
                coef_c = -d;
                
                discriminante = coef_b^2 - 4*coef_a*coef_c;
                
                if discriminante < 0
                    disp("No hay solución real. Revise los datos ingresados.");
                    return;
                end
                
                t1 = (-coef_b + sqrt(discriminante))/(2*coef_a);
                t2 = (-coef_b - sqrt(discriminante))/(2*coef_a);
                
                if a > 0 && v0 < 0
                    t_valido = max(t1, t2);
                    if t_valido > 0
                        t = t_valido;
                    else
                        disp("No hay solución positiva. Revise los datos.");
                        return;
                    end
                else
                    % En general, tomamos la solución positiva más pequeña
                    soluciones_positivas = [t1, t2];
                    soluciones_positivas = soluciones_positivas(soluciones_positivas > 0);
                    
                    if isempty(soluciones_positivas)
                        disp("No hay solución positiva. Revise los datos.");
                        return;
                    else
                        t = min(soluciones_positivas);
                    end
                end
                
                % Mostrar resultado
                fprintf("\nRESULTADOS:\n");
                fprintf("Tiempo: %.2f s\n", t);
                
                v_calculada = v0 + a*t;
                
                if abs(v - v_calculada) > 0.01
                    fprintf("\nAdvertencia: La velocidad final calculada (%.2f m/s) no coincide con la ingresada (%.2f m/s).\n", v_calculada, v);
                    disp("Esto puede indicar que los datos no son consistentes con el MRUA.");
                end
                
            else
                a = (v^2 - v0^2)/(2*d);
                
                if a ~= 0
                    t = (v - v0)/a;
                else
                    % Con a = 0, estamos en MRU, entonces t = d/v0 (asumiendo v0 = v)
                    if v0 ~= 0
                        t = d/v0;
                    else
                        disp("Con aceleración cero y velocidad cero, no se puede determinar el tiempo.");
                        return;
                    end
                end
                
                % Mostrar resultado
                fprintf("\nRESULTADOS:\n");
                fprintf("Aceleración calculada: %.2f m/s²\n", a);
                
                if t < 0
                    fprintf("Tiempo calculado: %.2f s (negativo)\n", t);
                    disp("Un tiempo negativo indica inconsistencia en los datos.");
                    disp("Verifique si la velocidad final y la distancia son compatibles.");
                else
                    fprintf("Tiempo: %.2f s\n", t);
                end
            end
            
        otherwise
            disp("Opción no válida.");
            return;
    end
    
end