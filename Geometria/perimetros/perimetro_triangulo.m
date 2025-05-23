
function perimetro_triangulo()
% PERIMETRO_TRIANGULO Calcula el perímetro de un triángulo
    clc;
    disp("Elija el método para calcular el perímetro del triángulo:");
    disp("1. Ingresar los tres lados");
    disp("2. Triángulo equilátero (un lado)");
    disp("3. Triángulo isósceles (base y lados iguales)");
    
    metodo = input("Seleccione una opción: ");
    
    switch metodo
        case 1
            % Triángulo cualquiera - tres lados diferentes
            lado1 = input("Ingrese la longitud del primer lado: ");
            lado2 = input("Ingrese la longitud del segundo lado: ");
            lado3 = input("Ingrese la longitud del tercer lado: ");
            
            if (lado1 + lado2 > lado3) && (lado1 + lado3 > lado2) && (lado2 + lado3 > lado1)
                perimetro = lado1 + lado2 + lado3;
                fprintf("El perímetro del triángulo es: %.4f unidades\n", perimetro);
            else
                disp("Error: Los lados proporcionados no pueden formar un triángulo.");
                disp("(La suma de dos lados debe ser mayor que el tercer lado)");
            end
            
        case 2
            % Triángulo equilátero - todos los lados iguales
            lado = input("Ingrese la longitud del lado: ");
            
            perimetro = 3 * lado;
            fprintf("El perímetro del triángulo equilátero es: %.4f unidades\n", perimetro);
            
        case 3
            % Triángulo isósceles - dos lados iguales
            base = input("Ingrese la longitud de la base: ");
            lado = input("Ingrese la longitud de los lados iguales: ");
            
            perimetro = base + 2 * lado;
            fprintf("El perímetro del triángulo isósceles es: %.4f unidades\n", perimetro);
            
        otherwise
            disp("Opción no válida");
    end
end