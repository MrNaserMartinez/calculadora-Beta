function es_valido = validar_entrada(x0, tol, max_iter)

    % Si los datos son válidos(1) no válidos(0)
    es_valido = 1;

    % Verificar que x0 sea un número
    if ~isnumeric(x0) || ~isscalar(x0)
        disp('Error: El valor inicial debe ser un número.');
        es_valido = 0;
    end

    % Verificar que la tolerancia sea positiva 
    if ~isnumeric(tol) || tol <= 0
        disp('Error: La tolerancia debe ser un número positivo.');
        es_valido = 0;
    end

    % Verificar que el número máximo de iteraciones sea un entero positivo
    if ~isnumeric(max_iter) || max_iter <= 0 || floor(max_iter) ~= max_iter
        disp('Error: El número máximo de iteraciones debe ser un entero positivo');
        es_valido = 0;
    end
end

