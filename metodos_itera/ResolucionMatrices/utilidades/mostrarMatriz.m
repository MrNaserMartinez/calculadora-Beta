function mostrarMatriz(matriz)
      % Obtener dimensiones
    [filas, columnas] = size(matriz);
    
    % Determinar el ancho máximo necesario para formatear
    maxVal = max(abs(matriz(:)));
    if maxVal == 0
        ancho = 6;
    else
        ancho = max(8, ceil(log10(maxVal)) + 4);
    end
    
    % Mostrar la matriz
    fprintf('┌');
    for j = 1:columnas
        if j == 1
            fprintf('%*s', ancho, '');
        else
            fprintf(' %*s', ancho, '');
        end
    end
    fprintf(' ┐\n');
    
    for i = 1:filas
        fprintf('│');
        for j = 1:columnas
            if matriz(i,j) == round(matriz(i,j))
                % Número entero
                fprintf(' %*.0f', ancho, matriz(i,j));
            else
                % Número decimal
                fprintf(' %*.4f', ancho, matriz(i,j));
            end
        end
        fprintf(' │\n');
    end
    
    fprintf('└');
    for j = 1:columnas
        if j == 1
            fprintf('%*s', ancho, '');
        else
            fprintf(' %*s', ancho, '');
        end
    end
    fprintf(' ┘\n');
end