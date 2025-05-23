function calcular_raiz()
% CALCULAR_RAIZ Función que muestra el menú de opciones para calcular raíces

    clc;
    disp("=== CALCULADORA DE RAÍCES ===");
    disp("1. Raíz cuadrada");
    disp("2. Raíz cúbica");
    disp("0. Volver al menú principal");
    
    opcion = input("Seleccione una opción: ");
    
    if opcion == 0
        return;
    end
    
    numero = input("Ingrese el número: ");
    
    switch opcion
        case 1
            resultado = raiz_cuadrada(numero);
            fprintf("La raíz cuadrada de %.2f es: %.4f\n", numero, resultado);
        case 2
            resultado = raiz_cubica(numero);
            fprintf("La raíz cúbica de %.2f es: %.4f\n", numero, resultado);
        otherwise
            disp("Opción no válida");
    end
end