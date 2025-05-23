% filepath: c:\Users\mario\Desktop\Calculadora\limites\limite_predefinido.m
function limite_predefinido()
% LIMITE_PREDEFINIDO - Cálculo de límites para funciones predefinidas
    
    % Mostrar funciones predefinidas disponibles
    [funciones, nombres, puntos_sugeridos, limites_exactos] = predefinidas_limites();
    
    disp('Funciones predefinidas disponibles:');
    for i = 1:length(nombres)
        disp([num2str(i), '. ', nombres{i}]);
    end
    
    % Solicitar selección al usuario
    opcion = input('Seleccione una función: ');
    
    if opcion >= 1 && opcion <= length(funciones)
        func = funciones{opcion};
        nombre_func = nombres{opcion};
        punto_sugerido = puntos_sugeridos{opcion};
        limite_exacto = limites_exactos{opcion};
        
        disp(['Función seleccionada: ', nombre_func]);
        disp(['Punto de interés sugerido: x = ', num2str(punto_sugerido)]);
        
        % Preguntar si desea usar el punto sugerido
        usar_sugerido = input('¿Desea calcular el límite en el punto sugerido? (s/n): ', 's');
        
        if lower(usar_sugerido) == 's'
            punto = punto_sugerido;
        else
            punto = input('Ingrese el punto donde desea calcular el límite: ');
        end
        
        % Opciones para límites laterales
        disp('Seleccione el tipo de límite:');
        disp('1. Límite bilateral (x → a)');
        disp('2. Límite por la izquierda (x → a⁻)');
        disp('3. Límite por la derecha (x → a⁺)');
        
        tipo_limite = input('Opción: ');
        
        switch tipo_limite
            case 1
                tipo = 'bilateral';
            case 2
                tipo = 'izquierda';
            case 3
                tipo = 'derecha';
            otherwise
                disp('Opción no válida.');
                input('Presione Enter para continuar...');
                limite_predefinido();
                return;
        end
        
        % Calcular y mostrar límite
        mostrar_resultados_predefinido(func, nombre_func, punto, tipo, limite_exacto);
    else
        disp('Selección no válida. Inténtelo de nuevo.');
        input('Presione Enter para continuar...');
        calcular_limite();
    end
end

function mostrar_resultados_predefinido(func, nombre_func, punto, tipo_limite, limite_exacto)
    % Calcular limite usando diferentes métodos
    [valor_limite, existe, es_infinito, precision] = evaluar_limite(func, punto, tipo_limite);
    
    % Mostrar resultados
    disp(' ');
    disp('Resultados:');
    disp('---------------------------------------------------');
    disp(['Función: ' nombre_func]);
    
    % Mostrar tipo de límite
    switch tipo_limite
        case 'bilateral'
            disp(['Límite cuando x → ' num2str(punto)]);
        case 'izquierda'
            disp(['Límite cuando x → ' num2str(punto) '⁻ (por la izquierda)']);
        case 'derecha'
            disp(['Límite cuando x → ' num2str(punto) '⁺ (por la derecha)']);
    end
    
    % Mostrar valor del límite calculado
    if ~existe
        disp('El límite calculado no existe.');
    elseif es_infinito
        if valor_limite > 0
            disp('Límite calculado = +∞');
        else
            disp('Límite calculado = -∞');
        end
    else
        disp(['Límite calculado = ' num2str(valor_limite)]);
        disp(['Precisión estimada: ' num2str(precision)]);
    end
    
    % Mostrar valor exacto si está disponible
    if ~isnan(limite_exacto)
        if isinf(limite_exacto)
            if limite_exacto > 0
                disp('Valor exacto del límite = +∞');
            else
                disp('Valor exacto del límite = -∞');
            end
        else
            disp(['Valor exacto del límite = ' num2str(limite_exacto)]);
            
            % Calcular error si ambos son finitos
            if existe && ~es_infinito && ~isinf(limite_exacto)
                error_abs = abs(valor_limite - limite_exacto);
                disp(['Error absoluto: ' num2str(error_abs)]);
            end
        end
    else
        disp('El límite exacto no existe (hay discontinuidad o indeterminación no resoluble).');
    end
    
    % Evaluar la función en el punto (si es posible)
    try
        valor_puntual = func(punto);
        disp(['Valor de la función en el punto: f(' num2str(punto) ') = ' num2str(valor_puntual)]);
        
        % Determinar si la función es continua en el punto
        if existe && ~es_infinito && ~isnan(limite_exacto) && abs(valor_limite - valor_puntual) < 1e-10
            disp('La función es continua en el punto.');
        else
            disp('La función presenta una discontinuidad en el punto.');
        end
    catch
        disp(['La función no está definida en x = ' num2str(punto)]);
    end
    
    disp('---------------------------------------------------');
    
    % Opciones adicionales
    disp(' ');
    disp('Opciones adicionales:');
    disp('1. Graficar la función alrededor del punto');
    disp('2. Calcular otro límite para la misma función');
    disp('3. Seleccionar otra función predefinida');
    disp('4. Volver al menú de límites');
    disp('5. Volver al menú principal');
    
    opcion = input('Opción: ');
    
    switch opcion
        case 1
            graficar_limite(func, punto, tipo_limite, valor_limite, existe, es_infinito);
            input('Presione Enter para continuar...');
            calcular_limite();
        case 2
            % Punto y tipo de límite
            nuevo_punto = input('Ingrese el punto donde desea calcular el límite: ');
            
            disp('Seleccione el tipo de límite:');
            disp('1. Límite bilateral (x → a)');
            disp('2. Límite por la izquierda (x → a⁻)');
            disp('3. Límite por la derecha (x → a⁺)');
            
            nuevo_tipo = input('Opción: ');
            
            switch nuevo_tipo
                case 1
                    mostrar_resultados_predefinido(func, nombre_func, nuevo_punto, 'bilateral', NaN);
                case 2
                    mostrar_resultados_predefinido(func, nombre_func, nuevo_punto, 'izquierda', NaN);
                case 3
                    mostrar_resultados_predefinido(func, nombre_func, nuevo_punto, 'derecha', NaN);
                otherwise
                    disp('Opción no válida.');
                    input('Presione Enter para continuar...');
                    calcular_limite();
            end
        case 3
            limite_predefinido();
        case 4
            calcular_limite();
        case 5
            % Volver al menú principal
            return;
        otherwise
            disp('Opción no válida.');
            input('Presione Enter para continuar...');
            calcular_limite();
    end
end