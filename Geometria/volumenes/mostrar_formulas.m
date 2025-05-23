% filepath: c:\Users\mario\Desktop\Calculadora\volumenes\mostrar_formulas.m
function mostrar_formulas()
% MOSTRAR_FORMULAS - Muestra una tabla con las fórmulas de volumen
% de diferentes figuras geométricas

    clc;
    disp('===================================================');
    disp('            FÓRMULAS DE VOLUMEN                    ');
    disp('===================================================');
    disp(' ');
    disp('1. CUBO:');
    disp('   V = lado³');
    disp(' ');
    disp('2. PRISMA RECTANGULAR (Paralelepípedo):');
    disp('   V = largo × ancho × altura');
    disp(' ');
    disp('3. CILINDRO:');
    disp('   V = π × radio² × altura');
    disp(' ');
    disp('4. CONO:');
    disp('   V = (1/3) × π × radio² × altura');
    disp(' ');
    disp('5. ESFERA:');
    disp('   V = (4/3) × π × radio³');
    disp(' ');
    disp('6. PIRÁMIDE:');
    disp('   V = (1/3) × área_base × altura');
    disp(' ');
    disp('7. TRONCO DE CONO:');
    disp('   V = (1/3) × π × altura × (R² + R×r + r²)');
    disp('   donde R es el radio de la base mayor y r el de la menor');
    disp(' ');
    disp('8. PRISMA TRIANGULAR:');
    disp('   V = área_base_triangular × altura');
    disp('   V = (1/2) × base_triángulo × altura_triángulo × longitud_prisma');
    disp(' ');
    disp('9. TETRAEDRO REGULAR:');
    disp('   V = (√2/12) × lado³');
    disp(' ');
    disp('10. TORO (TOROIDE):');
    disp('    V = 2π² × R × r²');
    disp('    donde R es la distancia del centro del toroide al centro del tubo');
    disp('    y r es el radio del tubo');
    disp(' ');
    disp('===================================================');
    
    % Esperar a que el usuario presione una tecla
    input('Presione Enter para volver al menú de volúmenes...');
end