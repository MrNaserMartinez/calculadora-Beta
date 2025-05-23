function transpuesta()
    clc;

    disp('===== CÁLCULO DE LA MATRIZ TRANSPUESTA =====');
    disp(' ');

     % Solicitar las dimensiones de la matriz
    filas = input('Número de filas: ');
    columnas = input('Número de columnas: ');
    
    % Verificar que sean válidas
    if filas <= 0 || columnas <= 0 || floor(filas) ~= filas || floor(columnas) ~= columnas
        disp('Error: Las dimensiones deben ser números enteros positivos');
        return;
    end
    
    % Ingresar la matriz
    A = ingresarMatriz(filas, columnas);
    
    % Calcular la transpuesta
    A_T = A';
    
    % Mostrar resultado
    disp(' ');
    disp('========== RESULTADO ==========');
    fprintf('Matriz original A (%dx%d):\n', filas, columnas);
    mostrarMatriz(A);
    disp(' ');
    fprintf('Matriz transpuesta Aᵀ (%dx%d):\n', columnas, filas);
    mostrarMatriz(A_T);
    
    % Propiedades y verificaciones
    disp(' ');
    disp('=== PROPIEDADES ===');
    fprintf('• Dimensiones originales: %dx%d\n', filas, columnas);
    fprintf('• Dimensiones transpuesta: %dx%d\n', size(A_T, 1), size(A_T, 2));
    disp('• La transpuesta convierte filas en columnas y viceversa');
    
    % Verificaciones adicionales para matrices cuadradas
    if filas == columnas
        disp(' ');
        disp('=== VERIFICACIONES (MATRIZ CUADRADA) ===');
        
        % Verificar si es simétrica
        if isequal(A, A_T)
            disp('✅ La matriz es simétrica (A = Aᵀ)');
        else
            disp('❌ La matriz no es simétrica');
        end
        
        % Verificar si es antisimétrica
        if isequal(A, -A_T)
            disp('✅ La matriz es antisimétrica (A = -Aᵀ)');
        else
            disp('❌ La matriz no es antisimétrica');
        end
        
        % Propiedad: (Aᵀ)ᵀ = A
        A_TT = (A_T)';
        if isequal(A, A_TT)
            disp('✅ Verificado: (Aᵀ)ᵀ = A');
        end
        
        % Determinante (si es cuadrada)
        det_A = det(A);
        det_AT = det(A_T);
        fprintf('• det(A) = %.6f\n', det_A);
        fprintf('• det(Aᵀ) = %.6f\n', det_AT);
        if abs(det_A - det_AT) < 1e-10
            disp('✅ Verificado: det(A) = det(Aᵀ)');
        end
    end

    disp(' ');
    input('Presione Enter para continuar...');
end

%% Función para ingresar una matriz de dimensiones específicas
function matriz = ingresarMatriz(filas, columnas)
    fprintf('\nIngrese los elementos de la matriz %dx%d:\n', filas, columnas);
    matriz = zeros(filas, columnas);
    
    for i = 1:filas
        for j = 1:columnas
            matriz(i,j) = input(sprintf('A(%d,%d) = ', i, j));
        end
    end
end