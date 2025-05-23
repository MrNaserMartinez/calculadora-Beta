% filepath: c:\Users\mario\Desktop\Calculadora\volumenes\calcular_vol_piramide.m
function volumen = calcular_vol_piramide(area_base, altura)
% CALCULAR_VOL_PIRAMIDE - Calcula el volumen de una pirámide
%
% Sintaxis:
%   volumen = calcular_vol_piramide(area_base, altura)
%
% Entradas:
%   area_base - Área de la base de la pirámide
%   altura    - Altura de la pirámide
%
% Salidas:
%   volumen - Volumen de la pirámide

    % Validar entradas
    if ~isnumeric(area_base) || ~isnumeric(altura) || area_base <= 0 || altura <= 0
        error('El área de la base y la altura deben ser números positivos.');
    end
    
    % Calcular volumen
    volumen = (1/3) * area_base * altura;
end