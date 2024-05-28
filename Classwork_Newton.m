clear
% Полином z^3 - 1 и его производная
p = [1 0 0 -1];
a = roots(p);
f = @(z) z.^3 - 1;
f_ = @(z) 3 * z.^2;

okrug = 10^(-8);
max_iter = 300;

x = -2:0.05:2;
y = -2:0.05:2;
[X, Y] = meshgrid(x, y);

figure
hold on
for y_0 = 1:length(y)
    for x_0 = 1:length(x)
        counter = 0;
        pogr = 1 + 1i;
        z_n = x(x_0) + 1i * y(y_0);
        while (counter <= max_iter && abs(pogr) > okrug)
            counter = counter + 1;
            pogr = z_n;
            z_n = z_n - f(z_n) / f_(z_n);
            pogr = abs(pogr - z_n);
        end
        if abs(z_n - a(1)) <= okrug
            plot(x(x_0), y(y_0), 'Color','r', 'Marker', '.','MarkerSize', 10);
        elseif abs(z_n - a(2)) <= okrug
            plot(x(x_0), y(y_0), 'Color','g', 'Marker', '.','MarkerSize', 10);
        elseif abs(z_n - a(3)) <= okrug
            plot(x(x_0), y(y_0), 'Color','m', 'Marker', '.','MarkerSize', 10);
        else
            plot(x(x_0), y(y_0), 'Color','b', 'Marker', '.','MarkerSize', 10);
        end
    end
end
hold off
% Ошибка была в том, что я убрал как должен выглядить маркер, а одну точку
% по дефолту он не рисует
