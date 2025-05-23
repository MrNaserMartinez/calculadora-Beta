% filepath: c:\Users\mario\Desktop\Calculadora\integrales\metodo_trapecio.m
function resultado = metodo_trapecio(func, a, b, n)
% METODO_TRAPECIO - Calcula la integral definida usando el método del trapecio
%
% Sintaxis:
%   resultado = metodo_trapecio(func, a, b, n)
%
% Entradas:
%   func - Handle de función a integrar
%   a    - Límite inferior
%   b    - Límite superior
%   n    - Número de subdivisiones
%
% Salidas:
%   resultado - Aproximación de la integral

    % Calcular el ancho de cada subdivisión
    h = (b - a) / n;
    
    % Inicializar resultado con los extremos
    resultado = (func(a) + func(b)) / 2;
    
    % Sumar las evaluaciones de la función en los puntos intermedios
    for i = 1:(n-1)
        x = a + i*h;
        resultado = resultado + func(x);
    end
    
    % Multiplicar por el ancho para obtener el resultado final
    resultado = h * resultado;
end