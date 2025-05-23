function inecuacion_cuadratica()
% INECUACION_CUADRATICA Resuelve inecuaciones cuadráticas de la forma ax² + bx + c < 0
%   Esta función solicita los coeficientes de una inecuación cuadrática y
%   muestra la solución, incluyendo la interpretación gráfica.
  clc;
    disp("=== RESOLUCIÓN DE INECUACIONES CUADRÁTICAS ===");
    disp("Forma general: ax² + bx + c < 0  (o >, ≤, ≥)");
    
    a = input("Ingrese el coeficiente a: ");
    b = input("Ingrese el coeficiente b: ");
    c = input("Ingrese el coeficiente c: ");
    
    disp("Seleccione el tipo de desigualdad:");
    disp("1. < (menor que)");
    disp("2. > (mayor que)");
    disp("3. <= (menor o igual que)");
    disp("4. >= (mayor o igual que)");
    
    tipo_desigualdad = input("Seleccione una opción (1-4): ");
    
    % Validar que 'a' no sea cero (sería una inecuación lineal, no cuadrática)
    if a == 0
        disp("Error: El coeficiente 'a' no puede ser cero.");
        disp("Sería una inecuación lineal, no cuadrática.");
        return;
    end
    
    discriminante = b^2 - 4*a*c;
    
    fprintf("\nPaso 1: Calcular el discriminante\n");
    fprintf("Δ = b² - 4ac = (%g)² - 4*(%g)*(%g) = %g\n", b, a, c, discriminante);
    
    fprintf("\nPaso 2: Analizar el número de raíces\n");
    if discriminante > 0
        % Dos raíces reales distintas
        x1 = (-b + sqrt(discriminante))/(2*a);
        x2 = (-b - sqrt(discriminante))/(2*a);
        
        % Ordenamos x1 < x2 para facilitar la interpretación
        if x1 > x2
            temp = x1;
            x1 = x2;
            x2 = temp;
        end
        
        fprintf("Como Δ > 0, la parábola tiene dos raíces reales:\n");
        fprintf("x₁ = %g y x₂ = %g\n", x1, x2);
        
        fprintf("\nPaso 3: Analizar el signo del coeficiente líder 'a'\n");
        if a > 0
            fprintf("Como a = %g > 0, la parábola abre hacia arriba.\n", a);
            fprintf("La expresión ax² + bx + c es negativa entre las raíces.\n");
            
            switch tipo_desigualdad
                case 1, fprintf("Para ax² + bx + c < 0: x ∈ (%g, %g)\n", x1, x2);
                    intervalo = sprintf("(%g, %g)", x1, x2);
                case 2, fprintf("Para ax² + bx + c > 0: x ∈ (-∞, %g) ∪ (%g, ∞)\n", x1, x2);
                    intervalo = sprintf("(-∞, %g) ∪ (%g, ∞)", x1, x2);
                case 3, fprintf("Para ax² + bx + c ≤ 0: x ∈ [%g, %g]\n", x1, x2);
                    intervalo = sprintf("[%g, %g]", x1, x2);
                case 4, fprintf("Para ax² + bx + c ≥ 0: x ∈ (-∞, %g] ∪ [%g, ∞)\n", x1, x2);
                    intervalo = sprintf("(-∞, %g] ∪ [%g, ∞)", x1, x2);
            end
        else
            fprintf("Como a = %g < 0, la parábola abre hacia abajo.\n", a);
            fprintf("La expresión ax² + bx + c es positiva entre las raíces.\n");
            
            switch tipo_desigualdad
                case 1, fprintf("Para ax² + bx + c < 0: x ∈ (-∞, %g) ∪ (%g, ∞)\n", x1, x2);
                    intervalo = sprintf("(-∞, %g) ∪ (%g, ∞)", x1, x2);
                case 2, fprintf("Para ax² + bx + c > 0: x ∈ (%g, %g)\n", x1, x2);
                    intervalo = sprintf("(%g, %g)", x1, x2);
                case 3, fprintf("Para ax² + bx + c ≤ 0: x ∈ (-∞, %g] ∪ [%g, ∞)\n", x1, x2);
                    intervalo = sprintf("(-∞, %g] ∪ [%g, ∞)", x1, x2);
                case 4, fprintf("Para ax² + bx + c ≥ 0: x ∈ [%g, %g]\n", x1, x2);
                    intervalo = sprintf("[%g, %g]", x1, x2);
            end
        end
    elseif discriminante == 0
        % Una raíz real (doble)
        x0 = -b/(2*a);
        
        fprintf("Como Δ = 0, la parábola tiene una raíz real doble:\n");
        fprintf("x₀ = %g\n", x0);
        
        fprintf("\nPaso 3: Analizar el signo del coeficiente líder 'a'\n");
        if a > 0
            fprintf("Como a = %g > 0, la parábola abre hacia arriba.\n", a);
            fprintf("La expresión ax² + bx + c es siempre ≥ 0 excepto en x = %g donde es 0.\n", x0);
            
            switch tipo_desigualdad
                case 1, fprintf("Para ax² + bx + c < 0: No hay solución (conjunto vacío)\n");
                    intervalo = "∅";
                case 2, fprintf("Para ax² + bx + c > 0: x ∈ (-∞, %g) ∪ (%g, ∞)\n", x0, x0);
                    intervalo = sprintf("(-∞, %g) ∪ (%g, ∞)", x0, x0);
                case 3, fprintf("Para ax² + bx + c ≤ 0: x = %g\n", x0);
                    intervalo = sprintf("{%g}", x0);
                case 4, fprintf("Para ax² + bx + c ≥ 0: x ∈ ℝ (todos los reales)\n");
                    intervalo = "ℝ";
            end
        else
            fprintf("Como a = %g < 0, la parábola abre hacia abajo.\n", a);
            fprintf("La expresión ax² + bx + c es siempre ≤ 0 excepto en x = %g donde es 0.\n", x0);
            
            switch tipo_desigualdad
                case 1, fprintf("Para ax² + bx + c < 0: x ∈ (-∞, %g) ∪ (%g, ∞)\n", x0, x0);
                    intervalo = sprintf("(-∞, %g) ∪ (%g, ∞)", x0, x0);
                case 2, fprintf("Para ax² + bx + c > 0: No hay solución (conjunto vacío)\n");
                    intervalo = "∅";
                case 3, fprintf("Para ax² + bx + c ≤ 0: x ∈ ℝ (todos los reales)\n");
                    intervalo = "ℝ";
                case 4, fprintf("Para ax² + bx + c ≥ 0: x = %g\n", x0);
                    intervalo = sprintf("{%g}", x0);
            end
        end
    else
        % No hay raíces reales
        fprintf("Como Δ < 0, la parábola no tiene raíces reales.\n");
        
        fprintf("\nPaso 3: Analizar el signo del coeficiente líder 'a'\n");
        if a > 0
            fprintf("Como a = %g > 0, la parábola abre hacia arriba.\n", a);
            fprintf("La expresión ax² + bx + c es siempre positiva.\n");
            
            switch tipo_desigualdad
                case 1, fprintf("Para ax² + bx + c < 0: No hay solución (conjunto vacío)\n");
                    intervalo = "∅";
                case 2, fprintf("Para ax² + bx + c > 0: x ∈ ℝ (todos los reales)\n");
                    intervalo = "ℝ";
                case 3, fprintf("Para ax² + bx + c ≤ 0: No hay solución (conjunto vacío)\n");
                    intervalo = "∅";
                case 4, fprintf("Para ax² + bx + c ≥ 0: x ∈ ℝ (todos los reales)\n");
                    intervalo = "ℝ";
            end
        else
            fprintf("Como a = %g < 0, la parábola abre hacia abajo.\n", a);
            fprintf("La expresión ax² + bx + c es siempre negativa.\n");
            
            switch tipo_desigualdad
                case 1, fprintf("Para ax² + bx + c < 0: x ∈ ℝ (todos los reales)\n");
                    intervalo = "ℝ";
                case 2, fprintf("Para ax² + bx + c > 0: No hay solución (conjunto vacío)\n");
                    intervalo = "∅";
                case 3, fprintf("Para ax² + bx + c ≤ 0: x ∈ ℝ (todos los reales)\n");
                    intervalo = "ℝ";
                case 4, fprintf("Para ax² + bx + c ≥ 0: No hay solución (conjunto vacío)\n");
                    intervalo = "∅";
            end
        end
    end
    

    fprintf("\nResumen:\n");
    
    signo = "";
    switch tipo_desigualdad
        case 1, signo = "<";
        case 2, signo = ">";
        case 3, signo = "≤";
        case 4, signo = "≥";
    end
    
    fprintf("La inecuación %gx² + %gx + %g %s 0 tiene como solución: x ∈ %s\n", a, b, c, signo, intervalo);
end