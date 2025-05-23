% filepath: c:\Users\mario\Desktop\Calculadora\limites\predefinidas_limites.m
function [funciones, nombres, puntos_sugeridos, limites_exactos] = predefinidas_limites()
% PREDEFINIDAS_LIMITES - Proporciona un conjunto de funciones predefinidas
% con sus límites exactos para ejemplificar cálculos
%
% Outputs:
%   funciones        - Cell array con handles a funciones predefinidas
%   nombres          - Cell array con los nombres descriptivos de las funciones
%   puntos_sugeridos - Puntos de interés para calcular límites
%   limites_exactos  - Valores exactos de los límites en esos puntos

    % Inicializar cell arrays 
    funciones = cell(8, 1);
    nombres = cell(8, 1);
    puntos_sugeridos = cell(8, 1);
    limites_exactos = cell(8, 1);
    
    % Función 1: f(x) = (x^2 - 1)/(x - 1)
    funciones{1} = @(x) (x.^2 - 1)./(x - 1);
    nombres{1} = 'f(x) = (x^2 - 1)/(x - 1)';
    puntos_sugeridos{1} = 1;
    limites_exactos{1} = 2; % Límite = 2 cuando x→1
    
    % Función 2: f(x) = sin(x)/x
    funciones{2} = @(x) sin(x)./x;
    nombres{2} = 'f(x) = sin(x)/x';
    puntos_sugeridos{2} = 0;
    limites_exactos{2} = 1; % Límite = 1 cuando x→0
    
    % Función 3: f(x) = (1 - cos(x))/x^2
    funciones{3} = @(x) (1 - cos(x))./(x.^2);
    nombres{3} = 'f(x) = (1 - cos(x))/x^2';
    puntos_sugeridos{3} = 0;
    limites_exactos{3} = 0.5; % Límite = 1/2 cuando x→0
    
    % Función 4: f(x) = (e^x - 1)/x
    funciones{4} = @(x) (exp(x) - 1)./x;
    nombres{4} = 'f(x) = (e^x - 1)/x';
    puntos_sugeridos{4} = 0;
    limites_exactos{4} = 1; % Límite = 1 cuando x→0
    
    % Función 5: f(x) = x*sin(1/x)
    funciones{5} = @(x) x.*sin(1./x);
    nombres{5} = 'f(x) = x*sin(1/x)';
    puntos_sugeridos{5} = 0;
    limites_exactos{5} = 0; % Límite = 0 cuando x→0
    
    % Función 6: f(x) = (sqrt(x + 1) - 1)/x
    funciones{6} = @(x) (sqrt(x + 1) - 1)./x;
    nombres{6} = 'f(x) = (sqrt(x + 1) - 1)/x';
    puntos_sugeridos{6} = 0;
    limites_exactos{6} = 0.5; % Límite = 1/2 cuando x→0
    
    % Función 7: f(x) = (1/x)
    funciones{7} = @(x) 1./x;
    nombres{7} = 'f(x) = 1/x';
    puntos_sugeridos{7} = 0;
    limites_exactos{7} = Inf; % Límite no existe (infinito) cuando x→0
    
    % Función 8: f(x) = abs(x)/x (función signo)
    funciones{8} = @(x) abs(x)./x;
    nombres{8} = 'f(x) = abs(x)/x (función signo)';
    puntos_sugeridos{8} = 0;
    limites_exactos{8} = NaN; % Límite no existe (salto) cuando x→0
end