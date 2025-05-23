clc;
clear;

while true
    disp("=========================================================");
    disp("          CALCULADORA MULTIFUNCIONAL UNIFICADA          ");
    disp("=========================================================");
    disp("Seleccione una opción:");
    disp(" ");
    disp("--- OPERACIONES MATEMÁTICAS ---");
    disp("1.  Operaciones aritméticas básicas");
    disp("2.  Funciones de raíces");
    disp("3.  Cálculo de límites");
    disp("4.  Cálculo de derivadas");
    disp("5.  Integrales definidas");
    disp("6.  Funciones trigonométricas");
    disp("7.  Funciones de potencia");
    disp(" ");
    disp("--- GEOMETRÍA ---");
    disp("8.  Cálculo de volúmenes");
    disp("9.  Cálculo de perímetros");
    disp("10. Cálculo de áreas");
    disp(" ");
    disp("--- MÉTODOS NUMÉRICOS ---");
    disp("11. Método de bisección");
    disp("12. Método de secante modificada");
    disp("13. Método de raíces múltiples");
    disp("14. Método de Muller");
    disp("15. Método de punto fijo");
    disp("16. Método de Gauss-Seidel");
    disp("17. Método de Newton-Raphson");
    disp("18. Resolución de inecuaciones");
    disp("19. Resolución de ecuaciones");
    disp("20. Operaciones con matrices");
    disp(" ");
    disp("--- FÍSICA ---");
    disp("21. Movimiento rectilíneo uniformemente acelerado");
    disp("22. Caída libre y tiro vertical");
    disp("23. Lanzamiento de proyectiles");
    disp("24. Segunda ley de Newton");
    disp("25. Tercera ley de Newton");
    disp(" ");
    disp("0.  Salir");
    disp("=========================================================");
    
    opcion = input("Ingrese su opción: ");
    
    if opcion == 0
        mostrar_despedida();
        break;
    end
    
    switch opcion
        case 1
            ejecutar_modulo('', 'calcular_aritmetica');
        case 2
            ejecutar_modulo('', 'calcular_raiz');
        case 3
            ejecutar_modulo('', 'CALCULO_DE_LIMITES');
        case 4
            ejecutar_modulo('', 'calcular_derivada');
        case 5
            ejecutar_modulo('', 'calcular_integral');
        case 6
            ejecutar_modulo('FuncionesTrigonometricas', 'main');
        case 7
            ejecutar_modulo('', 'FUNCIONES_DE_POTENCIA');
        case 8
            ejecutar_modulo('', 'calcular_volumen');
        case 9
            ejecutar_modulo('', 'calcular_perimetro');
        case 10
            ejecutar_modulo('', 'CALCULO_DE_AREAS');
        case 11
            ejecutar_modulo('', 'calcular_biseccion');
        case 12
            ejecutar_modulo('', 'secante_modi');
        case 13
            ejecutar_modulo('', 'raices_multiples');
        case 14
            ejecutar_modulo('', 'muller');
        case 15
            ejecutar_modulo('', 'PUNTO_FIJO');
        case 16
            ejecutar_modulo('', 'gauss_seidel');
        case 17
            ejecutar_modulo('NewtonRaphson', 'main');
        case 18
            ejecutar_modulo('', 'resolver_inecuacion');
        case 19
            ejecutar_modulo('ResolucionEcuaciones', 'main');
        case 20
            ejecutar_modulo('ResolucionMatrices', 'main');
        case 21
            ejecutar_modulo('', 'MOVIMIENTO_RECTILINEO_UNIFORMEMENTE_ACELERADO');
        case 22
            ejecutar_modulo('', 'calcular_caida');
        case 23
            ejecutar_modulo('', 'calcular_proyectil');
        case 24
            ejecutar_modulo('', 'segunda_ley_newton');
        case 25
            ejecutar_modulo('', 'tercera_ley_newton');
        otherwise
            disp("Opción no válida. Intente de nuevo.");
    end
    
    fprintf("\nPresione Enter para continuar...");
    pause;
    clc;
end

% ========== FUNCIONES AUXILIARES ==========

function ejecutar_modulo(directorio, nombre_funcion)
    % Función auxiliar para ejecutar módulos y manejar errores
    try
        % Guardar la ruta actual
        ruta_actual = pwd;
        
        % Si hay un directorio específico, cambiar a él
        if ~isempty(directorio)
            if exist(directorio, 'dir')
                cd(directorio);
            else
                warning('El directorio "%s" no existe. Ejecutando desde directorio actual.', directorio);
            end
        end
        
        % Verificar si la función existe
        if exist(nombre_funcion, 'file') == 2 || exist([nombre_funcion '.m'], 'file') == 2
            % Para módulos con main.m, ejecutar el archivo
            if strcmp(nombre_funcion, 'main')
                run('main.m');
            else
                % Ejecutar la función del módulo
                feval(nombre_funcion);
            end
        else
            error('La función "%s" no se encuentra.', nombre_funcion);
        end
        
        % Volver a la ruta original
        cd(ruta_actual);
        
    catch e
        % Manejar errores y volver a la ruta original
        cd(ruta_actual);
        disp("=========================================================");
        disp("ERROR AL EJECUTAR EL MÓDULO:");
        disp(['Función: ' nombre_funcion]);
        disp(['Directorio: ' directorio]);
        disp(['Mensaje: ' e.message]);
        disp("=========================================================");
        disp("Posibles soluciones:");
        disp("- Verificar que el archivo .m existe");
        disp("- Verificar que está en la ruta correcta");
        disp("- Verificar la sintaxis del archivo");
        fprintf("Presione Enter para volver al menú principal...");
        pause;
    end
end

function mostrar_despedida()
    % Mostrar mensaje de despedida
    clc;
    disp("=========================================================");
    disp("         GRACIAS POR USAR LA CALCULADORA UNIFICADA      ");
    disp("=========================================================");
    disp(" ");
    disp("Programa desarrollado como proyecto educativo.");
    disp("Combina funcionalidades matemáticas, numéricas y de física.");
    disp(" ");
    disp("Funcionalidades incluidas:");
    disp("• Operaciones matemáticas básicas y avanzadas");
    disp("• Cálculo diferencial e integral");
    disp("• Geometría y cálculo de áreas/volúmenes");
    disp("• Métodos numéricos avanzados");
    disp("• Física: cinemática y leyes de Newton");
    disp(" ");
    disp("¡Hasta la próxima!");
    disp(" ");
    pause(3);
end