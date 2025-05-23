function calcular_perimetro()
% CALCULAR_PERIMETRO Función que muestra el menú de opciones para cálculo de perímetros

    clc;
    disp("=== CALCULADORA DE PERÍMETROS ===");
    disp("1. Perímetro de un triángulo");
    disp("2. Perímetro de un cuadrilátero");
    disp("3. Perímetro de un círculo");
    disp("4. Perímetro de un polígono regular");
    disp("0. Volver al menú principal");
    
    opcion = input("Seleccione una opción: ");
    
    if opcion == 0
        return;
    end
    
    switch opcion
        case 1
            perimetro_triangulo();
        case 2
            perimetro_cuadrilatero();
        case 3
            perimetro_circulo();
        case 4
            % Perímetro de un polígono regular
            n = input("Ingrese el número de lados del polígono: ");
            lado = input("Ingrese la longitud de un lado: ");
            
            perimetro = n * lado;
            
            fprintf("El perímetro del polígono regular de %d lados es: %.4f unidades\n", n, perimetro);
        otherwise
            disp("Opción no válida");
    end
end