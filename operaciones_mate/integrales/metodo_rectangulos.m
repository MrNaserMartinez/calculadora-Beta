% filepath: c:\Users\mario\Desktop\Calculadora\integrales\metodo_rectangulos.m
function resultado = metodo_rectangulos(func, a, b, n)
% METODO_RECTANGULOS - Calcula la integral definida usando el método de los rectángulos
%
% Sintaxis:
%   resultado = metodo_rectangulos(func, a, b, n)
%
% Entradas:
%   func - Handle de función a integrar
%   a    - Límite inferior
%   b    - Límite superior
%   n    - Número de rectángulos
%
% Salidas:
%   resultado - Aproximación de la integral

    % Calcular el ancho de cada rectángulo
    h = (b - a) / n;
    
    % Inicializar el resultado
    resultado = 0;
    
    % Sumar las áreas de todos los rectángulos
    for i = 0:(n-1)
        x = a + i*h + h/2;  % Punto medio del rectángulo
        resultado = resultado + func(x);
    end
    
    % Multiplicar por el ancho para obtener el resultado final
    resultado = h * resultado;
end