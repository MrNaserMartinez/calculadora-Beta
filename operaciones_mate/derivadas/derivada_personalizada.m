function derivada_personalizada()
% DERIVADA_PERSONALIZADA - Cálculo de derivadas para funciones ingresadas por el usuario
    
    % Solicitar función al usuario
    expr = input('Ingrese la función f(x) (use x como variable): ', 's');
    
    try
        % Crear función anónima para la expresión ingresada
        func = str2func(['@(x) ', expr]);
        % Validar que la función sea válida evaluándola en un punto
        func(1);
    catch
        disp('Error: La función ingresada no es válida.');
        input('Presione Enter para continuar...');
        calcular_derivada();
        return;
    end
    
    % Solicitar el punto donde calcular la derivada
    x0 = input('Ingrese el punto donde desea calcular la derivada: ');
    
    % Solicitar el paso h (opcional)
    h = input('Ingrese el paso h para la derivación numérica (dejar vacío para usar 0.0001): ');
    if isempty(h), h = 0.0001; end
    
    % Calcular y mostrar resultados
    mostrar_resultados_derivada(func, expr, x0, h);
end

function mostrar_resultados_derivada(func, expr, x0, h)
    % Calcular derivada usando diferentes métodos
    [deriv_adelante, deriv_centrada, deriv_extrapolada] = derivar_funcion(func, x0, h);
    
    % Mostrar resultados
    disp(' ');
    disp('Resultados:');
    disp('---------------------------------------------------');
    disp(['Función: f(x) = ' expr]);
    disp(['Punto de evaluación: x = ' num2str(x0)]);
    disp(['Valor de la función: f(' num2str(x0) ') = ' num2str(func(x0))]);
    disp(['Derivada (diferencia adelante): f''(' num2str(x0) ') ≈ ' num2str(deriv_adelante)]);
    disp(['Derivada (diferencia centrada): f''(' num2str(x0) ') ≈ ' num2str(deriv_centrada)]);
    disp(['Derivada (fórmula extrapolada): f''(' num2str(x0) ') ≈ ' num2str(deriv_extrapolada)]);
    disp('---------------------------------------------------');
    disp(['Nota: El resultado más preciso generalmente es el de la fórmula extrapolada,']);
    disp(['con un error estimado del orden de h^4 = ' num2str(h^4)]);
    
    % Opciones adicionales
    disp(' ');
    disp('Opciones adicionales:');
    disp('1. Graficar la función y su derivada');
    disp('2. Calcular derivada en otro punto');
    disp('3. Calcular otra derivada');
    disp('4. Volver al menú de derivadas');
    disp('5. Volver al menú principal');
    
    opcion = input('Opción: ');
    
    switch opcion
        case 1
            graficar_derivada(func, x0, h);
            input('Presione Enter para continuar...');
            calcular_derivada();
        case 2
            % Solicitar el nuevo punto
            nuevo_x0 = input('Ingrese el nuevo punto donde desea calcular la derivada: ');
            
            % Solicitar el paso h (opcional)
            nuevo_h = input('Ingrese el paso h para la derivación numérica (dejar vacío para usar 0.0001): ');
            if isempty(nuevo_h), nuevo_h = 0.0001; end
            
            mostrar_resultados_derivada(func, expr, nuevo_x0, nuevo_h);
        case 3
            calcular_derivada();
        case 4
            calcular_derivada();
        case 5
            % Volver al menú principal
            return;
        otherwise
            disp('Opción no válida.');
            input('Presione Enter para continuar...');
            calcular_derivada();
    end
end