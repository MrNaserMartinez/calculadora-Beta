function main
    clc;
    clear;

    % Agrega la carpeta de funciones 
    current_dir = pwd;
    addpath(fullfile(current_dir, 'funciones'));

    disp('===MÉTODO DE NEWTON-RAPHSON PARA ENCONTRAR RAÍCES===');

    % Solicitar datos al usuario
    function_str = input('Ingrese la función f(x): ', 's');
    derivada_str = input('Ingrese la derivada de la función f''(x)', 's');
    x0 = input('Ingrese el valor inicial x0: ');
    tol = input('Ingrese la tolerancia deseada (por ejemplo, 1e-50): ');
    max_iter = input('Ingrese el número máximo de iteraciones: ');

    % Convertir las cadenas de texto a funciones
    f = str2func(['@(x) ' function_str]);
    df = str2func(['@(x) ' derivada_str]);

    % Validar los datos de entrada
    if ~validar_entrada(x0, tol, max_iter)
        return;
    end

    % Aplicar el método de Newton-Raphson
    [raiz, iteraciones, convergencia, historia] = newton_raphson(f, df, x0, tol, max_iter);

     % Mostrar los resultados
     mostrar_resultados(raiz, iteraciones, convergencia, historia, function_str);
end
