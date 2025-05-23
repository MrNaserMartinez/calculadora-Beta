% filepath: c:\Users\mario\Desktop\Calculadora\limites\limite_personalizado.m
function limite_personalizado()
% LIMITE_PERSONALIZADO - Cálculo de límites para funciones ingresadas por el usuario
    
    % Solicitar función al usuario
    expr = input('Ingrese la función f(x) (use x como variable): ', 's');
    
    try
        % Crear función anónima para la expresión ingresada
        func = str2func(['@(x) ', expr]);
        % Validar que la función sea válida evaluándola en un punto seguro
        func(100); % Punto lejano para evitar problemas en caso de funciones con discontinuidades
    catch
        disp('Error: La función ingresada no es válida.');
        input('Presione Enter para continuar...');
        calcular_limite();
        return;
    end
    
    % Solicitar el punto donde calcular el límite
    punto = input('Ingrese el punto donde desea calcular el límite: ');
    
    % Opciones para límites laterales
    disp('Seleccione el tipo de límite:');
    disp('1. Límite bilateral (x → a)');
    disp('2. Límite por la izquierda (x → a⁻)');
    disp('3. Límite por la derecha (x → a⁺)');
    
    tipo_limite = input('Opción: ');
    
    % Calcular y mostrar resultados
    switch tipo_limite
        case 1
            mostrar_resultados_limite(func, expr, punto, 'bilateral');
        case 2
            mostrar_resultados_limite(func, expr, punto, 'izquierda');
        case 3
            mostrar_resultados_limite(func, expr, punto, 'derecha');
        otherwise
            disp('Opción no válida.');
            input('Presione Enter para continuar...');
            limite_personalizado();
    end
end

function mostrar_resultados_limite(func, expr, punto, tipo_limite)
    % Calcular limite usando diferentes métodos
    [valor_limite, existe, es_infinito, precision] = evaluar_limite(func, punto, tipo_limite);
    
    % Mostrar resultados
    disp(' ');
    disp('Resultados:');
    disp('---------------------------------------------------');
    disp(['Función: f(x) = ' expr]);
    
    % Mostrar tipo de límite
    switch tipo_limite
        case 'bilateral'
            disp(['Límite cuando x → ' num2str(punto)]);
        case 'izquierda'
            disp(['Límite cuando x → ' num2str(punto) '⁻ (por la izquierda)']);
        case 'derecha'
            disp(['Límite cuando x → ' num2str(punto) '⁺ (por la derecha)']);
    end
    
    % Mostrar valor del límite según lo obtenido
    if ~existe
        disp('El límite no existe.');
    elseif es_infinito
        if valor_limite > 0
            disp('Límite = +∞');
        else
            disp('Límite = -∞');
        end
    else
        disp(['Límite = ' num2str(valor_limite)]);
        disp(['Precisión estimada: ' num2str(precision)]);
    end
    
    % Evaluar la función en el punto (si es posible)
    try
        valor_puntual = func(punto);
        disp(['Valor de la función en el punto: f(' num2str(punto) ') = ' num2str(valor_puntual)]);
        
        % Determinar si la función es continua en el punto
        if existe && ~es_infinito && abs(valor_limite - valor_puntual) < 1e-10
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
    disp('3. Calcular límite de otra función');
    disp('4. Volver al menú de límites');
    disp('5. Volver al menú principal');
    
    opcion = input('Opción: ');
    
    switch opcion
        case 1
            graficar_limite(func, punto, tipo_limite, valor_limite, existe, es_infinito);
            input('Presione Enter para continuar...');
            calcular_limite();
        case 2
            % Solicitar nuevo punto
            nuevo_punto = input('Ingrese el nuevo punto donde desea calcular el límite: ');
            
            % Tipo de límite
            disp('Seleccione el tipo de límite:');
            disp('1. Límite bilateral (x → a)');
            disp('2. Límite por la izquierda (x → a⁻)');
            disp('3. Límite por la derecha (x → a⁺)');
            
            nuevo_tipo = input('Opción: ');
            
            switch nuevo_tipo
                case 1
                    mostrar_resultados_limite(func, expr, nuevo_punto, 'bilateral');
                case 2
                    mostrar_resultados_limite(func, expr, nuevo_punto, 'izquierda');
                case 3
                    mostrar_resultados_limite(func, expr, nuevo_punto, 'derecha');
                otherwise
                    disp('Opción no válida.');
                    input('Presione Enter para continuar...');
                    calcular_limite();
            end
        case 3
            limite_personalizado();
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