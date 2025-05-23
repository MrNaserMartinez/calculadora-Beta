% tercera_ley_newton.m
% Simulación interactiva de la Tercera Ley de Newton

clc;
clear;

fprintf('TERCERA LEY DE NEWTON: Acción y Reacción\n');
fprintf('----------------------------------------\n');

% Masa de cuerpo A (quien ejerce la acción)
mA = input('Ingresa la masa del cuerpo A (kg): ');
while mA <= 0
    fprintf('Error: La masa debe ser mayor que 0.\n');
    mA = input('Por favor, ingresa una masa válida para A (kg): ');
end

% Masa de cuerpo B (quien recibe la acción)
mB = input('Ingresa la masa del cuerpo B (kg): ');
while mB <= 0
    fprintf('Error: La masa debe ser mayor que 0.\n');
    mB = input('Por favor, ingresa una masa válida para B (kg): ');
end

% Magnitud de la fuerza de acción
F_accion = input('Ingresa la magnitud de la fuerza de acción que A ejerce sobre B (N): ');
while F_accion <= 0
    fprintf('Error: La fuerza debe ser mayor que 0.\n');
    F_accion = input('Por favor, ingresa una fuerza válida (N): ');
end

% Reacción de B sobre A (misma magnitud, sentido opuesto)
F_reaccion = -F_accion;

% Aceleraciones resultantes (segunda ley de Newton)
aB = F_accion / mB;         % aceleración de B
aA = F_reaccion / mA;       % aceleración de A (negativa)

% Mostrar resultados
fprintf('\nRESULTADOS:\n');
fprintf('Fuerza de acción:     %.2f N (A sobre B)\n', F_accion);
fprintf('Fuerza de reacción:   %.2f N (B sobre A)\n', F_reaccion);
fprintf('Aceleración de B:     %.2f m/s²\n', aB);
fprintf('Aceleración de A:     %.2f m/s² (en sentido opuesto)\n', aA);

% Representar gráficamente las fuerzas y aceleraciones
figure;
subplot(1,2,1);
quiver(0, 0, F_accion, 0, 'r', 'LineWidth', 2, 'MaxHeadSize', 1.5); hold on;
quiver(0, 0, F_reaccion, 0, 'b', 'LineWidth', 2, 'MaxHeadSize', 1.5);
xlim([-1.2*F_accion, 1.2*F_accion]);
ylim([-1, 1]);
axis equal;
grid on;
title('Fuerzas: Acción y Reacción');
legend('Acción (A sobre B)', 'Reacción (B sobre A)');

subplot(1,2,2);
bar([aA, aB]);
set(gca, 'XTickLabel', {'aA (cuerpo A)', 'aB (cuerpo B)'});
ylabel('Aceleración (m/s²)');
title('Aceleraciones resultantes');
grid on;