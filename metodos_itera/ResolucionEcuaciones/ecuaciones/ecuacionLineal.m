function ecuacionLineal()
    clc;

    disp('=====ECUACIÓN LINEAL: ax + b = 0 =====');
    disp(' ');

    % Solicitar coeficientes
    disp('Ingrese los ceoficientes:');
    a = input('a = ');
    b = input('b = ');

    % Verificar si la ecuación tiene solución
    if a == 0
        if b == 0
            disp('La ecuación tiene infinitas soluciones (0x = 0)');
        else 
            disp('La ecuación no tiene solución (0x = número)');
        end
    else
       % Calcular la solución
       x = -b/a;

       disp(' ');
       disp('=====RESULTADO=====');
       fprintf('Ecuación: %.2fx + %.2f = 0/n', a, x, b, verificacion);
    end

    % Desea graficar?
    disp(' ');
    opcion = input('Desea ver el gráfico? (1=Sí, 0=No): ');

    if opcion == 1
        graficarEcuacion('lineal', a, b);
    end

    disp('');
    input('Presione Enter para continuar...');
end