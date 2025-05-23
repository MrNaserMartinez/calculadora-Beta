function resultado = multiplicacion()
% MULTIPLICACION - Realiza la multiplicación de dos o más números según lo indique el usuario.
%
% Comienza con dos números y permite seguir multiplicando más si el usuario lo desea.

    % Solicitar los dos primeros números
    a = input('Ingrese el primer número: ');
    b = input('Ingrese el segundo número: ');

    % Validar que ambos sean numéricos
    if ~isnumeric(a) || ~isnumeric(b)
        error('Ambos valores deben ser numéricos.');
    end

    % Multiplicar los dos valores
    resultado = a * b;

    % Preguntar si desea seguir multiplicando más números
    continuar = input('¿Desea multiplicar otro número? (s/n): ', 's');

    while lower(continuar) == 's'
        nuevo = input('Ingrese el siguiente número a multiplicar: ');
        if ~isnumeric(nuevo)
            error('Debe ingresar un valor numérico.');
        end
        resultado = resultado * nuevo;
        continuar = input('¿Desea multiplicar otro número? (s/n): ', 's');
    end
end
