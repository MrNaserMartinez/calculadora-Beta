function secante_modi()
% METODO_SECANTE_MODIFICADA Implementa el método de la secante modificada
%   Este método se utiliza para encontrar raíces (ceros) de ecuaciones
%   de la forma f(x) = 0, sin necesidad de calcular derivadas.

    clc;
    disp("=== MÉTODO DE LA SECANTE MODIFICADA ===");
    disp("Este método encuentra raíces de ecuaciones de la forma f(x) = 0.");
    

    disp("\nPara comenzar, debe definir la función f(x) cuya raíz desea encontrar.");
    disp("Ejemplos: 'x^2 - 4', 'sin(x)', 'exp(x) - 2*x'");
    
    funcion_str = input("Ingrese la función f(x): ", 's');
    
    % Crear función anónima a partir de la entrada del usuario
    try
        f = str2func(['@(x) ' funcion_str]);
        f(1);
    catch
        error("Error: La función ingresada no es válida. Verifique la sintaxis.");
    end
    

    x0 = input("Ingrese el punto inicial (x₀): ");
    delta = input("Ingrese el factor de perturbación (δ, recomendado 0.01): ");
    if isempty(delta)
        delta = 0.01;  
    end
    
    tol = input("Ingrese la tolerancia (ε, recomendado 1e-6): ");
    if isempty(tol)
        tol = 1e-6;  
    end
    
    max_iter = input("Ingrese el número máximo de iteraciones (recomendado 100): ");
    if isempty(max_iter)
        max_iter = 100;  
    end
    
    % Inicializar variables para el seguimiento
    iteraciones = zeros(max_iter, 4);  
    
    % Implementación del método
    x = x0;
    fx = f(x);
    iter = 0;
    error_actual = Inf;
    
    fprintf("\nIteración |    x    |    f(x)   |   Error   | Tasa Convergencia\n");
    fprintf("---------------------------------------------------------------\n");
    
    while abs(fx) > tol && iter < max_iter && error_actual > tol
        x_anterior = x;
        
        % Calcular f(x + δ*x)
        x_perturbado = x + delta * x;
        fx_perturbado = f(x_perturbado);
        
        % Calcular la aproximación de la derivada
        derivada_aprox = (fx_perturbado - fx) / (delta * x);
        
        if abs(derivada_aprox) < eps
            disp("Advertencia: Derivada aproximada cercana a cero. El método puede diverger.");
            derivada_aprox = sign(derivada_aprox) * eps;
        end
        
        % Aplicar la fórmula del método de la secante modificada
        x = x - fx / derivada_aprox;
        
        fx = f(x);
        
        error_actual = abs(x - x_anterior);
        
        % Calcular tasa de convergencia (solo después de la primera iteración)
        if iter > 0
            cociente = log(error_actual) / log(iteraciones(iter, 3));
        else
            cociente = NaN;
        end
        
        iter = iter + 1;
        
        iteraciones(iter, :) = [x, fx, error_actual, cociente];
        
        if isnan(cociente)
            fprintf("%9d | %7.6f | %9.6f | %9.6f | ---\n", iter, x, fx, error_actual);
        else
            fprintf("%9d | %7.6f | %9.6f | %9.6f | %9.6f\n", iter, x, fx, error_actual, cociente);
        end
        
        if abs(fx) < tol || error_actual < tol
            break;
        end
    end
    
    iteraciones = iteraciones(1:iter, :);
    
    % Mostrar resultado final
    fprintf("\nRESULTADOS:\n");
    
    if iter < max_iter && (abs(fx) < tol || error_actual < tol)
        fprintf("El método ha convergido después de %d iteraciones.\n", iter);
        fprintf("Raíz encontrada: x = %.10f\n", x);
        fprintf("Valor de f(x): %.10e\n", fx);
        fprintf("Error estimado: %.10e\n", error_actual);
        
        if iter > 2
            errores = iteraciones(max(1, iter-3):iter, 3);
            if all(errores > 0)
                orden = polyfit(log(errores(1:end-1)), log(errores(2:end)), 1);
                fprintf("Orden de convergencia estimado: %.2f\n", orden(1));
                
                if abs(orden(1) - 1) < 0.2
                    disp("La convergencia es aproximadamente lineal.");
                elseif abs(orden(1) - 2) < 0.2
                    disp("La convergencia es aproximadamente cuadrática.");
                else
                    fprintf("La convergencia es de orden aproximadamente %.1f.\n", orden(1));
                end
            end
        end
    else
        fprintf("El método no ha convergido después de %d iteraciones.\n", max_iter);
        fprintf("Aproximación actual: x = %.10f\n", x);
        fprintf("Valor de f(x): %.10e\n", fx);
        fprintf("Error estimado: %.10e\n", error_actual);
    end
    
    % Preguntar si desea probar otro punto inicial o función
    disp("\n¿Desea probar con otra función o punto inicial?");
    repetir = input("1=Sí, 0=No: ");
    
    if repetir == 1
        metodo_secante_modificada();
    end
end