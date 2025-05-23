% filepath: c:\Users\mario\Desktop\Calculadora\volumenes\calcular_volumen.m
function calcular_volumen()
% CALCULAR_VOLUMEN - Interfaz principal para el cálculo de volúmenes
% Permite al usuario seleccionar una figura y calcular su volumen

    % Limpiar pantalla y mostrar encabezado
    clc;
    disp('===================================================');
    disp('              CÁLCULO DE VOLÚMENES                 ');
    disp('===================================================');
    
    % Menú principal
    disp('Seleccione una figura:');
    disp('1. Cubo');
    disp('2. Prisma rectangular');
    disp('3. Cilindro');
    disp('4. Cono');
    disp('5. Esfera');
    disp('6. Pirámide');
    disp('7. Tronco de cono');
    disp('8. Prisma triangular');
    disp('9. Mostrar fórmulas de volumen');
    disp('10. Volver al menú principal');
    
    opcion = input('Opción: ');
    
    switch opcion
        case 1
            calcular_volumen_cubo();
        case 2
            calcular_volumen_prisma_rectangular();
        case 3
            calcular_volumen_cilindro();
        case 4
            calcular_volumen_cono();
        case 5
            calcular_volumen_esfera();
        case 6
            calcular_volumen_piramide();
        case 7
            calcular_volumen_tronco_cono();
        case 8
            calcular_volumen_prisma_triangular();
        case 9
            mostrar_formulas();
            calcular_volumen(); % Volver al menú después de mostrar fórmulas
        case 10
            % Volver al menú principal
            disp('Volviendo al menú principal...');
            pause(1);
            return;
        otherwise
            disp('Opción no válida. Inténtelo de nuevo.');
            pause(2);
            calcular_volumen();
    end
end

function calcular_volumen_cubo()
    clc;
    disp('===================================================');
    disp('            VOLUMEN DE UN CUBO                     ');
    disp('===================================================');
    disp('Fórmula: V = lado³');
    disp(' ');
    
    % Solicitar datos
    lado = input('Ingrese la longitud del lado: ');
    
    % Validar entrada (validación básica, la función externa hará una validación más completa)
    if ~isnumeric(lado) 
        disp('Error: La longitud del lado debe ser un número.');
        input('Presione Enter para continuar...');
        calcular_volumen();
        return;
    end
    
    try
        % Calcular volumen usando la función externa
        volumen = calcular_vol_cubo(lado);
        
        % Mostrar resultado
        disp(' ');
        disp('Resultado:');
        disp(['Volumen del cubo = ' num2str(volumen) ' unidades cúbicas']);
    catch e
        % Manejar posibles errores
        disp(['Error: ' e.message]);
        input('Presione Enter para continuar...');
        calcular_volumen();
        return;
    end
    
    % Opciones adicionales
    mostrar_opciones_adicionales();
end

function calcular_volumen_prisma_rectangular()
    clc;
    disp('===================================================');
    disp('        VOLUMEN DE UN PRISMA RECTANGULAR           ');
    disp('===================================================');
    disp('Fórmula: V = largo × ancho × altura');
    disp(' ');
    
    % Solicitar datos
    largo = input('Ingrese el largo: ');
    ancho = input('Ingrese el ancho: ');
    altura = input('Ingrese la altura: ');
    
    % Validación básica
    if ~isnumeric(largo) || ~isnumeric(ancho) || ~isnumeric(altura)
        disp('Error: Las dimensiones deben ser números.');
        input('Presione Enter para continuar...');
        calcular_volumen();
        return;
    end
    
    try
        % Calcular volumen usando la función externa
        volumen = calcular_vol_prisma_rectangular(largo, ancho, altura);
        
        % Mostrar resultado
        disp(' ');
        disp('Resultado:');
        disp(['Volumen del prisma rectangular = ' num2str(volumen) ' unidades cúbicas']);
    catch e
        % Manejar posibles errores
        disp(['Error: ' e.message]);
        input('Presione Enter para continuar...');
        calcular_volumen();
        return;
    end
    
    % Opciones adicionales
    mostrar_opciones_adicionales();
