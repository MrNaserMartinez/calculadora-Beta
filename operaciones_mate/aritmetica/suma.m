function resultado = suma()
% SUMA - Realiza la suma de dos o más números según lo indique el usuario.

    % Solicitar los dos primeros números
    a = input('Ingrese el primer número: ');
    b = input('Ingrese el segundo número: ');

    % Validar entrada
    if ~isnumeric(a) || ~isnumeric(b)
        error('Ambos valores deben ser numéricos.');
    end

    % Sumar los dos primeros valores
    resultado = a + b;

    % Preguntar si desea seguir sumando más números
    continuar = input('¿Desea sumar más números? (s/n): ', 's');

    while lower(continuar) == 's'
        nuevo = input('Ingrese otro número a sumar: ');
        if ~isnumeric(nuevo)
            error('Debe ingresar un valor numérico.');
        end
        resultado = resultado + nuevo;
        continuar = input('¿Desea sumar otro número? (s/n): ', 's');
    end
end
