% filepath: c:\Users\mario\Desktop\Calculadora\volumenes\calcular_vol_prisma_triangular.m
function volumen = calcular_vol_prisma_triangular(base_triangulo, altura_triangulo, longitud_prisma)
% CALCULAR_VOL_PRISMA_TRIANGULAR - Calcula el volumen de un prisma triangular
%
% Sintaxis:
%   volumen = calcular_vol_prisma_triangular(base_triangulo, altura_triangulo, longitud_prisma)
%
% Entradas:
%   base_triangulo    - Base del triángulo de la base
%   altura_triangulo  - Altura del triángulo de la base
%   longitud_prisma   - Longitud del prisma
%
% Salidas:
%   volumen - Volumen del prisma triangular

    % Validar entradas
    if ~isnumeric(base_triangulo) || ~isnumeric(altura_triangulo) || ~isnumeric(longitud_prisma) || ...
       base_triangulo <= 0 || altura_triangulo <= 0 || longitud_prisma <= 0
        error('Todas las dimensiones deben ser números positivos.');
    end
    
    % Calcular área de la base triangular
    area_base = (1/2) * base_triangulo * altura_triangulo;
    
    % Calcular volumen
    volumen = area_base * longitud_prisma;
end