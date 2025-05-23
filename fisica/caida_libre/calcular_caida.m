function calcular_caida()
% CALCULAR_CAIDA Función que muestra el menú de opciones para caída libre

    clc;
    disp("=== CALCULADORA DE CAÍDA LIBRE Y TIRO VERTICAL ===");
    disp("1. Calcular tiempo de caída");
    disp("2. Calcular velocidad de impacto");
    disp("3. Calcular altura máxima (tiro vertical)");
    disp("4. Calcular altura después de cierto tiempo");
    disp("0. Volver al menú principal");
    
    opcion = input("Seleccione una opción: ");
    
    if opcion == 0
        return;
    end
    
    switch opcion
        case 1
            tiempo_caida();
        case 2
            velocidad_impacto();
        case 3
            altura_maxima();
        case 4
            % Calcular altura después de cierto tiempo
            datos = pedir_datos({'altura inicial (m)', 'velocidad inicial (m/s)', 'tiempo (s)'});
            h0 = datos(1);
            v0 = datos(2);
            t = datos(3);
            g = 9.8;
            h = h0 + v0*t - 0.5*g*t^2;
            
            mostrar_resultado('Altura', h, 'm');
        otherwise
            disp("Opción no válida");
    end
end