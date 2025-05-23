function main()

% Añadir carpetas
addpath('ecuaciones');
addpath('graficos');

% Variable para controlar el menú
continuar = true;

clc;
disp('======= SOLUCIONADOR DE ECUACIONES ======')
pause(1);

while continuar
    disp('====== MENÚ PRINCIPAL =====');
    disp('1. Ecuación Liena (ax + b = 0) ');
    disp('2. Ecuación Cuadrática (ax² + bx + c = 0)');
    disp('3. Sistema de Ecuaciones Lineales 2x2');
    disp('4. Ecuación Exponencial (a^x = b)');
    disp('5. Ecuación Logarítmica (log(x) = b)');
    disp('0. Salir');

    opcion = input('Seleccione una opción: ');

    switch opcion 
        case 1
            ecuacionLineal();
        case 2
            ecuacionCuadratica();
        case 3
            sistemasLineales();
        case 4
            ecuacionExponencial();
        case 5
            ecuacionLogaritmica();
        case 0
            disp('Gracias por usar el programa');
            continuar = false;
        otherwise
            disp('Opción no válida. Intenta nuevamente');
            pause(2);
        end
    end
end


