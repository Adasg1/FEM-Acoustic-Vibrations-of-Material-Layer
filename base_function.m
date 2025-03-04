function base = base_function(i, n, x)
    % Funkcja oblicza wartość funkcji bazowej dla elementu i
    h = 2/n;
    if (x >= h*(i-1) && x <= h*i)
        % Jeśli x znajduje się w pierwszej połowie przedziału
        base = (x - h*(i-1))/h;
    elseif (x >= h*i && x <= h*(i+1))
        % Jeśli x znajduje się w drugiej połowie przedziału
        base = (h*(i+1) - x)/h;
    else
        % Jeśli x znajduje się poza przedziałem
        base=0;
    end
end