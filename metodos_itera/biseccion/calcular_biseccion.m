function calcular_biseccion()

% CALCULAR_BISECCION - Interfaz para el método de bisección


    % Limpiar pantalla y mostrar encabezado
    clc;
    disp('===================================================');
    disp('              MÉTODO DE BISECCIÓN                  ');
    disp('===================================================');
    
    % Menú principal
    disp('Seleccione una opción:');
    disp('1. Ingresar función personalizada');
    disp('2. Seleccionar función predefinida');
    disp('3. Volver al menú principal');
    
    opcion = input('Opción: ');
    
    switch opcion
        case 1
            calcular_con_funcion_personalizada();
        case 2
            calcular_con_funcion_predefinida();
        case 3
            % Volver al menú principal
            return;
        otherwise
            disp('Opción no válida. Inténtelo de nuevo.');
            calcular_biseccion();
    end
end

function calcular_con_funcion_personalizada()
    % Solicitar función al usuario
    expr = input('Ingrese la función f(x) (use x como variable): ', 's');
    
    try
        % Crear función anónima para la expresión ingresada
        func = str2func(['@(x) ', expr]);
        % Validar que la función sea válida evaluándola en un punto
        func(1);
    catch
        disp('Error: La función ingresada no es válida.');
        input('Presione Enter para continuar...');
        calcular_biseccion();
        return;
    end
    
    % Continuar con el proceso
    ejecutar_metodo_biseccion(func);
end

function calcular_con_funcion_predefinida()
    % Mostrar funciones predefinidas disponibles
    [funciones, nombres] = predefinidas_biseccion();
    
    disp('Funciones predefinidas disponibles:');
    for i = 1:length(nombres)
        disp([num2str(i), '. ', nombres{i}]);
    end
    
    % Solicitar selección al usuario
    opcion = input('Seleccione una función: ');
    
    if opcion >= 1 && opcion <= length(funciones) %Verifica que opcion elegida sea valida 
        func = funciones{opcion}; % Obtiene el nombre descriptivo de la funcions seleccionada 
        nombre_func = nombres{opcion}; %Muestra el nombre de la funcion 
        disp(['Función seleccionada: ', nombre_func]);
        
        % Continuar con el proceso
        ejecutar_metodo_biseccion(func);
    else
        disp('Selección no válida. Inténtelo de nuevo.');
        input('Presione Enter para continuar...');
        calcular_biseccion();
    end
end

function ejecutar_metodo_biseccion(func)
    % Solicitar intervalo
    disp('Ingrese el intervalo [a, b]:');
    a = input('Valor de a: ');
    b = input('Valor de b: ');
    
    % Validar intervalo
    if ~validar_intervalo(func, a, b)
        input('Presione Enter para continuar...');
        calcular_biseccion();
        return;
    end
    
    % Solicitar parámetros adicionales
    tol = input('Ingrese la tolerancia (dejar vacío para usar 1e-6): ');
    if isempty(tol), tol = 1e-6; end
    
    max_iter = input('Ingrese el número máximo de iteraciones (dejar vacío para usar 100): ');
    if isempty(max_iter), max_iter = 100; end
    
    % Ejecutar método de bisección
    try
        [raiz, iteraciones, error_est] = metodo_biseccion(func, a, b, tol, max_iter);
        
        % Opciones adicionales
        disp(' ');
        disp('Opciones adicionales:');
        disp('1. Graficar resultados');
        disp('2. Volver al menú de bisección');
        disp('3. Volver al menú principal');
        
        opcion = input('Opción: ');
        
        switch opcion
            case 1
                graficar_resultado(func, a, b, raiz);
                input('Presione Enter para continuar...');
                calcular_biseccion();
            case 2
                calcular_biseccion();
            case 3
                % Volver al menú principal
                return;
            otherwise
                disp('Opción no válida.');
                calcular_biseccion();
        end
    catch e
        disp(['Error: ', e.message]);
        input('Presione Enter para continuar...');
        calcular_biseccion();
    end
end