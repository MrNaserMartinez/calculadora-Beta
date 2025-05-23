function raices_multiples_gui()
    % Interfaz gráfica para el Método de Raíces Múltiples
    
    % Crear la figura principal
    fig = uifigure('Name', 'Método de Raíces Múltiples', ...
                   'Position', [100, 50, 1200, 800], ...
                   'Resize', 'off', ...
                   'Color', [0.95, 0.95, 0.95]);
    
    % Título principal
    titulo = uilabel(fig, 'Text', 'MÉTODO DE RAÍCES MÚLTIPLES', ...
                     'Position', [50, 740, 1100, 40], ...
                     'FontSize', 24, ...
                     'FontWeight', 'bold', ...
                     'HorizontalAlignment', 'center', ...
                     'BackgroundColor', [0.2, 0.5, 0.8], ...
                     'FontColor', 'white');
    
    % Subtítulo descriptivo
    subtitulo = uilabel(fig, 'Text', 'Método numérico para encontrar raíces de multiplicidad mayor a 1', ...
                        'Position', [50, 710, 1100, 25], ...
                        'FontSize', 12, ...
                        'HorizontalAlignment', 'center', ...
                        'FontColor', [0.3, 0.3, 0.3]);
    
    % Panel de entrada de datos
    panel_entrada = uipanel(fig, 'Title', 'PARÁMETROS DE ENTRADA', ...
                            'Position', [30, 550, 350, 150], ...
                            'FontSize', 12, ...
                            'FontWeight', 'bold', ...
                            'BackgroundColor', [0.98, 0.98, 1]);
    
    % Campos de entrada
    uilabel(panel_entrada, 'Text', 'Función f(x):', ...
            'Position', [15, 100, 80, 22], ...
            'FontWeight', 'bold');
    
    campo_funcion = uieditfield(panel_entrada, 'text', ...
                                'Position', [100, 100, 220, 22], ...
                                'Value', 'x^3 - 6*x^2 + 12*x - 8', ...
                                'Placeholder', 'Ej: x^3 - 6*x^2 + 12*x - 8');
    
    uilabel(panel_entrada, 'Text', 'x₀ inicial:', ...
            'Position', [15, 70, 80, 22], ...
            'FontWeight', 'bold');
    
    campo_x0 = uieditfield(panel_entrada, 'numeric', ...
                           'Position', [100, 70, 80, 22], ...
                           'Value', 2);
    
    uilabel(panel_entrada, 'Text', 'Tolerancia:', ...
            'Position', [15, 40, 80, 22], ...
            'FontWeight', 'bold');
    
    campo_tol = uieditfield(panel_entrada, 'numeric', ...
                            'Position', [100, 40, 80, 22], ...
                            'Value', 1e-6, ...
                            'ValueDisplayFormat', '%.1e');
    
    uilabel(panel_entrada, 'Text', 'Max. iter:', ...
            'Position', [200, 70, 70, 22], ...
            'FontWeight', 'bold');
    
    campo_max_iter = uieditfield(panel_entrada, 'numeric', ...
                                 'Position', [270, 70, 50, 22], ...
                                 'Value', 100);
    
    % Panel de información de derivadas
    panel_derivadas = uipanel(fig, 'Title', 'DERIVADAS CALCULADAS', ...
                              'Position', [400, 550, 380, 150], ...
                              'FontSize', 12, ...
                              'FontWeight', 'bold', ...
                              'BackgroundColor', [0.98, 1, 0.98]);
    
    texto_derivadas = uitextarea(panel_derivadas, ...
                                 'Position', [10, 10, 360, 110], ...
                                 'Editable', 'off', ...
                                 'FontSize', 10, ...
                                 'Value', {'f''(x) = Ingrese una función primero', ...
                                          'f''''(x) = Ingrese una función primero'});
    
    % Panel de control
    panel_control = uipanel(fig, 'Title', 'CONTROLES', ...
                            'Position', [800, 550, 370, 150], ...
                            'FontSize', 12, ...
                            'FontWeight', 'bold', ...
                            'BackgroundColor', [1, 0.98, 0.98]);
    
    % Botones de control
    btn_calcular = uibutton(panel_control, 'Text', 'CALCULAR RAÍCES', ...
                            'Position', [20, 80, 150, 35], ...
                            'FontSize', 12, ...
                            'FontWeight', 'bold', ...
                            'BackgroundColor', [0.2, 0.7, 0.2], ...
                            'FontColor', 'white', ...
                            'ButtonPushedFcn', @calcular_raices);
    
    btn_graficar = uibutton(panel_control, 'Text', 'GRAFICAR', ...
                            'Position', [190, 80, 150, 35], ...
                            'FontSize', 12, ...
                            'FontWeight', 'bold', ...
                            'BackgroundColor', [0.8, 0.4, 0.2], ...
                            'FontColor', 'white', ...
                            'ButtonPushedFcn', @graficar_funcion);
    
    btn_ejemplo = uibutton(panel_control, 'Text', 'CARGAR EJEMPLO', ...
                           'Position', [20, 40, 150, 30], ...
                           'FontSize', 10, ...
                           'BackgroundColor', [0.5, 0.5, 0.8], ...
                           'FontColor', 'white', ...
                           'ButtonPushedFcn', @cargar_ejemplo);
    
    btn_limpiar = uibutton(panel_control, 'Text', 'LIMPIAR', ...
                           'Position', [190, 40, 150, 30], ...
                           'FontSize', 10, ...
                           'BackgroundColor', [0.7, 0.7, 0.7], ...
                           'FontColor', 'white', ...
                           'ButtonPushedFcn', @limpiar_resultados);
    
    % Tabla de iteraciones
    panel_tabla = uipanel(fig, 'Title', 'TABLA DE ITERACIONES', ...
                          'Position', [30, 280, 550, 260], ...
                          'FontSize', 12, ...
                          'FontWeight', 'bold', ...
                          'BackgroundColor', [0.99, 0.99, 0.99]);
    
    tabla_iteraciones = uitable(panel_tabla, ...
                                'Position', [10, 10, 530, 220], ...
                                'ColumnName', {'Iteración', 'x_n', 'f(x_n)', 'Error'}, ...
                                'ColumnWidth', {80, 120, 120, 120}, ...
                                'RowName', {}, ...
                                'Data', {});
    
    % Panel de gráfica
    panel_grafica = uipanel(fig, 'Title', 'GRÁFICA DE LA FUNCIÓN', ...
                            'Position', [600, 280, 570, 260], ...
                            'FontSize', 12, ...
                            'FontWeight', 'bold', ...
                            'BackgroundColor', [0.99, 0.99, 0.99]);
    
    axes_grafica = uiaxes(panel_grafica, ...
                          'Position', [20, 20, 530, 200]);
    
    % Panel de resultados
    panel_resultados = uipanel(fig, 'Title', 'RESULTADOS FINALES', ...
                               'Position', [30, 50, 1140, 220], ...
                               'FontSize', 12, ...
                               'FontWeight', 'bold', ...
                               'BackgroundColor', [0.98, 0.98, 0.98]);
    
    texto_resultados = uitextarea(panel_resultados, ...
                                  'Position', [20, 20, 1100, 170], ...
                                  'Editable', 'off', ...
                                  'FontSize', 11, ...
                                  'Value', {'=== MÉTODO DE RAÍCES MÚLTIPLES ===', ...
                                           '', ...
                                           'Este método es especialmente útil para encontrar raíces de multiplicidad mayor a 1.', ...
                                           'La fórmula utilizada es: x_{n+1} = x_n - [f(x_n) * f''(x_n)] / [f''(x_n)² - f(x_n) * f''''(x_n)]', ...
                                           '', ...
                                           'Ingrese los parámetros y presione "CALCULAR RAÍCES" para comenzar.'});
    
    % Variables globales para almacenar resultados
    resultados_iter = {};
    raiz_encontrada = [];
    funcion_actual = [];
    
    % Función para cargar ejemplo
    function cargar_ejemplo(~, ~)
        campo_funcion.Value = 'x^3 - 6*x^2 + 12*x - 8';
        campo_x0.Value = 2;
        campo_tol.Value = 1e-6;
        campo_max_iter.Value = 100;
        calcular_derivadas();
        
        texto_resultados.Value = {'=== EJEMPLO CARGADO ===', ...
                                 '', ...
                                 'Función: f(x) = x³ - 6x² + 12x - 8', ...
                                 'Esta función tiene una raíz triple en x = 2', ...
                                 'Aproximación inicial: x₀ = 2', ...
                                 'Tolerancia: 1×10⁻⁶', ...
                                 '', ...
                                 'Presione "CALCULAR RAÍCES" para ejecutar el método.'};
    end
    
    % Función para calcular y mostrar derivadas
    function calcular_derivadas()
        try
            syms x;
            f_str = campo_funcion.Value;
            f = str2sym(f_str);
            f1 = diff(f, x);
            f2 = diff(f1, x);
            
            texto_derivadas.Value = {['f''(x) = ' char(f1)], ...
                                    ['f''''(x) = ' char(f2)]};
        catch
            texto_derivadas.Value = {'Error al calcular derivadas', ...
                                    'Verifique la sintaxis de la función'};
        end
    end
    
    % Función principal de cálculo
    function calcular_raices(~, ~)
        try
            % Limpiar resultados anteriores
            tabla_iteraciones.Data = {};
            cla(axes_grafica);
            
            % Obtener parámetros
            f_str = campo_funcion.Value;
            x0 = campo_x0.Value;
            tol = campo_tol.Value;
            max_iter = campo_max_iter.Value;
            
            % Crear función simbólica y derivadas
            syms x;
            f = str2sym(f_str);
            f1 = diff(f, x);
            f2 = diff(f1, x);
            
            % Actualizar derivadas en la interfaz
            texto_derivadas.Value = {['f''(x) = ' char(f1)], ...
                                    ['f''''(x) = ' char(f2)]};
            
            % Convertir a funciones numéricas
            f_fun = matlabFunction(f);
            f1_fun = matlabFunction(f1);
            f2_fun = matlabFunction(f2);
            
            % Guardar función para graficar
            funcion_actual = f_fun;
            
            % Inicialización
            iter = 0;
            error_actual = 1;
            datos_tabla = {};
            
            texto_resultados.Value = {'=== EJECUTANDO MÉTODO DE RAÍCES MÚLTIPLES ===', ...
                                     '', ...
                                     ['Función: f(x) = ' f_str], ...
                                     ['Aproximación inicial: x₀ = ' num2str(x0)], ...
                                     ['Tolerancia: ' num2str(tol)], ...
                                     '', ...
                                     'Calculando iteraciones...'};
            drawnow;
            
            % Algoritmo de raíces múltiples
            while error_actual > tol && iter < max_iter
                fx = f_fun(x0);
                
                % Verificación anticipada: f(x) ≈ 0
                if abs(fx) < tol
                    datos_tabla{end+1, 1} = iter;
                    datos_tabla{end, 2} = sprintf('%.8f', x0);
                    datos_tabla{end, 3} = sprintf('%.2e', fx);
                    datos_tabla{end, 4} = sprintf('%.2e', 0);
                    
                    raiz_encontrada = x0;
                    
                    texto_resultados.Value = {'=== ¡RAÍZ ENCONTRADA! ===', ...
                                             '', ...
                                             '✓ Convergencia por f(x) ≈ 0', ...
                                             ['✓ Raíz: x = ' sprintf('%.10f', x0)], ...
                                             ['✓ f(x) = ' sprintf('%.2e', fx)], ...
                                             ['✓ Iteraciones: ' num2str(iter)], ...
                                             '', ...
                                             'El método convergió exitosamente.'};
                    break;
                end
                
                f1x = f1_fun(x0);
                f2x = f2_fun(x0);
                den = f1x^2 - fx * f2x;
                
                if abs(den) < 1e-12
                    texto_resultados.Value = {'=== ADVERTENCIA ===', ...
                                             '', ...
                                             '⚠️ Denominador muy pequeño: posible división por cero', ...
                                             ['⚠️ Último x_n válido: ' sprintf('%.10f', x0)], ...
                                             ['⚠️ Iteraciones completadas: ' num2str(iter)], ...
                                             '', ...
                                             'El método no pudo continuar debido a problemas numéricos.'};
                    break;
                end
                
                x1 = x0 - (fx * f1x) / den;
                error_actual = abs(x1 - x0);
                
                % Agregar datos a la tabla
                datos_tabla{end+1, 1} = iter;
                datos_tabla{end, 2} = sprintf('%.8f', x0);
                datos_tabla{end, 3} = sprintf('%.2e', fx);
                datos_tabla{end, 4} = sprintf('%.2e', error_actual);
                
                x0 = x1;
                iter = iter + 1;
            end
            
            % Verificar convergencia por error
            if error_actual <= tol && iter > 0
                raiz_encontrada = x0;
                texto_resultados.Value = {'=== ¡RAÍZ ENCONTRADA! ===', ...
                                         '', ...
                                         '✓ Convergencia por tolerancia alcanzada', ...
                                         ['✓ Raíz: x = ' sprintf('%.10f', x0)], ...
                                         ['✓ f(x) = ' sprintf('%.2e', f_fun(x0))], ...
                                         ['✓ Error final: ' sprintf('%.2e', error_actual)], ...
                                         ['✓ Iteraciones: ' num2str(iter)], ...
                                         '', ...
                                         'El método convergió exitosamente.'};
            elseif iter >= max_iter
                texto_resultados.Value = {'=== MÁXIMO DE ITERACIONES ALCANZADO ===', ...
                                         '', ...
                                         '⚠️ No se alcanzó la convergencia deseada', ...
                                         ['⚠️ Última aproximación: x = ' sprintf('%.10f', x0)], ...
                                         ['⚠️ Error final: ' sprintf('%.2e', error_actual)], ...
                                         ['⚠️ Iteraciones: ' num2str(iter)], ...
                                         '', ...
                                         'Considere aumentar el número máximo de iteraciones.'};
            end
            
            % Actualizar tabla
            tabla_iteraciones.Data = datos_tabla;
            
            % Graficar automáticamente
            graficar_funcion();
            
        catch e
            texto_resultados.Value = {'=== ERROR EN EL CÁLCULO ===', ...
                                     '', ...
                                     ['❌ ' e.message], ...
                                     '', ...
                                     'Posibles causas:', ...
                                     '• Sintaxis incorrecta en la función', ...
                                     '• Función no evaluable en el punto inicial', ...
                                     '• Parámetros inválidos', ...
                                     '', ...
                                     'Verifique los datos de entrada.'};
        end
    end
    
    % Función para graficar
    function graficar_funcion(~, ~)
        if isempty(funcion_actual)
            try
                syms x;
                f = str2sym(campo_funcion.Value);
                funcion_actual = matlabFunction(f);
            catch
                return;
            end
        end
        
        try
            x0_val = campo_x0.Value;
            x_range = [x0_val - 3, x0_val + 3];
            
            % Graficar función
            fplot(axes_grafica, funcion_actual, x_range, 'LineWidth', 2, 'Color', [0.2, 0.4, 0.8]);
            hold(axes_grafica, 'on');
            
            % Línea en y = 0
            plot(axes_grafica, x_range, [0, 0], '--k', 'LineWidth', 1);
            
            % Marcar raíz si existe
            if ~isempty(raiz_encontrada)
                plot(axes_grafica, raiz_encontrada, funcion_actual(raiz_encontrada), ...
                     'ro', 'MarkerSize', 10, 'LineWidth', 3);
                
                % Etiqueta de la raíz
                text(axes_grafica, raiz_encontrada, funcion_actual(raiz_encontrada) + 0.1, ...
                     sprintf('Raíz: %.4f', raiz_encontrada), ...
                     'FontSize', 10, 'FontWeight', 'bold', ...
                     'HorizontalAlignment', 'center');
            end
            
            % Marcar punto inicial
            plot(axes_grafica, x0_val, funcion_actual(x0_val), ...
                 'go', 'MarkerSize', 8, 'LineWidth', 2);
            
            grid(axes_grafica, 'on');
            title(axes_grafica, 'Función f(x) y Raíz Encontrada');
            xlabel(axes_grafica, 'x');
            ylabel(axes_grafica, 'f(x)');
            
            if ~isempty(raiz_encontrada)
                legend(axes_grafica, {'f(x)', 'y = 0', 'Raíz encontrada', 'Punto inicial'}, ...
                       'Location', 'best');
            else
                legend(axes_grafica, {'f(x)', 'y = 0', 'Punto inicial'}, ...
                       'Location', 'best');
            end
            
            hold(axes_grafica, 'off');
            
        catch
            texto_resultados.Value = [texto_resultados.Value; {''; '⚠️ Error al generar la gráfica'}];
        end
    end
    
    % Función para limpiar resultados
    function limpiar_resultados(~, ~)
        tabla_iteraciones.Data = {};
        cla(axes_grafica);
        texto_resultados.Value = {'=== RESULTADOS LIMPIADOS ===', ...
                                 '', ...
                                 'Sistema listo para nuevos cálculos.', ...
                                 'Ingrese los parámetros y presione "CALCULAR RAÍCES".'};
        raiz_encontrada = [];
        funcion_actual = [];
    end
    
    % Callback para actualizar derivadas cuando cambie la función
    campo_funcion.ValueChangedFcn = @(~,~) calcular_derivadas();
    
    % Inicializar con ejemplo
    calcular_derivadas();
end