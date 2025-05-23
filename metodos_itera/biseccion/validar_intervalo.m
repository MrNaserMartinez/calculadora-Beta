function es_valido = validar_intervalo(func, a, b)

% VALIDAR_INTERVALO - Valida si el intervalo [a,b] es adecuado para el método de bisección

%   es_valido - Booleano que indica si el intervalo es válido para bisección
    es_valido = false;
    
    
%   a    - Límite inferior del intervalo
%   b    - Límite superior del intervalo

    % Verificar que a < b
    if a >= b
        disp('Error: Debe cumplirse que a < b.');
        return;
    end

    
    % Verificar que los valores son números finitos
    if ~isfinite(a) || ~isfinite(b)
        disp('Error: Los límites del intervalo deben ser números finitos.');
        return;
    end

    
    try
        % Evaluar la función en ambos extremos
        fa = func(a);
        fb = func(b);
        
        % Verificar que los resultados son números finitos
        if ~isfinite(fa) || ~isfinite(fb)
            disp('Error: La función produce valores no finitos en los límites del intervalo.');
            return;
        end
        
        % Verificar cambio de signo (condición necesaria para bisección)
        % Para que el metodo de biseccion se aplique correctamente, la
        % operacion entre f(a) y f(b) deben de ser menor a 0 
        if fa * fb >= 0
        disp(['Error: La función no cambia de signo en el intervalo [', num2str(a), ', ', num2str(b), '].']); %num2str(a) y num2str(b) convierten las funciones de string a int
        disp('Para el método de bisección se requiere que f(a)*f(b) < 0.');
                

            
            % Información adicional para el usuario
            %Proporciona informacion adicional al usuario sobre porque nose
            %aplico la biseccion
            if fa == 0
                disp(['Nota: f(', num2str(a), ') = 0, por lo que ', num2str(a), ' ya es una raíz.']);
            elseif fb == 0
                disp(['Nota: f(', num2str(b), ') = 0, por lo que ', num2str(b), ' ya es una raíz.']);
            elseif fa > 0 && fb > 0
                disp('La función es positiva en ambos extremos del intervalo.');
            elseif fa < 0 && fb < 0
                disp('La función es negativa en ambos extremos del intervalo.');
            end
            
            return;
        end


        
        % Si llegamos aquí, el intervalo es válido
        es_valido = true;
        disp(['Intervalo [', num2str(a), ', ', num2str(b), '] validado correctamente.']);
        disp(['f(', num2str(a), ') = ', num2str(fa)]);
        disp(['f(', num2str(b), ') = ', num2str(fb)]);
        
    catch e
        % Capturar errores al evaluar la función
        disp(['Error al evaluar la función: ', e.message]);
    end
end