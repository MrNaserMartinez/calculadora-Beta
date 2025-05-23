function resultado = raiz_cuadrada(numero)
% RAIZ_CUADRADA Calcula la raíz cuadrada de un número
%   resultado = raiz_cuadrada(numero) calcula la raíz cuadrada del número
%   proporcionado. Si el número es negativo, devuelve un número complejo.

    if numero < 0
        resultado = complex(0, sqrt(abs(numero)));
        disp("Nota: La raíz de un número negativo es un número complejo.");
    else
        resultado = sqrt(numero);
    end
end