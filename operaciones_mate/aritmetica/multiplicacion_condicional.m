function resultado = multiplicacion_condicional(usar_anterior, anterior)
% MULTIPLICACION_CONDICIONAL - Realiza una multiplicacion usando opcionalmente el resultado anterior

    if usar_anterior
        a = anterior;
        b = input('Ingrese el siguiente número: ');
    else
        a = input('Ingrese el primer número: ');
        b = input('Ingrese el segundo número: ');
    end

    % Validar que ambos sean numéricos
    if ~isnumeric(a) || ~isnumeric(b)
        error('Ambos valores deben ser numéricos.');
    end
  
    resultado = a * b;
end
