function main
    n = input("Podaj liczbę podziałów siatki: ");

    B = zeros(n+1, n+1);
    L = zeros(n+1, 1);

    % Warunek brzegowy Dirichleta
    B(1,1) = 1;
    L(1,1) = 0;

    for i = 2:n+1
        % Wypełnienie głównej przekątnej macierzy B
        B(i, i) = B_solve(i, i, n);

        % Wypełnienie dolnej przekątnej macierzy B
        if i < n+1
            B(i, i+1) = B_solve(i, i+1, n);
        end

        % Wypełnienie górnej przekątnej macierzy B
        if i > 2
            B(i, i-1) = B_solve(i, i-1, n);
        end

        % Obliczenie wartości wektora L
        L(i, 1) = L_solve(i, i, n);
    end

    % Rozwiązanie układu równań liniowych
    result = linsolve(B, L);

    disp(result);

    % Definicja kroku oraz siatki punktów x
    h = 2 / n;
    x = 0:h:2;
    y = zeros(1, length(x));

    % Obliczenie wartości funkcji y dla każdego punktu x
    for i = 1:length(x)
        % Uwzględnienie shiftu
        y(i) = shift(x(i));
        for j = 1:length(result)
            % Dodanie wartości wynikających z funkcji bazowej
            y(i) = y(i) + result(j) * base_function(j-1, n, x(i));
        end
    end

    % Wykres y(x)
    plot(x, y);
    xlabel('x');
    ylabel('y');
end
