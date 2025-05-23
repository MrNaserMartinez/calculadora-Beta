% filepath: c:\Users\mario\Desktop\Calculadora\integrales\calcular_integral.m
function calcular_integral()
% CALCULAR_INTEGRAL - Función principal del módulo de integrales
%
% Proporciona un menú para seleccionar diferentes opciones
% relacionadas con el cálculo de integrales definidas.

    while true
        % Limpiar pantalla y mostrar encabezado
        clc;
        disp('===================================================');
        disp('                 CÁLCULO DE INTEGRALES              ');
        disp('===================================================');
        disp(' ');
        
        % Mostrar opciones
        disp('Seleccione una opción:');
        disp('  1. Calcular integral de función predefinida');
        disp('  2. Ingresar función manual');
        disp('  3. Mostrar fórmulas de integración');
        disp('  4. Volver al menú principal');
        disp(' ');
        
        % Obtener la selección del usuario
        opcion = input('Opción: ');
        
        % Procesar la selección
        switch opcion
            case 1
                calcular_integrales_comunes();
            case 2
                ingresar_funcion_manual();
            case 3
                mostrar_formulas_integracion();
            case 4
                % Volver al menú principal
                disp('Volviendo al menú principal...');
                pause(1);
                return;
            otherwise
                disp('Opción no válida. Inténtelo de nuevo.');
                pause(2);
        end
    end
end