% filepath: c:\Users\mario\Desktop\Calculadora\volumenes\calcular_vol_esfera.m
function volumen = calcular_vol_esfera(radio)
% CALCULAR_VOL_ESFERA - Calcula el volumen de una esfera
%
% Sintaxis:
%   volumen = calcular_vol_esfera(radio)
%
% Entradas:
%   radio - Radio de la esfera
%
% Salidas:
%   volumen - Volumen de la esfera

    % Validar entrada
    if ~isnumeric(radio) || radio <= 0
        error('El radio debe ser un número positivo.');
    end
    
    % Calcular volumen
    volumen = (4/3) * pi * radio^3;
end