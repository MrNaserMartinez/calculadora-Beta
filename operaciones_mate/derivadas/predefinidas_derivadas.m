% filepath: c:\Users\mario\Desktop\Calculadora\derivadas\predefinidas_derivadas.m
function [funciones, nombres, derivadas_exactas] = predefinidas_derivadas()
% PREDEFINIDAS_DERIVADAS - Proporciona un conjunto de funciones predefinidas
% junto con sus derivadas exactas para ejemplificar y comparar
%
% Outputs:
%   funciones        - Cell array con handles a funciones predefinidas
%   nombres          - Cell array con los nombres descriptivos de las funciones
%   derivadas_exactas - Cell array con handles a las derivadas exactas

    % Inicializar cell arrays para almacenar las funciones y sus derivadas
    funciones = cell(6, 1);
    nombres = cell(6, 1);
    derivadas_exactas = cell(6, 1);
    
    % Función 1: f(x) = x^2
    funciones{1} = @(x) x.^2;
    nombres{1} = 'f(x) = x^2';
    derivadas_exactas{1} = @(x) 2*x;
    
    % Función 2: f(x) = sin(x)
    funciones{2} = @(x) sin(x);
    nombres{2} = 'f(x) = sin(x)';
    derivadas_exactas{2} = @(x) cos(x);
    
    % Función 3: f(x) = e^x
    funciones{3} = @(x) exp(x);
    nombres{3} = 'f(x) = e^x';
    derivadas_exactas{3} = @(x) exp(x);
    
    % Función 4: f(x) = ln(x)
    funciones{4} = @(x) log(x);
    nombres{4} = 'f(x) = ln(x)';
    derivadas_exactas{4} = @(x) 1./x;
    
    % Función 5: f(x) = x^3 - 3x^2 + 2x - 1
    funciones{5} = @(x) x.^3 - 3*x.^2 + 2*x - 1;
    nombres{5} = 'f(x) = x^3 - 3x^2 + 2x - 1';
    derivadas_exactas{5} = @(x) 3*x.^2 - 6*x + 2;
    
    % Función 6: f(x) = 1/x
    funciones{6} = @(x) 1./x;
    nombres{6} = 'f(x) = 1/x';
    derivadas_exactas{6} = @(x) -1./(x.^2);
end