function perimetro_cuadrilatero()
% PERIMETRO_CUADRILATERO Calcula el perímetro de diferentes tipos de cuadriláteros
%   Esta función permite calcular el perímetro de un cuadrilátero
%   (cuadrado, rectángulo, rombo, paralelogramo o cuadrilátero irregular).
    
    clc;
    disp("=== PERÍMETRO DE UN CUADRILÁTERO ===");
    disp("¿Qué tipo de cuadrilátero desea calcular?");
    disp("1. Cuadrado");
    disp("2. Rectángulo");
    disp("3. Rombo");
    disp("4. Paralelogramo");
    disp("5. Cuadrilátero irregular (dados los cuatro lados)");
    disp("6. Cuadrilátero por coordenadas");
    
    opcion = input("Seleccione una opción: ");
    
    switch opcion
        case 1
            % Cuadrado
            lado = input("Ingrese la longitud del lado: ");
            
            if lado <= 0
                error("Error: El lado debe ser un valor positivo.");
            end
            
            perimetro = 4 * lado;
            
            fprintf("\nRESULTADOS:\n");
            fprintf("Lado: %.4f\n", lado);
            fprintf("Perímetro: %.4f\n", perimetro);
            
            area = lado^2;
            diagonal = lado * sqrt(2);
            
            fprintf("\nInformación adicional:\n");
            fprintf("Área: %.4f\n", area);
            fprintf("Diagonal: %.4f\n", diagonal);
            
        case 2
            % Rectángulo
            largo = input("Ingrese el largo: ");
            ancho = input("Ingrese el ancho: ");
            
            if largo <= 0 || ancho <= 0
                error("Error: El largo y el ancho deben ser valores positivos.");
            end

            perimetro = 2 * (largo + ancho);
            
            fprintf("\nRESULTADOS:\n");
            fprintf("Largo: %.4f\n", largo);
            fprintf("Ancho: %.4f\n", ancho);
            fprintf("Perímetro: %.4f\n", perimetro);
            
            area = largo * ancho;
            diagonal = sqrt(largo^2 + ancho^2);
            
            fprintf("\nInformación adicional:\n");
            fprintf("Área: %.4f\n", area);
            fprintf("Diagonal: %.4f\n", diagonal);
            
        case 3
            % Rombo
            disp("¿Qué datos tiene disponibles?");
            disp("1. Lado");
            disp("2. Diagonales");
            subopcion = input("Seleccione una opción: ");
            
            if subopcion == 1
                lado = input("Ingrese la longitud del lado: ");
                
                if lado <= 0
                    error("Error: El lado debe ser un valor positivo.");
                end
                
                perimetro = 4 * lado;
  
                disp("\nPara calcular el área, necesito un dato adicional:");
                disp("1. Una diagonal");
                disp("2. Altura");
                disp("3. Ángulo entre lados");
                dato_extra = input("Seleccione una opción: ");
                
                if dato_extra == 1
                    diagonal = input("Ingrese la longitud de una diagonal: ");
                    diagonal2 = 2 * sqrt(lado^2 - (diagonal/2)^2);
                    area = 0.5 * diagonal * diagonal2;
                elseif dato_extra == 2
                    altura = input("Ingrese la altura: ");
                    area = lado * altura;
                    diagonal = 2 * sqrt(lado^2 - altura^2);
                    diagonal2 = 2 * altura;
                elseif dato_extra == 3
                    angulo = input("Ingrese el ángulo entre lados (en grados): ");
                    angulo_rad = angulo * pi/180;
                    diagonal = 2 * lado * sin(angulo_rad/2);
                    diagonal2 = 2 * lado * cos(angulo_rad/2);
                    area = 0.5 * diagonal * diagonal2;
                else
                    disp("Opción no válida.");
                    area = NaN;  
                    diagonal = NaN;
                    diagonal2 = NaN;
                end
            elseif subopcion == 2
                diagonal1 = input("Ingrese la longitud de la primera diagonal: ");
                diagonal2 = input("Ingrese la longitud de la segunda diagonal: ");
                
                if diagonal1 <= 0 || diagonal2 <= 0
                    error("Error: Las diagonales deben ser valores positivos.");
                end
                
                lado = sqrt((diagonal1/2)^2 + (diagonal2/2)^2);
                
                % Calcular perímetro
                perimetro = 4 * lado;
                
                % Calcular área
                area = 0.5 * diagonal1 * diagonal2;
                
                diagonal = diagonal1;
            else
                disp("Opción no válida.");
                return;
            end
            
            % Mostrar resultado
            fprintf("\nRESULTADOS:\n");
            fprintf("Lado: %.4f\n", lado);
            fprintf("Perímetro: %.4f\n", perimetro);
            
            fprintf("\nInformación adicional:\n");
            if ~isnan(area)
                fprintf("Área: %.4f\n", area);
            end
            if ~isnan(diagonal) && ~isnan(diagonal2)
                fprintf("Diagonal 1: %.4f\n", diagonal);
                fprintf("Diagonal 2: %.4f\n", diagonal2);
            end
            
        case 4
            % Paralelogramo
            lado1 = input("Ingrese la longitud del primer lado: ");
            lado2 = input("Ingrese la longitud del segundo lado: ");
            
            if lado1 <= 0 || lado2 <= 0
                error("Error: Los lados deben ser valores positivos.");
            end
            
            perimetro = 2 * (lado1 + lado2);
            
            disp("\nPara calcular el área, necesito un dato adicional:");
            disp("1. Altura respecto al primer lado");
            disp("2. Altura respecto al segundo lado");
            disp("3. Ángulo entre lados");
            dato_extra = input("Seleccione una opción: ");
            
            if dato_extra == 1
                altura1 = input("Ingrese la altura respecto al primer lado: ");
                area = lado1 * altura1;
                altura2 = area / lado2;
            elseif dato_extra == 2
                altura2 = input("Ingrese la altura respecto al segundo lado: ");
                area = lado2 * altura2;
                altura1 = area / lado1;
            elseif dato_extra == 3
                angulo = input("Ingrese el ángulo entre lados (en grados): ");
                angulo_rad = angulo * pi/180;
                area = lado1 * lado2 * sin(angulo_rad);
                altura1 = area / lado1;
                altura2 = area / lado2;
            else
                disp("Opción no válida.");
                area = NaN;
                altura1 = NaN;
                altura2 = NaN;
            end
            
            % Mostrar resultado
            fprintf("\nRESULTADOS:\n");
            fprintf("Lado 1: %.4f\n", lado1);
            fprintf("Lado 2: %.4f\n", lado2);
            fprintf("Perímetro: %.4f\n", perimetro);
            
            fprintf("\nInformación adicional:\n");
            if ~isnan(area)
                fprintf("Área: %.4f\n", area);
            end
            if ~isnan(altura1) && ~isnan(altura2)
                fprintf("Altura respecto al lado 1: %.4f\n", altura1);
                fprintf("Altura respecto al lado 2: %.4f\n", altura2);
            end
            
        case 5
            % Cuadrilátero irregular (dados los cuatro lados)
            lado1 = input("Ingrese la longitud del primer lado: ");
            lado2 = input("Ingrese la longitud del segundo lado: ");
            lado3 = input("Ingrese la longitud del tercer lado: ");
            lado4 = input("Ingrese la longitud del cuarto lado: ");
            
            if lado1 <= 0 || lado2 <= 0 || lado3 <= 0 || lado4 <= 0
                error("Error: Los lados deben ser valores positivos.");
            end
 
            lados = [lado1, lado2, lado3, lado4];
            lado_max = max(lados);
            suma_otros = sum(lados) - lado_max;
            
            if lado_max >= suma_otros
                warning("Advertencia: Los lados proporcionados podrían no formar un cuadrilátero cerrado.");
            end
            
            perimetro = lado1 + lado2 + lado3 + lado4;
            
            % Mostrar resultado
            fprintf("\nRESULTADOS:\n");
            fprintf("Lado 1: %.4f\n", lado1);
            fprintf("Lado 2: %.4f\n", lado2);
            fprintf("Lado 3: %.4f\n", lado3);
            fprintf("Lado 4: %.4f\n", lado4);
            fprintf("Perímetro: %.4f\n", perimetro);
            
            fprintf("\nNota: Para calcular el área de un cuadrilátero irregular\n");
            fprintf("se necesitan datos adicionales como ángulos o diagonales.\n");
            
        case 6
            % Cuadrilátero por coordenadas
            disp("Ingrese las coordenadas de los cuatro vértices en orden consecutivo:");
            x1 = input("x1: ");
            y1 = input("y1: ");
            x2 = input("x2: ");
            y2 = input("y2: ");
            x3 = input("x3: ");
            y3 = input("y3: ");
            x4 = input("x4: ");
            y4 = input("y4: ");
            
            lado1 = sqrt((x2 - x1)^2 + (y2 - y1)^2);
            lado2 = sqrt((x3 - x2)^2 + (y3 - y2)^2);
            lado3 = sqrt((x4 - x3)^2 + (y4 - y3)^2);
            lado4 = sqrt((x1 - x4)^2 + (y1 - y4)^2);
            
            perimetro = lado1 + lado2 + lado3 + lado4;
            
            % Mostrar resultado
            fprintf("\nRESULTADOS:\n");
            fprintf("Lado 1 (entre vértices 1 y 2): %.4f\n", lado1);
            fprintf("Lado 2 (entre vértices 2 y 3): %.4f\n", lado2);
            fprintf("Lado 3 (entre vértices 3 y 4): %.4f\n", lado3);
            fprintf("Lado 4 (entre vértices 4 y 1): %.4f\n", lado4);
            fprintf("Perímetro: %.4f\n", perimetro);
            
            area = 0.5 * abs((x1*y2 - x2*y1) + (x2*y3 - x3*y2) + (x3*y4 - x4*y3) + (x4*y1 - x1*y4));
            fprintf("Área: %.4f\n", area)
        otherwise
            disp("Opción no válida.");
    end
end