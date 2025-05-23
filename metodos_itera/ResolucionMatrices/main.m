function main()

    addpath('operaciones');
    addpath('utilidades');

    continuar = true;

    clc;
    disp('===== CALCULADORA DE MATRICES =====');
    pause(1);

    while continuar
        disp('========== MENÚ PRINCIPAL ==========');
        disp('1. Operaciones Básicas (Suma, Resta, Multiplicación)');
        disp('2. Calcular Determinante');
        disp('3. Matriz Inversa');
        disp('4. Matriz Transpuesta');
        disp('5. Resolver Sistema de Ecuaciones');
        disp('0. Salir');

        opcion = input('Seleccione una opción: ');

        % Ejecutar según la opción elegida
        switch opcion
            case 1
                operacionesBasicas();
            case 2
                determinante();
            case 3
                matrizInversa();
            case 4
                transpuesta();
            case 5
                sistemaEcuaciones();
            case 0
                disp('¡Gracias por usar el programa!');
                continuar = false;
            otherwise
                disp('Opción no válida. Intente nuevamente.');
                pause(2);
        end
    end
end