function valores = pedir_datos(nombres_variables)

    valores = zeros(1, length(nombres_variables));
    
    for i = 1:length(nombres_variables)
        valores(i) = input(['Ingrese ' nombres_variables{i} ': ']);
    end
end