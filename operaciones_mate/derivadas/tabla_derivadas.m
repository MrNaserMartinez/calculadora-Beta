% filepath: c:\Users\mario\Desktop\Calculadora\derivadas\tabla_derivadas.m
function tabla_derivadas()
% TABLA_DERIVADAS - Muestra una tabla de fórmulas comunes de derivadas
    
    clc;
    disp('===================================================');
    disp('          TABLA DE DERIVADAS COMUNES               ');
    disp('===================================================');
    disp(' ');
    disp('FÓRMULAS BÁSICAS:');
    disp('1. d/dx[c] = 0                           (c es constante)');
    disp('2. d/dx[x^n] = n·x^(n-1)                 (n es cualquier número real)');
    disp('3. d/dx[e^x] = e^x');
    disp('4. d/dx[ln(x)] = 1/x                     (x > 0)');
    disp('5. d/dx[sin(x)] = cos(x)');
    disp('6. d/dx[cos(x)] = -sin(x)');
    disp('7. d/dx[tan(x)] = sec^2(x)');
    disp(' ');
    disp('REGLAS DE OPERACIÓN:');
    disp('8.  d/dx[f(x) + g(x)] = f''(x) + g''(x)');
    disp('9.  d/dx[f(x) - g(x)] = f''(x) - g''(x)');
    disp('10. d/dx[c·f(x)] = c·f''(x)               (c es constante)');
    disp('11. d/dx[f(x)·g(x)] = f(x)·g''(x) + g(x)·f''(x)   (Regla del producto)');
    disp('12. d/dx[f(x)/g(x)] = [g(x)·f''(x) - f(x)·g''(x)]/[g(x)]^2   (Regla del cociente)');
    disp('13. d/dx[f(g(x))] = f''(g(x))·g''(x)       (Regla de la cadena)');
    disp(' ');
    disp('DERIVADAS TRIGONOMÉTRICAS:');
    disp('14. d/dx[sec(x)] = sec(x)·tan(x)');
    disp('15. d/dx[csc(x)] = -csc(x)·cot(x)');
    disp('16. d/dx[cot(x)] = -csc^2(x)');
    disp('17. d/dx[arcsin(x)] = 1/sqrt(1-x^2)       (|x| < 1)');
    disp('18. d/dx[arccos(x)] = -1/sqrt(1-x^2)      (|x| < 1)');
    disp('19. d/dx[arctan(x)] = 1/(1+x^2)');
    disp(' ');
    disp('DERIVADAS LOGARÍTMICAS Y EXPONENCIALES:');
    disp('20. d/dx[log_a(x)] = 1/(x·ln(a))          (x > 0, a > 0, a ≠ 1)');
    disp('21. d/dx[a^x] = a^x·ln(a)                 (a > 0)');
    disp(' ');
    
    % Opciones adicionales
    disp('Opciones:');
    disp('1. Volver al menú de derivadas');
    disp('2. Volver al menú principal');
    
    opcion = input('Opción: ');
    
    switch opcion
        case 1
            calcular_derivada();
        case 2
            % Volver al menú principal
            return;
        otherwise
            disp('Opción no válida.');
            input('Presione Enter para continuar...');
            tabla_derivadas();
    end
end