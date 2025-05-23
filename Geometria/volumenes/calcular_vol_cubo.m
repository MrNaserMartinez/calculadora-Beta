% filepath: c:\Users\mario\Desktop\Calculadora\volumenes\calcular_vol_cubo.m
function volumen = calcular_vol_cubo(lado)
% CALCULAR_VOL_CUBO - Calcula el volumen de un cubo
%
% Sintaxis:
%   volumen = calcular_vol_cubo(lado)
%
% Entradas:
%   lado - Longitud del lado del cubo
%
% Salidas:
%   volumen - Volumen del cubo

    % Validar entrada
    if ~isnumeric(lado) || lado <= 0
        error('La longitud del lado debe ser un número positivo.');
    end
    
    % Calcular volumen
    volumen = lado^3;
end