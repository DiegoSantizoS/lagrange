clc; clear; close all; % Limpiar la consola, las variables y cerrar todas las figuras

%{
Función: lagrange_interp
Descripción: Realiza la interpolación de Lagrange para estimar el valor de una función en un punto dado.
Entradas:
- x_points: vector de puntos x conocidos
- y_points: vector de valores y correspondientes a x_points
- x: punto en el cual se desea interpolar
- valor_real: valor real de la función en x (para cálculo de error)
Salidas:
- y_interp: valor interpolado en x
- error: error porcentual relativo entre y_interp y valor_real
%}
function [y_interp, error] = lagrange_interp(x_points, y_points, x, valor_real)
    n = length(x_points) - 1; % Grado del polinomio (número de puntos - 1)
    y_interp = 0; % Inicializar el valor interpolado
    
    % Calcular el polinomio de Lagrange
    for i = 0:n
        L = 1; % Inicializar el producto para el término L_i(x)
        for j = 0:n
            if j ~= i
                % Calcular el producto para L_i(x)
                L = L * (x - x_points(j+1)) / (x_points(i+1) - x_points(j+1));
            end
        end
        % Acumular el término correspondiente en y_interp
        y_interp = y_interp + y_points(i+1) * L;
    end
    
    % Calcular el error porcentual relativo
    error = abs((y_interp - valor_real) / valor_real) * 100;
end

% Ejemplo 1: Puntos originales
x_points = [1, 4, 6]; % Puntos x conocidos
y_points = [0, 1.386294, 1.791759]; % ln(x) evaluado en x_points
[y1, error1] = lagrange_interp(x_points, y_points, 2, 0.6931472); % Interpolación en x=2
fprintf('Ejemplo 1: ln(2) ≈ %.4f, Error = %.1f%%\n', y1, error1);

% Ejemplo 2: Puntos cercanos
x_points = [1, 2, 3]; % Puntos x conocidos
y_points = [0, 0.6931472, 1.098612]; % ln(x) evaluado en x_points
[y2, error2] = lagrange_interp(x_points, y_points, 2, 0.6931472); % Interpolación en x=2
fprintf('Ejemplo 2: ln(2) ≈ %.4f, Error = %.1f%%\n', y2, error2);
