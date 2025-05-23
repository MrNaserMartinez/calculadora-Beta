% filepath: c:\Users\mario\Desktop\Calculadora\integrales\calcular_integral_definida.m
function resultado = calcular_integral_definida(func, a, b, metodo)
% CALCULAR_INTEGRAL_DEFINIDA - Calcula la integral definida de una función en un intervalo
%
% Sintaxis:
%   resultado = calcular_integral_definida(func, a, b, metodo)
%
% Entradas:
%   func   - Handle de función a integrar
%   a      - Límite inferior del intervalo
%   b      - Límite inferior del intervalo
%   metodo - (Opcional) Método de integración a utilizar:
%            'trapecio', 'simpson', 'rectangulos', 'quad' (por defecto)
%
% Salidas:
%   resultado - Valor de la integral definida

    % Verificar argumentos de entrada
    if nargin < 3
        error('Se requieren al menos la función, límite inferior y límite superior.');
    end
    
    if nargin < 4
        metodo = 'quad'; % Método por defecto
    end
    
    % Verificar que los límites son números
    if ~isnumeric(a) || ~isnumeric(b)
        error('Los límites de integración deben ser valores numéricos.');
    end
    
    % Calcular la integral según el método seleccionado
    switch lower(metodo)
        case 'trapecio'
            resultado = metodo_trapecio(func, a, b, 1000); % 1000 subdivisiones
        case 'simpson'
            resultado = metodo_simpson(func, a, b, 1000); % 1000 subdivisiones
        case 'rectangulos'
            resultado = metodo_rectangulos(func, a, b, 1000); % 1000 subdivisiones
        case 'quad'
            % Utilizar función quad incorporada en MATLAB
            warning('off', 'MATLAB:quad:MinStepSize'); % Desactivar advertencia de tamaño mínimo de paso
            resultado = quad(func, a, b);
            warning('on', 'MATLAB:quad:MinStepSize'); % Reactivar advertencia
        otherwise
            error('Método de integración "%s" no reconocido.', metodo);
    end
end