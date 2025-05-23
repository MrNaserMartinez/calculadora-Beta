function perimetro_circulo()
% PERIMETRO_CIRCULO Calcula el perímetro (circunferencia) de un círculo
%   Esta función permite calcular el perímetro de un círculo
%   usando diferentes datos de entrada: radio, diámetro o área.

    clc;
    disp("=== PERÍMETRO DE UN CÍRCULO ===");
    disp("¿Qué datos tiene disponibles?");
    disp("1. Radio");
    disp("2. Diámetro");
    disp("3. Área");
    disp("4. Longitud de arco y ángulo");
    
    opcion = input("Seleccione una opción: ");
    
    switch opcion
        case 1
            % Usando el radio
            radio = input("Ingrese el radio: ");
            
            if radio <= 0
                error("Error: El radio debe ser un valor positivo.");
            end
            
            perimetro = 2 * pi * radio;
            
            % Mostrar resultado
            fprintf("\nRESULTADOS:\n");
            fprintf("Radio: %.4f\n", radio);
            fprintf("Perímetro (circunferencia): %.4f\n", perimetro);
            
            % Calcular área
            area = pi * radio^2;
            fprintf("Área: %.4f\n", area);
            
        case 2
            % Usando el diámetro
            diametro = input("Ingrese el diámetro: ");

            if diametro <= 0
                error("Error: El diámetro debe ser un valor positivo.");
            end
            
            radio = diametro / 2;
            
            perimetro = pi * diametro;
            
            % Mostrar resultado
            fprintf("\nRESULTADOS:\n");
            fprintf("Diámetro: %.4f\n", diametro);
            fprintf("Radio: %.4f\n", radio);
            fprintf("Perímetro (circunferencia): %.4f\n", perimetro);
            
            % Calcular área
            area = pi * radio^2;
            fprintf("Área: %.4f\n", area);
            
        case 3
            % Usando el área
            area = input("Ingrese el área: ");

            if area <= 0
                error("Error: El área debe ser un valor positivo.");
            end
            
            radio = sqrt(area / pi);
           
            perimetro = 2 * pi * radio;
            
            diametro = 2 * radio;
            
            % Mostrar resultado
            fprintf("\nRESULTADOS:\n");
            fprintf("Área: %.4f\n", area);
            fprintf("Radio: %.4f\n", radio);
            fprintf("Diámetro: %.4f\n", diametro);
            fprintf("Perímetro (circunferencia): %.4f\n", perimetro);
            
        case 4
            % Usando longitud de arco y ángulo
            arco = input("Ingrese la longitud del arco: ");
            angulo = input("Ingrese el ángulo correspondiente (en grados): ");

            if arco <= 0 || angulo <= 0 || angulo > 360
                error("Error: El arco debe ser positivo y el ángulo debe estar entre 0 y 360 grados.");
            end
            
            perimetro = arco * 360 / angulo;
            
            radio = arco / (angulo * pi / 180);
            
            area = pi * radio^2;
            
            % Mostrar resultado
            fprintf("\nRESULTADOS:\n");
            fprintf("Arco: %.4f\n", arco);
            fprintf("Ángulo: %.4f grados\n", angulo);
            fprintf("Radio: %.4f\n", radio);
            fprintf("Perímetro (circunferencia): %.4f\n", perimetro);
            fprintf("Área: %.4f\n", area);
            
        otherwise
            disp("Opción no válida.");
    end
end