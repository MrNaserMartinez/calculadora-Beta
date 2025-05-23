function resultado = division()
% DIVISION - Realiza la división de dos o más números según lo indique el usuario.
%
% Comienza con dos números y permite seguir dividiendo el resultado por otros valores.

    % Solicitar los dos primeros números
    a = input('Ingrese el numerador: ');
    b = input('Ingrese el denominador: ');

    % Validar entradas
    if ~isnumeric(a) || ~isnumeric(b)
        error('Ambos valores deben ser numéricos.');
    end

    if b == 0
        error('No se puede dividir entre cero.');
    end

    % División inicial
    resultado = a / b;

    % Preguntar si desea seguir dividiendo
    continuar = input('¿Desea dividir el resultado entre otro número? (s/n): ', 's');

    while lower(continuar) == 's'
        nuevo = input('Ingrese el siguiente divisor: ');
        if ~isnumeric(nuevo)
            error('Debe ingresar un valor numérico.');
        end
        if nuevo == 0
            error('No se puede dividir entre cero.');
        end
        resultado = resultado / nuevo;
        continuar = input('¿Desea dividir nuevamente el resultado? (s/n): ', 's');
    end
end
