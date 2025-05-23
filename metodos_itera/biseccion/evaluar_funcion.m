% filepath: c:\Users\mario\Desktop\Calculadora\biseccion\evaluar_funcion.m
function [y, valido] = evaluar_funcion(func, x)
% EVALUAR_FUNCION - Evalúa una función en un punto determinado
% de forma segura, capturando posibles errores
%
% Inputs:
%   func  - Handle de la función a evaluar
%   x     - Valor(es) donde evaluar la función, puede ser un escalar o vector
%
% Outputs:
%   y      - Resultado de evaluar func(x)
%   valido - Indica si la evaluación fue exitosa (true) o falló (false)

    valido = true;
    
    try
        % Intentar evaluar la función
        y = func(x);
        
        % Verificar si el resultado es un número válido (no NaN, no Inf)
        if any(~isfinite(y)) && ~isempty(y)
            if numel(y) == 1
                warning('La función produjo un valor no finito: %s', mat2str(y));
            else
                warning('La función produjo valores no finitos en algunos puntos.');
            end
            valido = false;
        end
    catch e
        % Capturar errores durante la evaluación
        y = NaN;
        valido = false;
        warning('Error al evaluar la función: %s', e.message);
    end
    
    % Para funciones complejas, tomar solo la parte real si se espera un valor real
    if isreal(x) && ~isreal(y) && valido
        warning('La función produjo un valor complejo. Se utilizará solo la parte real.');
        y = real(y);
    end
end