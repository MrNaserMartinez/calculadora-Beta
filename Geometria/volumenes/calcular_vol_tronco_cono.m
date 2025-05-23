% filepath: c:\Users\mario\Desktop\Calculadora\volumenes\calcular_vol_tronco_cono.m
function volumen = calcular_vol_tronco_cono(radio1, radio2, altura)
% CALCULAR_VOL_TRONCO_CONO - Calcula el volumen de un tronco de cono
%
% Sintaxis:
%   volumen = calcular_vol_tronco_cono(radio1, radio2, altura)
%
% Entradas:
%   radio1 - Radio de la base mayor
%   radio2 - Radio de la base menor
%   altura - Altura del tronco de cono
%
% Salidas:
%   volumen - Volumen del tronco de cono

    % Validar entradas
    if ~isnumeric(radio1) || ~isnumeric(radio2) || ~isnumeric(altura) || ...
       radio1 <= 0 || radio2 <= 0 || altura <= 0 || radio2 >= radio1
        error('Los radios y la altura deben ser números positivos, y el radio de la base menor debe ser menor que el de la base mayor.');
    end
    
    % Calcular volumen
    volumen = (1/3) * pi * altura * (radio1^2 + radio1*radio2 + radio2^2);
end