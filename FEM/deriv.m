function der = deriv(i, n, x)
    % Funkcja oblicza pochodną funkcji bazowej dla elementu i
    h = 2/n;
    if (x >= h*(i-1) && x < h*i)
        % Jeśli x znajduje się w pierwszej połowie przedziału
        der = 1/h;
    elseif (x >= h*i && x < h*(i+1))
        % Jeśli x znajduje się w drugiej połowie przedziału
        der = -1/h;
    else
        % Jeśli x znajduje się poza przedziałem
        der = 0;
    end
end
