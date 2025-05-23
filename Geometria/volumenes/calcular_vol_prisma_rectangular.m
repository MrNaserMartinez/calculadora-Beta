% filepath: c:\Users\mario\Desktop\Calculadora\volumenes\calcular_vol_prisma_rectangular.m
function volumen = calcular_vol_prisma_rectangular(largo, ancho, altura)
% CALCULAR_VOL_PRISMA_RECTANGULAR - Calcula el volumen de un prisma rectangular
%
% Sintaxis:
%   volumen = calcular_vol_prisma_rectangular(largo, ancho, altura)
%
% Entradas:
%   largo  - Longitud del prisma
%   ancho  - Ancho del prisma
%   altura - Altura del prisma
%
% Salidas:
%   volumen - Volumen del prisma rectangular

    % Validar entradas
    if ~isnumeric(largo) || ~isnumeric(ancho) || ~isnumeric(altura) || ...
       largo <= 0 || ancho <= 0 || altura <= 0
        error('Todas las dimensiones deben ser números positivos.');
    end
    
    % Calcular volumen
    volumen = largo * ancho * altura;
end