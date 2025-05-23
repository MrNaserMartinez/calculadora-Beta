% filepath: c:\Users\mario\Desktop\Calculadora\volumenes\calcular_vol_cilindro.m
function volumen = calcular_vol_cilindro(radio, altura)
% CALCULAR_VOL_CILINDRO - Calcula el volumen de un cilindro
%
% Sintaxis:
%   volumen = calcular_vol_cilindro(radio, altura)
%
% Entradas:
%   radio  - Radio de la base del cilindro
%   altura - Altura del cilindro
%
% Salidas:
%   volumen - Volumen del cilindro

    % Validar entradas
    if ~isnumeric(radio) || ~isnumeric(altura) || radio <= 0 || altura <= 0
        error('El radio y la altura deben ser números positivos.');
    end
    
    % Calcular volumen
    volumen = pi * radio^2 * altura;
end