% filepath: c:\Users\mario\Desktop\Calculadora\volumenes\calcular_vol_cono.m
function volumen = calcular_vol_cono(radio, altura)
% CALCULAR_VOL_CONO - Calcula el volumen de un cono
%
% Sintaxis:
%   volumen = calcular_vol_cono(radio, altura)
%
% Entradas:
%   radio  - Radio de la base del cono
%   altura - Altura del cono
%
% Salidas:
%   volumen - Volumen del cono

    % Validar entradas
    if ~isnumeric(radio) || ~isnumeric(altura) || radio <= 0 || altura <= 0
        error('El radio y la altura deben ser números positivos.');
    end
    
    % Calcular volumen
    volumen = (1/3) * pi * radio^2 * altura;
end