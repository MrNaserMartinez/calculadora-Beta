function matrizInversa()
    clc;

    disp('===== CÁLCULO DE LA MATRIZ INVERSA =====');
    disp(' ');

     n = input('Ingrese el tamaño de la matriz cuadrada: ');

     % Verificar que sea válido
    if n <= 0 || floor(n) ~= n
        disp('Error: El tamaño debe ser un número entero positivo');
        return;
    end
    
    % Ingresar la matriz
    A = ingresarMatrizCuadrada(n);
    
    % Calcular el determinante para verificar si es invertible
    det_A = det(A);
    
    disp(' ');
    disp('========== RESULTADO ==========');
    disp('Matriz A:');
    mostrarMatriz(A);
    disp(' ');
    fprintf('Determinante de A = %.6f\n', det_A);
    
    % Verificar si la matriz es invertible
    if abs(det_A) < 1e-10
        disp(' ');
        disp('❌ ERROR: La matriz no es invertible');
        disp('  • El determinante es cero (o muy cercano a cero)');
        disp('  • La matriz es singular');
    else
        % Calcular la matriz inversa
        A_inv = inv(A);
        
        disp(' ');
        disp('✅ La matriz es invertible');
        disp(' ');
        disp('Matriz inversa A⁻¹:');
        mostrarMatriz(A_inv);
        
        % Verificación: A * A⁻¹ = I
        disp(' ');
        disp('=== VERIFICACIÓN ===');
        producto = A * A_inv;
        disp('A * A⁻¹ =');
        mostrarMatriz(producto);
        
        % Verificar si es aproximadamente la identidad
        identidad = eye(n);
        error = norm(producto - identidad, 'fro');
        fprintf('\nError (norma de Frobenius): %.2e\n', error);
        
        if error < 1e-10
            disp('✅ Verificación exitosa: A * A⁻¹ ≈ I');
        else
            disp('⚠️  Verificación con error numérico (aceptable si es pequeño)');
        end

          disp(' ');
    input('Presione Enter para continuar...');
    end

    %% Función para ingresar una matriz cuadrada
function matriz = ingresarMatrizCuadrada(n)
    fprintf('\nIngrese los elementos de la matriz %dx%d:\n', n, n);
    matriz = zeros(n, n);
    
    for i = 1:n
        for j = 1:n
            matriz(i,j) = input(sprintf('A(%d,%d) = ', i, j));
            end
        end
    end
end
