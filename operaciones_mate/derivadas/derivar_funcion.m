function [deriv_adelante, deriv_centrada, deriv_extrapolada] = derivar_funcion(func, x, h)
% DERIVAR_FUNCION - Calcula la derivada numérica de una función

    % Manejo de argumentos opcionales
    if nargin < 3, h = 0.0001; end  % h sirve para tener mas presicion para no tener errores de redondeo

    try
        % Calcular valores de la función en puntos necesarios

        f_x = func(x);
        f_xh = func(x + h);
        f_x_h = func(x - h);
        f_x2h = func(x + 2*h);
        f_x_2h = func(x - 2*h);
        
        % Diferencia adelante: O(h)
        deriv_adelante = (f_xh - f_x) / h;
        
        % Diferencia centrada: O(h^2)
        deriv_centrada = (f_xh - f_x_h) / (2*h);
        
        % Fórmula de cinco puntos (extrapolada): O(h^4)
        deriv_extrapolada = (f_x_2h - 8*f_x_h + 8*f_xh - f_x2h) / (12*h);
        
    catch e
        % Manejar errores durante la evaluación
        warning('Error al evaluar la función: %s', e.message);
        deriv_adelante = NaN;
        deriv_centrada = NaN; %Sirve para hay operaciones indefinidas
        deriv_extrapolada = NaN;
    end
end