function ecuacionExponencial()
    clc;

    disp('===== ECUACIÓN EXPONENCIAL: a^x = b =====');
    disp(' ');

    disp('Ingrese los valores: ');
    a = input('a (base) = ');
    b = input('b (resultado) = ');

    % Verificar condiciones
    if a <= 0 || a == 1
        disp('Error: La base debe ser positiva y diferente de 1');
        return;
    end

    if b <= 0
        disp('Error: El resultado debe ser positivo');
        return;
    end

    % Resolver usando logaritmos
    x = log(b) / log(a);

     % Mostrar resultado
    disp(' ');
    disp('========== RESULTADO ==========');
    fprintf('Ecuación: %.2f^x = %.2f\n', a, b);
    fprintf('Solución: x = %.6f\n', x);
    
    % Verificación
    verificacion = a^x;
    fprintf('\nVerificación:\n');
    fprintf('%.2f^%.6f = %.6f ≈ %.2f\n', a, x, verificacion, b);
    
    % Método alternativo usando log10
    x_alt = log10(b) / log10(a);
    fprintf('\nMétodo alternativo (log₁₀):\n');
    fprintf('x = log₁₀(%.2f) / log₁₀(%.2f) = %.6f\n', b, a, x_alt);
    disp('==============================');
    
    % Preguntar si desea graficar
    disp(' ');
    opcion = input('¿Desea ver el gráfico? (1=Sí, 0=No): ');

    if opcion == 1
        graficarEcuacion('exponencial', a, b. x);
    end

    input('Presione Enter para continuar...');
end