% filepath: c:\Users\mario\Desktop\Calculadora\integrales\mostrar_formulas_integracion.m
function mostrar_formulas_integracion()
% MOSTRAR_FORMULAS_INTEGRACION - Muestra fórmulas comunes de integración
%
% Esta función muestra una lista de integrales básicas y propiedades
% de la integración para referencia del usuario.

    % Limpiar pantalla y mostrar encabezado
    clc;
    disp('===================================================');
    disp('           FÓRMULAS DE INTEGRACIÓN                 ');
    disp('===================================================');
    disp(' ');
    
    disp('INTEGRALES BÁSICAS:');
    disp(' ');
    disp('∫ k dx = k·x + C                       (k constante)');
    disp('∫ x^n dx = x^(n+1)/(n+1) + C           (n ≠ -1)');
    disp('∫ 1/x dx = ln|x| + C');
    disp('∫ e^x dx = e^x + C');
    disp('∫ a^x dx = a^x/ln(a) + C               (a > 0, a ≠ 1)');
    disp('∫ sin(x) dx = -cos(x) + C');
    disp('∫ cos(x) dx = sin(x) + C');
    disp('∫ tan(x) dx = ln|sec(x)| + C = -ln|cos(x)| + C');
    disp('∫ sec(x) dx = ln|sec(x) + tan(x)| + C');
    disp('∫ csc(x) dx = ln|csc(x) - cot(x)| + C');
    disp('∫ cot(x) dx = ln|sin(x)| + C');
    disp('∫ 1/(a^2 + x^2) dx = (1/a)·arctan(x/a) + C');
    disp('∫ 1/√(a^2 - x^2) dx = arcsin(x/a) + C');
    disp('∫ 1/(a^2 - x^2) dx = (1/2a)·ln|(a+x)/(a-x)| + C');
    disp(' ');
    
    disp('PROPIEDADES BÁSICAS:');
    disp(' ');
    disp('∫ [f(x) + g(x)] dx = ∫ f(x) dx + ∫ g(x) dx');
    disp('∫ k·f(x) dx = k·∫ f(x) dx                 (k constante)');
    disp(' ');
    
    disp('INTEGRACIÓN POR PARTES:');
    disp(' ');
    disp('∫ u(x)·v\'(x) dx = u(x)·v(x) - ∫ u\'(x)·v(x) dx');
    disp(' ');
    
    disp('MÉTODOS NUMÉRICOS:');
    disp(' ');
    disp('Regla del trapecio:');
    disp('∫[a,b] f(x) dx ≈ (b-a)/2 · [f(a) + f(b)]');
    disp(' ');
    disp('Regla de Simpson:');
    disp('∫[a,b] f(x) dx ≈ (b-a)/6 · [f(a) + 4f((a+b)/2) + f(b)]');
    disp(' ');
    
    % Esperar a que el usuario presione una tecla
    input('Presione Enter para continuar...');
end