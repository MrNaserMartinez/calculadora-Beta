function sistemaEcuaciones()
    clc;

    disp('===== RESOLVER SISTEMA DE ECUACIONES: Ax = b =====');
    disp(' ');

    % Solicitar el número de ecuaciones (y variables)
    n = input('Número de ecuaciones (y variables): ');
    
    % Verificar que sea válido
    if n <= 0 || floor(n) ~= n
        disp('Error: El número debe ser un entero positivo');
        return;
    end
    
    disp(' ');
    disp('Ingrese la matriz de coeficientes A:');
    A = ingresarMatriz(n, n);
    
    disp(' ');
    disp('Ingrese el vector de términos independientes b:');
    b = ingresarVector(n);
    
    % Calcular el determinante para verificar si tiene solución única
    det_A = det(A);
    
    disp(' ');
    disp('========== ANÁLISIS DEL SISTEMA ==========');
    disp('Matriz de coeficientes A:');
    mostrarMatriz(A);
    disp(' ');
    disp('Vector de términos independientes b:');
    mostrarMatriz(b);
    disp(' ');
    fprintf('Determinante de A = %.6f\n', det_A);
    
    % Resolver según el determinante
    if abs(det_A) < 1e-10
        disp(' ');
        disp('❌ SISTEMA SIN SOLUCIÓN ÚNICA');
        disp('• El determinante es cero (o muy cercano a cero)');
        disp('• El sistema puede tener infinitas soluciones o ninguna solución');
        
        % Análisis adicional usando rango
        rank_A = rank(A);
        rank_Ab = rank([A b]);
        
        fprintf('• Rango de A: %d\n', rank_A);
        fprintf('• Rango de [A|b]: %d\n', rank_Ab);
        
        if rank_A == rank_Ab
            disp('• El sistema es COMPATIBLE (tiene solución)');
            if rank_A < n
                disp('• El sistema tiene INFINITAS SOLUCIONES');
            end
        else
            disp('• El sistema es INCOMPATIBLE (no tiene solución)');
        end
        
    else
        % El sistema tiene solución única
        x = A \ b;
        
        disp(' ');
        disp('✅ SISTEMA CON SOLUCIÓN ÚNICA');
        disp(' ');
        disp('========== SOLUCIÓN ==========');
        for i = 1:n
            fprintf('x%d = %.6f\n', i, x(i));
        end
        
        % Verificación: Ax = b
        disp(' ');
        disp('=== VERIFICACIÓN ===');
        verificacion = A * x;
        disp('A * x =');
        mostrarMatriz(verificacion);
        disp(' ');
        disp('Debe ser igual a b:');
        mostrarMatriz(b);
        
        % Calcular error
        error = norm(verificacion - b);
        fprintf('\nError (norma): %.2e\n', error);
        
        if error < 1e-10
            disp('✅ Verificación exitosa');
        else
            disp('⚠️  Verificación con error numérico pequeño');
        end
        
        % Información adicional
        disp(' ');
        disp('=== INFORMACIÓN ADICIONAL ===');
        fprintf('• Número de condición: %.2e\n', cond(A));
        if cond(A) > 1e12
            disp('  ⚠️  Sistema mal condicionado (solución imprecisa)');
        elseif cond(A) > 1e6
            disp('  ⚠️  Sistema moderadamente mal condicionado');
        else
            disp('  ✅ Sistema bien condicionado');
        end
    end

     disp(' ');
    input('Presione Enter para continuar...');
end

%% Función para ingresar una matriz cuadrada
function matriz = ingresarMatriz(filas, columnas)
    matriz = zeros(filas, columnas);
    
    for i = 1:filas
        for j = 1:columnas
            matriz(i,j) = input(sprintf('A(%d,%d) = ', i, j));
        end
    end
end

%% Función para ingresar un vector columna
function vector = ingresarVector(n)
    vector = zeros(n, 1);
    
    for i = 1:n
        vector(i) = input(sprintf('b(%d) = ', i));
    end
end