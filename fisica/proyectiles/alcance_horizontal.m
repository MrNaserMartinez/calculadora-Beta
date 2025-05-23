function alcance_horizontal()
% ALCANCE_HORIZONTAL Calcula el alcance horizontal de un proyectil
%   Utiliza la fórmula: R = (v0^2 * sin(2*θ)) / g

    clc;
    datos = pedir_datos({'velocidad inicial (m/s)', 'ángulo de lanzamiento (grados)', 'altura inicial (m)'});
    v0 = datos(1);
    angulo_grad = datos(2);
    h0 = datos(3);

    angulo = angulo_grad * pi / 180;
    
    g = 9.8; 
    
    if h0 == 0
        alcance = (v0^2 * sin(2*angulo)) / g;
    else
        v0x = v0 * cos(angulo);
        v0y = v0 * sin(angulo);
        
        % Tiempo de vuelo
        tiempo_vuelo = (v0y + sqrt(v0y^2 + 2*g*h0)) / g;
        
        % Alcance horizontal
        alcance = v0x * tiempo_vuelo;
    end
    
    mostrar_resultado('Alcance horizontal', alcance, 'm');
end