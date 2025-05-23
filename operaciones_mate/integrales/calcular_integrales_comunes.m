% filepath: c:\Users\mario\Desktop\Calculadora\integrales\calcular_integrales_comunes.m
function calcular_integrales_comunes()
% CALCULAR_INTEGRALES_COMUNES - Permite calcular integrales de funciones predefinidas
%
% Esta función muestra un menú con funciones comunes para integrar y
% permite al usuario seleccionar una de ellas para calcular su integral definida.

    % Definir las funciones disponibles
    funciones = {
        @(x) x.^2,                     % Función cuadrática
        @(x) x.^3,                     % Función cúbica
        @(x) sin(x),                   % Seno
        @(x) cos(x),                   % Coseno
        @(x) exp(x),                   % Exponencial
        @(x) log(x),                   % Logaritmo natural
        @(x) 1./(1+x.^2),              % Función racional
        @(x) sqrt(x),                  % Raíz cuadrada
        @(x) x.*sin(x),                % Producto de funciones
        @(x) x.*exp(-x.^2)             % Función gaussiana
    };
    
    % Nombres de las funciones para mostrar
    nombres_funciones = {
        'f(x) = x^2',
        'f(x) = x^3',
        'f(x) = sin(x)',
        'f(x) = cos(x)',
        'f(x) = e^x',
        'f(x) = ln(x)',
        'f(x) = 1/(1+x^2)',
        'f(x) = sqrt(x)',
        'f(x) = x*sin(x)',
        'f(x) = x*e^(-x^2)'
    };
    
    while true
        % Limpiar pantalla y mostrar encabezado
        clc;
        disp('===================================================');
        disp('      INTEGRALES DE FUNCIONES PREDEFINIDAS         ');
        disp('===================================================');
        disp(' ');
        
        % Mostrar las opciones
        disp('Seleccione una función para integrar:');
        for i = 1:length(nombres_funciones)
            disp(['  ', num2str(i), '. ', nombres_funciones{i}]);
        end
        disp(['  ', num2str(length(funciones)+1), '. Volver al menú anterior']);
        disp(' ');
        
        % Obtener la selección del usuario
        opcion = input('Opción: ');
        
        % Verificar si el usuario quiere volver al menú anterior
        if opcion == length(funciones) + 1
            return;
        end
        
        % Verificar que la selección sea válida
        if opcion < 1 || opcion > length(funciones)
            disp('Opción no válida. Inténtelo de nuevo.');
            pause(2);
            continue;
        end
        
        % Obtener la función seleccionada
        func = funciones{opcion};
        nombre_func = nombres_funciones{opcion};
        
        % Solicitar los límites de integración
        disp(' ');
        disp(['Función seleccionada: ', nombre_func]);
        disp(' ');
        a = input('Ingrese el límite inferior: ');
        b = input('Ingrese el límite superior: ');
        
        % Validar los límites
        if ~isnumeric(a) || ~isnumeric(b)
            disp('Los límites deben ser valores numéricos.');
            input('Presione Enter para continuar...');
            continue;
        end
        
        % Verificar limitaciones específicas de algunas funciones
        if opcion == 6 || opcion == 8  % Logaritmo o raíz cuadrada
            if a <= 0 || b <= 0
                disp('Para esta función, los límites deben ser positivos.');
                input('Presione Enter para continuar...');
                continue;
            end
        end
        
        % Mostrar menú de métodos de integración
        disp(' ');
        disp('Seleccione el método de integración:');
        disp('  1. Regla del Trapecio');
        disp('  2. Regla de Simpson');
        disp('  3. Método de los Rectángulos');
        disp('  4. Función quad de MATLAB (más precisa)');
        
        metodo_opcion = input('Método: ');
        
        % Determinar el método seleccionado
        switch metodo_opcion
            case 1
                metodo = 'trapecio';
            case 2
                metodo = 'simpson';
            case 3
                metodo = 'rectangulos';
            case 4
                metodo = 'quad';
            otherwise
                disp('Opción no válida. Usando método predeterminado (quad).');
                metodo = 'quad';
        end
        
        % Calcular la integral
        try
            tic;  % Iniciar cronómetro
            resultado = calcular_integral_definida(func, a, b, metodo);
            tiempo = toc;  % Detener cronómetro
            
            % Mostrar el resultado
            clc;
            disp('===================================================');
            disp('              RESULTADO DE LA INTEGRAL              ');
            disp('===================================================');
            disp(' ');
            disp(['Función: ', nombre_func]);
            disp(['Intervalo: [', num2str(a), ', ', num2str(b), ']']);
            disp(['Método: ', metodo]);
            disp(' ');
            disp(['Resultado: ', num2str(resultado)]);
            disp(['Tiempo de cálculo: ', num2str(tiempo*1000), ' ms']);
            
            % Preguntar si quiere graficar la integral
            disp(' ');
            graficar = input('¿Desea visualizar la integral gráficamente? (s/n): ', 's');
            if strcmpi(graficar, 's')
                graficar_integral(func, a, b);
            end
            
        catch e
            disp(['Error al calcular la integral: ', e.message]);
        end
        
        % Preguntar si quiere calcular otra integral
        disp(' ');
        continuar = input('¿Desea calcular otra integral? (s/n): ', 's');
        if ~strcmpi(continuar, 's')
            return;
        end
    end
end