% filepath: c:\Users\mario\Desktop\Calculadora\limites\evaluar_limite.m
function [valor_limite, existe, es_infinito, precision] = evaluar_limite(func, punto, tipo_limite)
% EVALUAR_LIMITE - Calcula el límite numérico de una función en un punto
%
% Inputs:
%   func       - Handle de la función a evaluar
%   punto      - Punto donde se calcula el límite
%   tipo_limite - Tipo de límite: 'bilateral', 'izquierda' o 'derecha'
%
% Outputs:
%   valor_limite - Valor aproximado del límite
%   existe       - Indica si el límite existe (true) o no (false)
%   es_infinito  - Indica si el límite es infinito (true) o finito (false)
%   precision    - Estimación de la precisión del cálculo

    % Constantes para el cálculo
    MAX_ITER = 20;          % Máximo número de iteraciones
    FACTOR_H = 10;          % Factor de reducción de h
    UMBRAL_INF = 1e10;      % Valor para detectar infinitos
    TOL_CONVERGENCIA = 1e-6; % Tolerancia para convergencia

    % Inicialización
    h = 0.1;                % Paso inicial
    valores = zeros(MAX_ITER, 1);
    diferencias = zeros(MAX_ITER-1, 1);
    converge = false;
    es_infinito = false;

    % Bucle principal de aproximación
    for i = 1:MAX_ITER
        % Evaluar función según el tipo de límite
        try
            switch tipo_limite
                case 'bilateral'
                    % Promedio de límites por izquierda y derecha
                    val_izq = evaluar_punto_seguro(func, punto - h);
                    val_der = evaluar_punto_seguro(func, punto + h);
                    valores(i) = (val_izq + val_der) / 2;
                case 'izquierda'
                    valores(i) = evaluar_punto_seguro(func, punto - h);
                case 'derecha'
                    valores(i) = evaluar_punto_seguro(func, punto + h);
            end
        catch
            % Si ocurre un error, intentar con un h más pequeño
            h = h / FACTOR_H;
            continue;
        end
        
        % Verificar si estamos cerca de un infinito
        if abs(valores(i)) > UMBRAL_INF
            es_infinito = true;
            break;
        end
        
        % Verificar convergencia a partir de la segunda iteración
        if i > 1
            diferencias(i-1) = abs(valores(i) - valores(i-1));
            if diferencias(i-1) < TOL_CONVERGENCIA
                converge = true;
                break;
            end
        end
        
        % Reducir el paso para la siguiente iteración
        h = h / FACTOR_H;
    end
    
    % Verificar límites laterales si es bilateral
    existe = converge;
    if tipo_limite == 'bilateral' && ~es_infinito && existe
        % Calcular límites laterales para comparar
        [lim_izq, existe_izq, inf_izq, ~] = evaluar_limite(func, punto, 'izquierda');
        [lim_der, existe_der, inf_der, ~] = evaluar_limite(func, punto, 'derecha');
        
        % El límite bilateral existe solo si ambos límites laterales existen y coinciden
        if ~existe_izq || ~existe_der || inf_izq || inf_der || abs(lim_izq - lim_der) > TOL_CONVERGENCIA
            existe = false;
        end
    end
    
    % Resultado final
    if es_infinito
        % Determinar el signo del infinito
        valor_limite = sign(valores(i));
        precision = Inf;
    else
        % Usar el último valor calculado como aproximación
        valor_limite = valores(i);
        % Estimar la precisión como la última diferencia
        if i > 1
            precision = diferencias(i-1);
        else
            precision = NaN;
        end
    end
end

function valor = evaluar_punto_seguro(func, x)
% Evalúa la función capturando posibles errores
    try
        valor = func(x);
        
        % Verificar si el resultado es válido
        if ~isfinite(valor) || isnan(valor)
            error('Valor no finito');
        end
    catch
        % Propagar el error
        error('Error al evaluar la función en x = %f', x);
    end
end