end

function calcular_volumen_cilindro()
    clc;
    disp('===================================================');
    disp('            VOLUMEN DE UN CILINDRO                 ');
    disp('===================================================');
    disp('Fórmula: V = π × radio² × altura');
    disp(' ');
    
    % Solicitar datos
    radio = input('Ingrese el radio de la base: ');
    altura = input('Ingrese la altura: ');
    
    % Validación básica
    if ~isnumeric(radio) || ~isnumeric(altura)
        disp('Error: El radio y la altura deben ser números.');
        input('Presione Enter para continuar...');
        calcular_volumen();
        return;
    end
    
    try
        % Calcular volumen usando la función externa
        volumen = calcular_vol_cilindro(radio, altura);
        
        % Mostrar resultado
        disp(' ');
        disp('Resultado:');
        disp(['Volumen del cilindro = ' num2str(volumen) ' unidades cúbicas']);
    catch e
        % Manejar posibles errores
        disp(['Error: ' e.message]);
        input('Presione Enter para continuar...');
        calcular_volumen();
        return;
    end
    
    % Opciones adicionales
    mostrar_opciones_adicionales();
end

function calcular_volumen_cono()
    clc;
    disp('===================================================');
    disp('              VOLUMEN DE UN CONO                   ');
    disp('===================================================');
    disp('Fórmula: V = (1/3) × π × radio² × altura');
    disp(' ');
    
    % Solicitar datos
    radio = input('Ingrese el radio de la base: ');
    altura = input('Ingrese la altura: ');
    
    % Validación básica
    if ~isnumeric(radio) || ~isnumeric(altura)
        disp('Error: El radio y la altura deben ser números.');
        input('Presione Enter para continuar...');
        calcular_volumen();
        return;
    end
    
    try
        % Calcular volumen usando la función externa
        volumen = calcular_vol_cono(radio, altura);
        
        % Mostrar resultado
        disp(' ');
        disp('Resultado:');
        disp(['Volumen del cono = ' num2str(volumen) ' unidades cúbicas']);
    catch e
        % Manejar posibles errores
        disp(['Error: ' e.message]);
        input('Presione Enter para continuar...');
        calcular_volumen();
        return;
    end
    
    % Opciones adicionales
    mostrar_opciones_adicionales();
end

function calcular_volumen_esfera()
    clc;
    disp('===================================================');
    disp('             VOLUMEN DE UNA ESFERA                 ');
    disp('===================================================');
    disp('Fórmula: V = (4/3) × π × radio³');
    disp(' ');
    
    % Solicitar datos
    radio = input('Ingrese el radio de la esfera: ');
    
    % Validación básica
    if ~isnumeric(radio)
        disp('Error: El radio debe ser un número.');
        input('Presione Enter para continuar...');
        calcular_volumen();
        return;
    end
    
    try
        % Calcular volumen usando la función externa
        volumen = calcular_vol_esfera(radio);
        
        % Mostrar resultado
        disp(' ');
        disp('Resultado:');
        disp(['Volumen de la esfera = ' num2str(volumen) ' unidades cúbicas']);
    catch e
        % Manejar posibles errores
        disp(['Error: ' e.message]);
        input('Presione Enter para continuar...');
        calcular_volumen();
        return;
    end
    
    % Opciones adicionales
    mostrar_opciones_adicionales();
end

