function calcular_proyectil()
% CALCULAR_PROYECTIL Función que muestra el menú de opciones para movimiento parabólico

    clc;
    disp("=== CALCULADORA DE LANZAMIENTO DE PROYECTILES ===");
    disp("1. Calcular alcance horizontal");
    disp("2. Calcular altura máxima");
    disp("3. Calcular tiempo de vuelo");
    disp("4. Calcular posición en un instante dado");
    disp("0. Volver al menú principal");
    
    opcion = input("Seleccione una opción: ");
    
    if opcion == 0
        return;
    end
    
    switch opcion
        case 1
            alcance_horizontal();
        case 2
            altura_maxima();
        case 3
            tiempo_vuelo();
        case 4
            % Calcular posición en un instante dado
            disp("Para calcular la posición, necesitamos los datos iniciales:");
            datos = pedir_datos({'velocidad inicial (m/s)', 'ángulo de lanzamiento (grados)', ...
                               'altura inicial (m)', 'tiempo (s)'});
            v0 = datos(1);
            angulo_grad = datos(2);
            h0 = datos(3);
            t = datos(4);
            
            % Convertir ángulo a radianes
            angulo = angulo_grad * pi / 180;
            
            % Componentes de la velocidad inicial
            v0x = v0 * cos(angulo);
            v0y = v0 * sin(angulo);
            
            g = 9.8; % Aceleración de la gravedad
            
            % Calcular posición
            x = v0x * t;
            y = h0 + v0y * t - 0.5 * g * t^2;
            
            fprintf("Posición en t = %.2f s:\n", t);
            mostrar_resultado('Coordenada X', x, 'm');
            mostrar_resultado('Coordenada Y', y, 'm');
        otherwise
            disp("Opción no válida");
    end
end