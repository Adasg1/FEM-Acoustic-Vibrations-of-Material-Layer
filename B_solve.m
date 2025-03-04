% Metoda kwadratury Gaussa do policzenia B
function res = B_solve(u, v, n)
    h = 2/n;  % Krok siatki
    u = u - 1;
    v = v - 1;
    res = -base_function(u, n, 2) * base_function(v, n, 2);

    % Górna przekątna
    if u == v-1
        pt1 = h/2 * (1/sqrt(3)) + (2*u*h+h)/2;  % Punkty kwadratury
        pt2 = h/2 * (-1/sqrt(3)) + (2*u*h+h)/2;
        res = res + h/2 * (deriv(u, n, pt1) * deriv(v, n, pt1) + deriv(u, n, pt2) * deriv(v, n, pt2));
        res = res - h/2 * (base_function(u, n, pt1) * base_function(v, n, pt1) + base_function(u, n, pt2) * base_function(v, n, pt2));

    % Dolna przekątna    
    elseif u == v+1
        pt1 = h/2 * (1/sqrt(3)) + (2*u*h-h)/2;
        pt2 = h/2 * (-1/sqrt(3)) + (2*u*h-h)/2;
        res = res + h/2 * (deriv(u, n, pt1) * deriv(v, n, pt1) + deriv(u, n, pt2) * deriv(v, n, pt2));
        res = res - h/2 * (base_function(u, n, pt1) * base_function(v, n, pt1) + base_function(u, n, pt2) * base_function(v, n, pt2));

    % Przekątna główna
    elseif u == n
        pt1 = h/2 * (1/sqrt(3)) + (2*u*h-h)/2;
        pt2 = h/2 * (-1/sqrt(3)) + (2*u*h-h)/2;
        res = res + h/2 * (deriv(u, n, pt1)^2 + deriv(u, n, pt2)^2);
        res = res - h/2 * (base_function(u, n, pt1)^2 + base_function(u, n, pt2)^2);

    else
        pt1 = h * (1/sqrt(3)) + u*h;
        pt2 = h * (-1/sqrt(3)) + u*h;
        res = res + h * (deriv(u, n, pt1)^2 + deriv(u, n, pt2)^2);
        res = res - h * (base_function(u, n, pt1)^2 + base_function(u, n, pt2)^2);
    end
end