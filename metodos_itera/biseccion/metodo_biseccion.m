function [raiz, iteraciones, error_est] = metodo_biseccion(func, a, b, tol, max_iter)

% METODO_BISECCION - Implementa el método de bisección para encontrar raíces

% Manejo de argumentos opcionales

%Nargin es una variable predefinida de Matlab que indica el numero de
%argumentos de entrada proporcionados a la funcion 

%tol== Tolerancia 
if nargin < 4, tol = 1e-6; end
                                    %5 y 4 son datos preventivos por si el   usuario no ingresa la tolerancia ni las interaciones 
                                   
%max_iter== Maximo de Iteraciones
if nargin < 5, max_iter = 100; end



%Almacena el valor de la funcon a evaluar en los puntos a y b 

%Limite Inferior
fa = func(a);

%Limite Superior
fb = func(b);
%FUNC es la funcion cuya rauz se busca 

% Si la operacion entre a y b es mayor a 0 nose puede aplicar el metodo
if fa * fb > 0
    error('El intervalo [%f, %f] no tiene cambio de signo. El método de bisección no se puede aplicar, requiere f(a)*f(b) < 0', a, b);
end

% Inicialización
iter = 0;  %Se iniciar el contador de iteraciones en 0
error_est = abs(b - a); %Calcula el error inicial 
valores_x = []; %Se crea un arreglo vacio para almacenar los valores x en cada interacion
valores_error = []; % Crea un arreglo vacío para almacenar los errores en cada iteración

% Iteraciones del método
while error_est > tol && iter < max_iter %Sirve para que continue interando mientras el error sea mayor que la tolerancia y nose exceda
   
    c = (a + b) / 2; %Calcula el punto medio de intervalo actual 
    fc = func(c); % Evalua la funcone en punto medio
    
    % Guardar valores para seguimiento

    iter = iter + 1; %Incrimenta el contador de iteraciones
    valores_x(iter) = c;  %Guarda el valor actual de x en el historial
    error_est = abs(b - a) / 2; %Calcula el nuevo error estimado 
    valores_error(iter) = error_est; %Guarda el error actual en el historial 
    

    % Si f(c) es aproximadamente cero, hemos encontrado la raíz
    if abs(fc) < eps %Comprueba si el valor absoluto de la funcion en el punto medio
        break;
    end
    
    % Actualizar intervalo [a, b], se divide a la mitad para saber en que lado de que lado esta la raiz
  
    if fa * fc < 0
        b = c;
        fb = fc;
    else
        a = c;
        fa = fc;
    end
end

% Resultado final 
raiz = c; %Muetra el punto medio del intervalo 
iteraciones = iter; %Indica en que parte del intervalo se encuentro la raiz 

% Imprimir resultados
fprintf('\nMétodo de Bisección - Resultados:\n');
fprintf('Raíz aproximada: %.10f\n', raiz);
fprintf('Valor de f(raiz): %.10e\n', func(raiz));
fprintf('Iteraciones realizadas: %d\n', iteraciones);
fprintf('Error estimado: %.10e\n', error_est);

% Crear tabla para mostrar todas las iteraciones que se hicieron para  buscar las raiz 
if nargout < 1 || nargout == 0
    fprintf('\nTabla de Iteraciones:\n');
    fprintf('%-8s %-15s %-15s\n', 'Iter', 'Aprox. Raíz', 'Error Est.');
    for i = 1:iter
        fprintf('%-8d %-15.8f %-15.8e\n', i, valores_x(i), valores_error(i));
    end
end

end