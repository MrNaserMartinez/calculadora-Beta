% filepath: c:\Users\mario\Desktop\Calculadora\integrales\metodo_simpson.m
function resultado = metodo_simpson(func, a, b, n)
% METODO_SIMPSON - Calcula la integral definida usando la regla de Simpson
%
% Sintaxis:
%   resultado = metodo_simpson(func, a, b, n)
%
% Entradas:
%   func - Handle de función a integrar
%   a    - Límite inferior
%   b    - Límite superior
%   n    - Número de subdivisiones (debe ser par)
%
% Salidas:
%   resultado - Aproximación de la integral

    % Asegurarse de que n es par
    if mod(n, 2) ~= 0
        n = n + 1;
    end
    
    % Calcular el ancho de cada subdivisión
    h = (b - a) / n;
    
    % Inicializar resultado con los extremos
    resultado = func(a) + func(b);
    
    % Sumar las evaluaciones de la función en los puntos intermedios
    for i = 1:(n-1)
        x = a + i*h;
        if mod(i, 2) == 0
            resultado = resultado + 2 * func(x);  % Puntos pares
        else
            resultado = resultado + 4 * func(x);  % Puntos impares
        end
    end
    
    % Multiplicar por el factor correspondiente para obtener el resultado final
    resultado = (h/3) * resultado;
end