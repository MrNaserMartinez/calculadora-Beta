% filepath: c:\Users\mario\Desktop\Calculadora\limites\calcular_limite.m
function calcular_limite()
% CALCULAR_LIMITE - Interfaz principal para el cálculo de límites
% Permite al usuario ingresar una función y calcular su límite en un punto

    % Limpiar pantalla y mostrar encabezado
    clc;
    disp('===================================================');
    disp('              CÁLCULO DE LÍMITES                   ');
    disp('===================================================');
    
    % Menú principal
    disp('Seleccione una opción:');
    disp('1. Calcular límite de una función personalizada');
    disp('2. Calcular límite de una función predefinida');
    disp('3. Tabla de límites comunes (referencia)');
    disp('4. Volver al menú principal');
    
    opcion = input('Opción: ');
    
    switch opcion
        case 1
            limite_personalizado();
        case 2
            limite_predefinido();
        case 3
            tabla_limites();
        case 4
            % Volver al menú principal
            return;
        otherwise
            disp('Opción no válida. Inténtelo de nuevo.');
            pause(2);
            calcular_limite();
    end
end