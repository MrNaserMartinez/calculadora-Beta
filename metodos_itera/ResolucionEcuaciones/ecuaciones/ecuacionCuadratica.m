function ecuacionCuadratica()
    clc;

    disp('=====ECUACIÓN CUADRÁTICA: ax² + bx + c = 0 =====');
    disp(' ');

    % Ingreso de coeficientes
    disp('Ingrese los ceoficientes; ');
    a = input('a = ');
    b = input('b = ');
    c = input('c = ');

    % Verificar si la función es cuadrática
    if a == 0
        disp('No es una ecuación cuadrática (a = 0)');
        return;
    end

    discriminante = b^2 - 4*a*c;

    disp(' ');
    fprintf('Discriminante: Δ = b² - 4ac = %.4f\n', discriminante);

    % Resuelve según el valor del discriminante
    if discriminante > 0
        disp('La ecuación tiene dosraíces reales diferentes');
        x1 = (-b + sqrt(discriminante)) / (2*a);
        x2 = (-b - sqrt(discriminante)) / (2*a);

        % Mostrar resultados
        disp(' ');
        disp('========== RESULTADOS ==========');
        fprintf('Ecuación: %.2fx² + %.2fx + %.2f = 0\n', a, b, c);
        fprintf('x₁ = %.4f\n', x1);
        fprintf('x₂ = %.4f\n', x2);
        
        % Verificación
        ver1 = a*x1^2 + b*x1 + c;
        ver2 = a*x2^2 + b*x2 + c;
        fprintf('\nVerificación:\n');
        fprintf('Para x₁: %.2f(%.4f)² + %.2f(%.4f) + %.2f = %.10f\n', a, x1, b, x1, c, ver1);
        fprintf('Para x₂: %.2f(%.4f)² + %.2f(%.4f) + %.2f = %.10f\n', a, x2, b, x2, c, ver2);

    elseif discriminante == 0
        disp('La ecuación tiene una raíz real doble:');
        x = -b / (2*a);

        % Mostrar resultados
        disp(' ');
        disp('========== RESULTADO ==========');
        fprintf('Ecuación: %.2fx² + %.2fx + %.2f = 0\n', a, b, c);
        fprintf('x = %.4f (raíz doble)\n', x);
        
        % Verificación
        ver = a*x^2 + b*x + c;
        fprintf('\nVerificación:\n');
        fprintf('%.2f(%.4f)² + %.2f(%.4f) + %.2f = %.10f\n', a, x, b, x, c, ver);

    else 
        disp('La ecuación tiene dos raíces complejas conjugadas');
        parteReal = -b / (2*a);
        parteImaginaria = sqrt(-discriminante) / (2*a);

        % Mostrar resultados
        disp(' ');
        disp('========== RESULTADOS ==========');
        fprintf('Ecuación: %.2fx² + %.2fx + %.2f = 0\n', a, b, c);
        fprintf('x₁ = %.4f + %.4fi\n', parteReal, parteImaginaria);
        fprintf('x₂ = %.4f - %.4fi\n', parteReal, parteImaginaria);
    end

    disp(' ');
    opcion = input('Desea ver el gráfico? (1=Sí, 0=No): ');

    if opcion == 1
        graficarEcuacion('cuadratica', a, b, c);
    end

    disp(' ');
    input('Presione Enter para continuar...');
end