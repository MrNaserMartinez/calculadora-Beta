function mostrar_resultados(raiz, iteraciones, convergencia, historia, funcion_str)

    disp('====RESULTADOS====');

    % Mostrar resultados según si hubo convergencia o no
    if convergencia
        disp(['La raíz aproximada de ' funcion_str ' es: ' num2str(raiz)]);
        disp(['Valor de la función en la raíz: ' num2str(historia(end, 2))]);
        disp(['Convergencia alcanzada en ' num2str(iteraciones) ' iteraciones.']);
    else
        disp('El método no convergió con los parámetros dados.');
        disp(['última aproximación: ' num2str(raiz)]);
        disp(['Valor de la función en la última aproximación: ' num2str(historia(end, 2))]);
        disp(['Iteraciones realizadas: ' num2str(iteraciones)]);
    end

    % Mostrar tabla de iteraciones
    disp('=====HISTORIAL DE ITERACIONES=====');
    disp('   Iteracion      x_i           f(x_i)       Error');
    

    % Mostrar la iteración inicial 
    fprintf('     %d      %14.10f       %14.10f      %s\n', 0, historia(1, 1), historia(1, 2), '-');

    % Mostrar las iteraciones subsiguientes
    for i = 1:iteraciones
        fprintf('         %d          $14.10f          %14.10f         %14.10f\n', i, historia(i+1, 1), historia(i+1, 2), historia(i+1, 3));
    end
end
