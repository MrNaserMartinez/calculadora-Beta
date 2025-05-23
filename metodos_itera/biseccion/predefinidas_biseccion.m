function [funciones, nombres] = predefinidas_biseccion()

% PREDEFINIDAS_BISECCION - Proporciona un conjunto de funciones predefinidas

    % Inicializar cell arrays para almacenar las funciones y sus nombres
    funciones = cell(6, 1);
    nombres = cell(6, 1);
    

    %Funciones Predefinidas para que el ususario no deba de escribirlas 
    
    % Función 1: f(x) = x^3 - 6x^2 + 11x - 6
    funciones{1} = @(x) x.^3 - 6*x.^2 + 11*x - 6;
    nombres{1} = 'x^3 - 6x^2 + 11x - 6  (Raíces: 1, 2, 3)';
    
    % Función 2: f(x) = cos(x) - x
    funciones{2} = @(x) cos(x) - x;
    nombres{2} = 'cos(x) - x  (Tiene raíz cerca de x = 0.7)';
    
    % Función 3: f(x) = e^x - 3x
    funciones{3} = @(x) exp(x) - 3*x;
    nombres{3} = 'e^x - 3x  (Tiene raíz cerca de x = 1.1)';
    
    % Función 4: f(x) = x^2 - 2
    funciones{4} = @(x) x.^2 - 2;
    nombres{4} = 'x^2 - 2  (Raíces: ±√2 ≈ ±1.414)';
    
    % Función 5: f(x) = sin(x) - 0.5
    funciones{5} = @(x) sin(x) - 0.5;
    nombres{5} = 'sin(x) - 0.5  (Raíz: arcsin(0.5) ≈ 0.524)';
    
    % Función 6: f(x) = x^3 - x - 1
    funciones{6} = @(x) x.^3 - x - 1;
    nombres{6} = 'x^3 - x - 1  (Tiene raíz cerca de x = 1.325)';
end