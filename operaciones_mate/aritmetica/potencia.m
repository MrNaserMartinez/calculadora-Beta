function resultado = potencia()
% POTENCIA - Realiza la potenciación de dos o más números según lo indique el usuario.
%
% Comienza con una base y un exponente, y permite seguir elevando el resultado a otro exponente.

    % Solicitar la base y el primer exponente
    base = input('Ingrese la base: ');
    exponente = input('Ingrese el exponente: ');

    % Validación
    if ~isnumeric(base) || ~isnumeric(exponente)
        error('Ambos valores deben ser numéricos.');
    end

    % Calcular la potencia inicial
    resultado = base ^ exponente;

    % Preguntar si desea seguir elevando
    continuar = input('¿Desea elevar el resultado a otro exponente? (s/n): ', 's');

    while lower(continuar) == 's'
        nuevo_exp = input('Ingrese el siguiente exponente: ');
        if ~isnumeric(nuevo_exp)
            error('Debe ingresar un valor numérico.');
        end
        resultado = resultado ^ nuevo_exp;
        continuar = input('¿Desea elevar nuevamente el resultado? (s/n): ', 's');
    end
end
