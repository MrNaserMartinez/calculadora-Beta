function calcular_derivada()
% CALCULAR_DERIVADA - Interfaz principal para el cálculo de derivadas


    % Limpiar pantalla y mostrar encabezado
    clc;
    disp('===================================================');
    disp('              CÁLCULO DE DERIVADAS                 ');
    disp('===================================================');
    
    % Menú principal
    disp('Seleccione una opción:');
    disp('1. Derivada numérica de una función personalizada');
    disp('2. Derivada de una función predefinida');
    disp('3. Tabla de derivadas comunes (referencia)');
    disp('4. Volver al menú principal');
    
    opcion = input('Opción: ');
    
    switch opcion
        case 1
            derivada_personalizada();
        case 2
            derivada_predefinida();
        case 3
            tabla_derivadas();
        case 4
            % Volver al menú principal
            return;
        otherwise
            disp('Opción no válida. Inténtelo de nuevo.');
            pause(2);
            calcular_derivada();
    end
end