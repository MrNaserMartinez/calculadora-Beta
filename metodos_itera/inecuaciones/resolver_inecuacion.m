function resolver_inecuacion()
    clc;
    disp("=== RESOLUCIÓN DE INECUACIONES ===");
    disp("Esta herramienta resuelve inecuaciones lineales y cuadráticas.");
    disp("");
    disp("Tipos de inecuaciones disponibles:");
    disp("1. Inecuación lineal (ax + b < 0)");
    disp("2. Inecuación cuadrática (ax² + bx + c < 0)");
    disp("0. Volver al menú principal");
    
    opcion = input("\nSeleccione una opción: ");
    
    if opcion == 0
        return;
    end
    
    switch opcion
        case 1
            inecuacion_lineal();
        case 2
            inecuacion_cuadratica();
        otherwise
            disp("Opción no válida. Intente de nuevo.");
    end
end