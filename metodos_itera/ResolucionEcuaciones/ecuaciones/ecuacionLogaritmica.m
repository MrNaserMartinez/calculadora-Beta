function ecuacionLogaritmica()
    % Limpiar pantalla
    clc;
    
    % Título
    disp('===== ECUACIÓN LOGARÍTMICA: log_a(x) = b =====');
    disp(' ');
    
    % Solicitar valores al usuario
    disp('Ingrese los valores:');
    a = input('a (base del logaritmo) = ');
    b = input('b (resultado) = ');
    
    % Verificar condiciones
    if a <= 0 || a == 1
        disp('Error: La base debe ser positiva y diferente de 1');
        return;
    end

     % Resolver usando la definición de logaritmo
     x = a^b;

      % Mostrar resultado
    disp(' ');
    disp('========== RESULTADO ==========');
    fprintf('Ecuación: log₍%.2f₎(x) = %.2f\n', a, b);
    fprintf('Solución: x = %.6f\n', x);
    
    % Verificación
    verificacion = log(x) / log(a);
    fprintf('\nVerificación:\n');
    fprintf('log₍%.2f₎(%.6f) = %.6f ≈ %.2f\n', a, x, verificacion, b);
    
    % Casos especiales
    disp(' ');
    disp('Casos especiales:');
    if a == 10
        fprintf('log₁₀(%.6f) = %.6f\n', x, log10(x));
    elseif abs(a - exp(1)) < 1e-10
        fprintf('ln(%.6f) = %.6f\n', x, log(x));
    end
    disp('==============================');
    
    % Preguntar si desea graficar
    disp(' ');
    opcion = input('¿Desea ver el gráfico? (1=Sí, 0=No): ');
    
    if opcion == 1
        % Llamar función de gráficos
        graficarEcuacion('logaritmica', a, b, x);
    end

    input('Presione Enter para continuar...');
end