function calcular_volumen_piramide()
    clc;
    disp('===================================================');
    disp('            VOLUMEN DE UNA PIRÁMIDE                ');
    disp('===================================================');
    disp('Fórmula: V = (1/3) × área_base × altura');
    disp(' ');
    
    % Solicitar datos
    area_base = input('Ingrese el área de la base: ');
    altura = input('Ingrese la altura: ');
    
    % Validación básica
    if ~isnumeric(area_base) || ~isnumeric(altura)
        disp('Error: El área de la base y la altura deben ser números.');
        input('Presione Enter para continuar...');
        calcular_volumen();
        return;
    end
    
    try
        % Calcular volumen usando la función externa
        volumen = calcular_vol_piramide(area_base, altura);
        
        % Mostrar resultado
        disp(' ');
        disp('Resultado:');
        disp(['Volumen de la pirámide = ' num2str(volumen) ' unidades cúbicas']);
    catch e
        % Manejar posibles errores
        disp(['Error: ' e.message]);
        input('Presione Enter para continuar...');
        calcular_volumen();
        return;
    end
    
    % Opciones adicionales
    mostrar_opciones_adicionales();
end

function calcular_volumen_tronco_cono()
    clc;
    disp('===================================================');
    disp('          VOLUMEN DE UN TRONCO DE CONO             ');
    disp('===================================================');
    disp('Fórmula: V = (1/3) × π × altura × (r₁² + r₁×r₂ + r₂²)');
    disp(' ');
    
    % Solicitar datos
    radio1 = input('Ingrese el radio de la base mayor: ');
    radio2 = input('Ingrese el radio de la base menor: ');
    altura = input('Ingrese la altura: ');
    
    % Validación básica
    if ~isnumeric(radio1) || ~isnumeric(radio2) || ~isnumeric(altura)
        disp('Error: Los radios y la altura deben ser números.');
        input('Presione Enter para continuar...');
        calcular_volumen();
        return;
    end
    
    try
        % Calcular volumen usando la función externa
        volumen = calcular_vol_tronco_cono(radio1, radio2, altura);
        
        % Mostrar resultado
        disp(' ');
        disp('Resultado:');
        disp(['Volumen del tronco de cono = ' num2str(volumen) ' unidades cúbicas']);
    catch e
        % Manejar posibles errores
        disp(['Error: ' e.message]);
        input('Presione Enter para continuar...');
        calcular_volumen();
        return;
    end
    
    % Opciones adicionales
    mostrar_opciones_adicionales();
end

function calcular_volumen_prisma_triangular()
    clc;
    disp('===================================================');
    disp('        VOLUMEN DE UN PRISMA TRIANGULAR            ');
    disp('===================================================');
    disp('Fórmula: V = (1/2) × base × altura_base × longitud');
    disp(' ');
    
    % Solicitar datos
    base_triangulo = input('Ingrese la base del triángulo: ');
    altura_triangulo = input('Ingrese la altura del triángulo: ');
    longitud_prisma = input('Ingrese la longitud del prisma: ');
    
    % Validación básica
    if ~isnumeric(base_triangulo) || ~isnumeric(altura_triangulo) || ~isnumeric(longitud_prisma)
        disp('Error: Todas las dimensiones deben ser números.');
        input('Presione Enter para continuar...');
        calcular_volumen();
        return;
    end
    
    try
        % Calcular volumen usando la función externa
        volumen = calcular_vol_prisma_triangular(base_triangulo, altura_triangulo, longitud_prisma);
        
        % Mostrar resultado
        disp(' ');
        disp('Resultado:');
        disp(['Volumen del prisma triangular = ' num2str(volumen) ' unidades cúbicas']);
    catch e
        % Manejar posibles errores
        disp(['Error: ' e.message]);
        input('Presione Enter para continuar...');
        calcular_volumen();
        return;
    end
    
    % Opciones adicionales
    mostrar_opciones_adicionales();
end

function mostrar_opciones_adicionales()
    disp(' ');
    disp('Opciones:');
    disp('1. Calcular volumen de otra figura');
    disp('2. Volver al menú principal');
    
    opcion = input('Opción: ');
    
    switch opcion
        case 1
            calcular_volumen();
        case 2
            % Volver al menú principal
            disp('Volviendo al menú principal...');
            clear calcular_volumen;  % Limpiamos la función de la memoria
            return;
        otherwise
            disp('Opción no válida.');
            input('Presione Enter para continuar...');
            calcular_volumen();
    end
end