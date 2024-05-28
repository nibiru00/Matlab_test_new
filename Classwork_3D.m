% Параметры
u = linspace(0, 2*pi, 100);
v = linspace(0, 2*pi, 100);
[U, V] = meshgrid(u, v);

% Координаты для бутылки Клейна
X = (1 + cos(U/2) .* sin(V) - sin(U/2) .* sin(2*V)) .* cos(U);
Y = (1 + cos(U/2) .* sin(V) - sin(U/2) .* sin(2*V)) .* sin(U);
Z = sin(U/2) .* sin(V) + cos(U/2) .* sin(2*V);

% Построение графика
figure;
colormap cool;
surf(X, Y, Z, 'FaceColor', 'flat', 'EdgeColor', 'none');
camlight headlight;
lighting phong;
axis equal;
title('Бутылка Клейна');
