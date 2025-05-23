% filepath: c:\Users\mario\Desktop\Calculadora\integrales\ingresar_funcion_manual.m
function ingresar_funcion_manual()
% INGRESAR_FUNCION_MANUAL - Permite al usuario ingresar una función personalizada para integrar
%
% Esta función solicita al usuario una expresión matemática y la convierte en
% un handle de función para calcular su integral definida.

    % Limpiar pantalla y mostrar encabezado
    clc;
    disp('===================================================');
    disp('         INTEGRACIÓN DE FUNCIÓN MANUAL             ');
    disp('===================================================');
    disp(' ');
    disp('Ingrese una función de x. Ejemplos:');
    disp('  x^2 + 3*x - 1');
    disp('  sin(x)');
    disp('  exp(x)');
    disp('  log(x)');
    disp('  1/(1+x^2)');
    disp(' ');
    
    % Solicitar la función
    expr = input('Función f(x): ', 's');
    
    % Verificar si el usuario ingresó algo
    if isempty(expr)
        disp('No se ingresó ninguna función.');
        input('Presione Enter para continuar...');
        return;
    end
    
    % Convertir la expresión de texto a una función
    try
        func = str2func(['@(x) ' expr]);
        
        % Probar la función con un valor
        func(1);
    catch e
        disp(['Error en la función: ', e.message]);
        input('Presione Enter para continuar...');
        return;
    end
    
    % Solicitar los límites de integración
    disp(' ');
    a = input('Ingrese el límite inferior: ');
    b = input('Ingrese el límite superior: ');
    
    % Validar los límites
    if ~isnumeric(a) || ~isnumeric(b)
        disp('Los límites deben ser valores numéricos.');
        input('Presione Enter para continuar...');
        return;
    end
    
    % Comprobar si la función es válida en los límites
    try
        fa = func(a);
        fb = func(b);
        
        if isnan(fa) || isinf(fa) || isnan(fb) || isinf(fb)
            disp('La función no está definida en los límites proporcionados.');
            input('Presione Enter para continuar...');
            return;
        end
    catch
        disp('La función no puede ser evaluada en los límites proporcionados.');
        input('Presione Enter para continuar...');
        return;
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
        disp(['Función: f(x) = ', expr]);
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
    
    % Esperar antes de volver
    disp(' ');
    input('Presione Enter para continuar...');
end