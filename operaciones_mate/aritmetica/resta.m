function resultado = resta()
% RESTA - Realiza la resta de dos o más números según lo indique el usuario.
%
% Comienza con dos números y permite seguir restando más si se desea.

    % Solicitar los dos primeros números
    a = input('Ingrese el primer número: ');
    b = input('Ingrese el segundo número: ');

    % Validar entrada
    if ~isnumeric(a) || ~isnumeric(b)
        error('Ambos valores deben ser numéricos.');
    end

    % Realizar la resta inicial
    resultado = a - b;

    % Preguntar si desea seguir restando más números
    continuar = input('¿Desea restar más números? (s/n): ', 's');

    while lower(continuar) == 's'
        nuevo = input('Ingrese otro número a restar: ');
        if ~isnumeric(nuevo)
            error('Debe ingresar un valor numérico.');
        end
        resultado = resultado - nuevo;
        continuar = input('¿Desea restar otro número? (s/n): ', 's');
    end
end
