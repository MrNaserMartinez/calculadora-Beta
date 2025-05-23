 function calcular_aritmetica()
% CALCULAR_ARITMETICA - Muestra un menú y ejecuta operaciones aritméticas.
% Permite reutilizar el resultado anterior en la siguiente operación.
% Permite agregar múltiples números a una operación de forma iterativa.

    continuar = 's';
    resultado_anterior = []; % Almacena el resultado de la operación anterior

    while lower(continuar) == 's'
        clc;
        fprintf('\n=== Calculadora Aritmética ===\n');
        fprintf('Seleccione la operación:\n');
        fprintf('1. Suma\n');
        fprintf('2. Resta\n');
        fprintf('3. Multiplicación\n');
        fprintf('4. División\n');

        opcion = input('Ingrese una opción (1-4): ');
        
        % Verificar si la opción es válida
        if opcion < 1 || opcion > 4 || isempty(opcion) || ~isnumeric(opcion)
            fprintf('Opción no válida. Intente con un número del 1 al 4.\n');
            pause(2);
            continue;
        end
        
        % Inicializar variables
        usar_anterior = false;
        agregar_numero = 's';
        resultado = [];
        
        % Verificar si se usará el resultado anterior
        if ~isempty(resultado_anterior)
            respuesta = input('¿Desea usar el resultado anterior como primer número? (s/n): ', 's');
            usar_anterior = lower(respuesta) == 's';
        end
        
        % Obtener el primer resultado según la operación seleccionada
        switch opcion
            case 1
                resultado = suma_condicional(usar_anterior, resultado_anterior);
            case 2
                resultado = resta_condicional(usar_anterior, resultado_anterior);
            case 3
                resultado = multiplicacion_condicional(usar_anterior, resultado_anterior);
            case 4
                resultado = division_condicional(usar_anterior, resultado_anterior);
        end
        
        fprintf('Resultado parcial: %.2f\n', resultado);
        
        % Bucle para agregar más números a la operación
        while lower(agregar_numero) == 's'
            agregar_numero = input('¿Desea agregar otro número? (s/n): ', 's');
            
            if lower(agregar_numero) == 's'
                num_adicional = input('Ingrese el número adicional: ');
                
                % Aplicar la operación con el número adicional
                switch opcion
                    case 1
                        resultado = resultado + num_adicional;
                    case 2
                        resultado = resultado - num_adicional;
                    case 3
                        resultado = resultado * num_adicional;
                    case 4
                        if num_adicional == 0
                            fprintf('Error: No se puede dividir por cero.\n');
                        else
                            resultado = resultado / num_adicional;
                        end
                end
                
                fprintf('Resultado parcial: %.2f\n', resultado);
            end
        end
        
        fprintf('\nResultado final: %.2f\n', resultado);
        resultado_anterior = resultado;
        
        continuar = input('\n¿Desea realizar otra operación aritmética? (s/n): ', 's');
    end

    fprintf('\nGracias por usar la calculadora aritmética.\n');
end