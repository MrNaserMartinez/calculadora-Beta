function[raiz, iteraciones, convergencia, historia] = newton_raphson(f, df, x0, tol, max_iter)

    % Inicializar variables
    x_actual = x0;
    convergencia = 0;
    historia = zeros(max_iter +1, 3); %[x_i, f(x_i), error]
    historia(1, 1:2) = [x_actual, f(x_actual)];

    % Iterar hasta encontrar la raíz o alcanzar el máximo de iteraciones
    for i = 1:max_iter
        % Calcular el valor de la función y su derivada en el punto actual
        f_valor = f(x_actual);
        df_valor = df(x_actual);

        % Verificar si la derivada es muy cercana a cero (para evitar
        % división por cero)
        if abs(df_valor) <eps 
            warning('La derivada es cercana a cero. El método puede no converger. ');
            break;
        end

        % Calcular la nueva aproximación según la fórmula de Newton-Raphson
        x_nuevo = x_actual - f_valor / df_valor;

        % Calcular el error relativo
        if abs(x_nuevo) < eps
            error_rel = abs((x_nuevo - x_actual) / x_nuevo);
        else 
            error_rel = abs(x_nuevo - x_actual);
        end

        % Guardar el valor actual
        historia(i+1, 1:3) = [x_nuevo, f(x_nuevo), error_rel];

        % Actualizar el valor actual
        x_actual = x_nuevo;

        % Verificar criterio de convergencia
        if error_rel < tol || abs(f_valor) < tol
            convergencia = 1;
            break;
        end
    end

    % Ajustar el tamaño del historial al número real de iteraciones
    iteraciones = 1;
    hisotria = historia(1:iteraciones+1, :);

    % La raíz es la última aproximación calculada 
    raiz = x_actual
end
