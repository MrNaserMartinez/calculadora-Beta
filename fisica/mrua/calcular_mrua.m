function calcular_mrua()
% CALCULAR_MRUA Función que muestra el menú de opciones para cálculos de MRUA

    clc;
    disp("=== CALCULADORA DE MOVIMIENTO RECTILÍNEO UNIFORMEMENTE ACELERADO ===");
    disp("1. Calcular posición final");
    disp("2. Calcular velocidad final");
    disp("3. Calcular aceleración");
    disp("4. Calcular tiempo");
    disp("5. Calcular distancia recorrida");
    disp("0. Volver al menú principal");
    
    opcion = input("Seleccione una opción: ");
    
    if opcion == 0
        return;
    end
    
    switch opcion
        case 1
            calcular_posicion();
        case 2
            calcular_velocidad();
        case 3
            calcular_aceleracion();
        case 4
            calcular_tiempo();
        case 5
            % Solicitar datos para calcular distancia recorrida
            datos = pedir_datos({'velocidad inicial (m/s)', 'tiempo (s)', 'aceleración (m/s²)'});
            v0 = datos(1);
            t = datos(2);
            a = datos(3);
           
            distancia = v0 * t + 0.5 * a * t^2;
            
            % Mostrar resultado
            mostrar_resultado('Distancia recorrida', distancia, 'm');
        otherwise
            disp("Opción no válida");
    end
end