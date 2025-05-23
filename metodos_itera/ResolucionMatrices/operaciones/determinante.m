function determinante()
    clc;

    disp('===== CÁLCULO DEL DETERMINANTE =====');
    disp(' ');

     % Solicitar el tamaño de la matriz
    n = input('Ingrese el tamaño de la matriz cuadrada: ');
    
    % Verificar que sea válido
    if n <= 0 || floor(n) ~= n
        disp('Error: El tamaño debe ser un número entero positivo');
        return;
    end
    
    % Ingresar la matriz
    A = ingresarMatrizCuadrada(n);
    
    % Calcular el determinante
    det_A = det(A);
    
    % Mostrar resultado
    disp(' ');
    disp('========== RESULTADO ==========');
    disp('Matriz A:');
    mostrarMatriz(A);
    disp(' ');
    fprintf('Determinante de A = %.6f\n', det_A);
    
    % Interpretación del resultado
    disp(' ');
    disp('=== INTERPRETACIÓN ===');
    if abs(det_A) < 1e-10
        disp('• La matriz es singular (no invertible)');
        disp('• Las filas/columnas son linealmente dependientes');
        disp('• El sistema asociado puede no tener solución única');
    else
        disp('• La matriz es no singular (invertible)');
        disp('• Las filas/columnas son linealmente independientes');
        disp('• El sistema asociado tiene solución única');
    end
    
    % Casos especiales
    if n <= 3
        disp(' ');
        disp('=== MÉTODO DE CÁLCULO ===');
        if n == 1
            fprintf('Para matriz 1x1: det(A) = %g\n', A(1,1));
        elseif n == 2
            fprintf('Para matriz 2x2: det(A) = ad - bc\n');
            fprintf('det(A) = (%g)(%g) - (%g)(%g) = %g\n', ...
                A(1,1), A(2,2), A(1,2), A(2,1), det_A);
        elseif n == 3
            disp('Para matriz 3x3: Regla de Sarrus o expansión por cofactores');
        end
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