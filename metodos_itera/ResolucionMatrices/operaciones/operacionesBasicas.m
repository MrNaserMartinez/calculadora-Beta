function operacionesBasicas()

    disp('===== OPERACIONES BÁSICAS CON MATRICES =====');
    disp(' ');

    disp('¿Qué operación desea realizar?');
    disp('1. Suma de matrices (A + B)');
    disp('2. Resta de matrices (A - B)');
    disp('3. Multiplicación de matrices (A * B)');
    disp('4. Multiplicación por escalar (k * A)');
    
    opcion = input('Seleccione una opción: ');
    
    switch opcion
        case 1 % Suma
            disp(' ');
            disp('=== SUMA DE MATRICES ===');
            [A, B] = ingresarDosMatrices();
            
            % Verificar dimensiones
            if isequal(size(A), size(B))
                C = A + B;
                mostrarResultado('SUMA', A, B, C, '+');
            else
                disp('Error: Las matrices deben tener las mismas dimensiones');
            end
            
        case 2 % Resta
            disp(' ');
            disp('=== RESTA DE MATRICES ===');
            [A, B] = ingresarDosMatrices();
            
            % Verificar dimensiones
            if isequal(size(A), size(B))
                C = A - B;
                mostrarResultado('RESTA', A, B, C, '-');
            else
                disp('Error: Las matrices deben tener las mismas dimensiones');
            end
            
        case 3 % Multiplicación
            disp(' ');
            disp('=== MULTIPLICACIÓN DE MATRICES ===');
            [A, B] = ingresarDosMatricesMultiplicacion();
            
            % Verificar si se pueden multiplicar
            if size(A, 2) == size(B, 1)
                C = A * B;
                mostrarResultado('MULTIPLICACIÓN', A, B, C, '*');
            else
                disp('Error: El número de columnas de A debe ser igual al número de filas de B');
            end
            
        case 4 % Multiplicación por escalar
            disp(' ');
            disp('=== MULTIPLICACIÓN POR ESCALAR ===');
            A = ingresarMatriz('A');
            k = input('Ingrese el escalar k: ');
            
            C = k * A;
            
            disp(' ');
            disp('========== RESULTADO ==========');
            disp('Matriz A:');
            mostrarMatriz(A);
            disp(' ');
            fprintf('Escalar k = %.2f\n', k);
            disp(' ');
            disp('k * A =');
            mostrarMatriz(C);
            
        otherwise
            disp('Opción no válida');
            return;
    end
    
    % Pausa para ver resultados
    disp(' ');
    input('Presione Enter para continuar...');
end

%% Función para ingresar dos matrices del mismo tamaño
function [A, B] = ingresarDosMatrices()
    disp('Ingrese las dimensiones de las matrices:');
    filas = input('Número de filas: ');
    columnas = input('Número de columnas: ');
    
    A = ingresarMatrizDimensiones('A', filas, columnas);
    B = ingresarMatrizDimensiones('B', filas, columnas);
end

%% Función para ingresar dos matrices para multiplicación
function [A, B] = ingresarDosMatricesMultiplicacion()
    disp('Para multiplicar A * B:');
    disp('Matriz A:');
    filasA = input('Número de filas de A: ');
    columnasA = input('Número de columnas de A: ');
    
    disp(' ');
    disp('Matriz B:');
    filasB = input('Número de filas de B: ');
    columnasB = input('Número de columnas de B: ');
    
    if columnasA ~= filasB
        fprintf('ADVERTENCIA: No se pueden multiplicar (columnas de A ≠ filas de B)\n');
        fprintf('Dimensiones: A[%dx%d] * B[%dx%d]\n', filasA, columnasA, filasB, columnasB);
    end
    
    A = ingresarMatrizDimensiones('A', filasA, columnasA);
    B = ingresarMatrizDimensiones('B', filasB, columnasB);
end

%% Función para ingresar una matriz con dimensiones específicas
function matriz = ingresarMatrizDimensiones(nombre, filas, columnas)
    fprintf('\nIngrese los elementos de la matriz %s (%dx%d):\n', nombre, filas, columnas);
    matriz = zeros(filas, columnas);
    
    for i = 1:filas
        for j = 1:columnas
            matriz(i,j) = input(sprintf('%s(%d,%d) = ', nombre, i, j));
        end
    end
end

%% Función para ingresar una matriz general
function matriz = ingresarMatriz(nombre)
    fprintf('\nMatriz %s:\n', nombre);
    filas = input('Número de filas: ');
    columnas = input('Número de columnas: ');
    
    matriz = ingresarMatrizDimensiones(nombre, filas, columnas);
end

%% Función para mostrar resultado de operación
function mostrarResultado(operacion, A, B, C, simbolo)
    disp(' ');
    disp(['========== RESULTADO DE ' operacion ' ==========']);
    disp('Matriz A:');
    mostrarMatriz(A);
    disp(' ');
    disp('Matriz B:');
    mostrarMatriz(B);
    disp(' ');
    fprintf('A %s B =\n', simbolo);
    mostrarMatriz(C);
end