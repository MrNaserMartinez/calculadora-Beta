% filepath: c:\Users\mario\Desktop\Calculadora\derivadas\derivada_predefinida.m
function derivada_predefinida()
% DERIVADA_PREDEFINIDA - Cálculo de derivadas para funciones predefinidas
    
    % Mostrar funciones predefinidas disponibles
    [funciones, nombres, derivadas_exactas] = predefinidas_derivadas();
    
    disp('Funciones predefinidas disponibles:');
    for i = 1:length(nombres)
        disp([num2str(i), '. ', nombres{i}]);
    end
    
    % Solicitar selección al usuario
    opcion = input('Seleccione una función: ');
    
    if opcion >= 1 && opcion <= length(funciones)
        func = funciones{opcion};
        nombre_func = nombres{opcion};
        deriv_exacta = derivadas_exactas{opcion};
        
        disp(['Función seleccionada: ', nombre_func]);
        
        % Solicitar el punto donde calcular la derivada
        x0 = input('Ingrese el punto donde desea calcular la derivada: ');
        
        % Mostrar resultados y opciones
        mostrar_resultados_predefinida(func, nombre_func, x0, deriv_exacta);
    else
        disp('Selección no válida. Inténtelo de nuevo.');
        input('Presione Enter para continuar...');
        calcular_derivada();
    end
end

function mostrar_resultados_predefinida(func, nombre_func, x0, deriv_exacta)
    % Paso fijo para funciones predefinidas
    h = 0.0001;
    
    % Calcular derivada usando métodos numéricos
    [deriv_adelante, deriv_centrada, deriv_extrapolada] = derivar_funcion(func, x0, h);
    
    % Calcular valor exacto de la derivada
    valor_exacto = deriv_exacta(x0);
    
    % Calcular errores
    error_adelante = abs(deriv_adelante - valor_exacto);
    error_centrada = abs(deriv_centrada - valor_exacto);
    error_extrapolada = abs(deriv_extrapolada - valor_exacto);
    
    % Mostrar resultados
    disp(' ');
    disp('Resultados:');
    disp('---------------------------------------------------');
    disp(['Función: ' nombre_func]);
    disp(['Punto de evaluación: x = ' num2str(x0)]);
    disp(['Valor de la función: f(' num2str(x0) ') = ' num2str(func(x0))]);
    disp(' ');
    disp('Valores de la derivada:');
    disp(['Método diferencia adelante: ' num2str(deriv_adelante) ' (error: ' num2str(error_adelante) ')']);
    disp(['Método diferencia centrada: ' num2str(deriv_centrada) ' (error: ' num2str(error_centrada) ')']);
    disp(['Método fórmula extrapolada: ' num2str(deriv_extrapolada) ' (error: ' num2str(error_extrapolada) ')']);
    disp(['Valor exacto: ' num2str(valor_exacto)]);
    disp('---------------------------------------------------');
    
    % Opciones adicionales
    disp(' ');
    disp('Opciones adicionales:');
    disp('1. Graficar la función y su derivada');
    disp('2. Calcular derivada en otro punto');
    disp('3. Seleccionar otra función predefinida');
    disp('4. Volver al menú de derivadas');
    disp('5. Volver al menú principal');
    
    opcion = input('Opción: ');
    
    switch opcion
        case 1
            graficar_derivada(func, x0, h, deriv_exacta);
            input('Presione Enter para continuar...');
            calcular_derivada();
        case 2
            % Solicitar el nuevo punto
            nuevo_x0 = input('Ingrese el nuevo punto donde desea calcular la derivada: ');
            mostrar_resultados_predefinida(func, nombre_func, nuevo_x0, deriv_exacta);
        case 3
            derivada_predefinida();
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