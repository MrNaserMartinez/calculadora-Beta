% filepath: c:\Users\mario\Desktop\Calculadora\limites\tabla_limites.m
function tabla_limites()
% TABLA_LIMITES - Muestra una tabla de límites notables como referencia
    
    clc;
    disp('===================================================');
    disp('          TABLA DE LÍMITES NOTABLES                ');
    disp('===================================================');
    disp(' ');
    disp('LÍMITES ALGEBRAICOS:');
    disp('1. lim[x→a] c = c                                 (c es constante)');
    disp('2. lim[x→a] x = a');
    disp('3. lim[x→a] x^n = a^n                             (n es cualquier número real)');
    disp(' ');
    disp('LÍMITES TRIGONOMÉTRICOS:');
    disp('4. lim[x→0] sin(x)/x = 1');
    disp('5. lim[x→0] (1-cos(x))/x = 0');
    disp('6. lim[x→0] (1-cos(x))/x^2 = 1/2');
    disp('7. lim[x→0] tan(x)/x = 1');
    disp(' ');
    disp('LÍMITES EXPONENCIALES Y LOGARÍTMICOS:');
    disp('8.  lim[x→0] (e^x - 1)/x = 1');
    disp('9.  lim[x→0] (a^x - 1)/x = ln(a)                  (a > 0)');
    disp('10. lim[x→0] ln(1+x)/x = 1');
    disp('11. lim[x→∞] (1 + 1/x)^x = e                      (Número e)');
    disp(' ');
    disp('LÍMITES DE INDETERMINACIONES:');
    disp('12. lim[x→a] [f(x)/g(x)] = lim[x→a] [f''(x)/g''(x)]  (Regla de L''Hôpital para 0/0 o ∞/∞)');
    disp(' ');
    disp('LÍMITES NOTABLES CON INFINITO:');
    disp('13. lim[x→∞] P(x)/Q(x) = 0                        (grado P < grado Q)');
    disp('14. lim[x→∞] P(x)/Q(x) = an/bm                    (grado P = grado Q, an y bm coeficientes principales)');
    disp('15. lim[x→∞] P(x)/Q(x) = ∞                        (grado P > grado Q)');
    disp(' ');
    
    % Opciones adicionales
    disp('Opciones:');
    disp('1. Volver al menú de límites');
    disp('2. Volver al menú principal');
    
    opcion = input('Opción: ');
    
    switch opcion
        case 1
            calcular_limite();
        case 2
            % Volver al menú principal
            return;
        otherwise
            disp('Opción no válida.');
            input('Presione Enter para continuar...');
            tabla_limites();
    end
end