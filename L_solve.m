% Metoda kwadratury Gaussa do policzenia L
function res = L_solve(u, v, n)
    v = v - 1;
    h = 2/n;
    pt1 = h * (1/sqrt(3)) + v * h;  % Punkty kwadratury
    pt2 = h * (-1/sqrt(3)) + v * h;
    res = h * (sin(pt1) * base_function(v, n, pt1) + sin(pt2) * base_function(v, n, pt2)) + 4 * base_function(v, n, 2); 

    % użycie shiftu
    u = shift(u) - 1;
    v = v - 1;
    
    l = base_function(u, n, 2) * base_function(v, n, 2);
    
    % Górna przekątna
    if u == v-1
        pt1 = h/2 * (1/sqrt(3)) + (2*u*h + h)/2;
        pt2 = h/2 * (-1/sqrt(3)) + (2*u*h + h)/2;
        l = l - h/2 * (deriv(u, n, pt1) * deriv(v, n, pt1) + deriv(u, n, pt2) * deriv(v, n, pt2));
        l = l + h/2 * (base_function(u, n, pt1) * base_function(v, n, pt1) + base_function(u, n, pt2) * base_function(v, n, pt2));

    % Dolna Przekątna 
    elseif u == v+1
        pt1 = h/2 * (1/sqrt(3)) + (2*u*h - h)/2;
        pt2 = h/2 * (-1/sqrt(3)) + (2*u*h - h)/2;
        l = l - h/2 * (deriv(u, n, pt1) * deriv(v, n, pt1) + deriv(u, n, pt2) * deriv(v, n, pt2));
        l = l + h/2 * (base_function(u, n, pt1) * base_function(v, n, pt1) + base_function(u, n, pt2) * base_function(v, n, pt2));

    % Główna przekątna
    elseif u == n
        pt1 = h/2 * (1/sqrt(3)) + (2*u*h - h)/2;
        pt2 = h/2 * (-1/sqrt(3)) + (2*u*h - h)/2;
        l = l - h/2 * (deriv(u, n, pt1)^2 + deriv(u, n, pt2)^2);
        l = l + h/2 * (base_function(u, n, pt1)^2 + base_function(u, n, pt2)^2);

    else
        pt1 = h * (1/sqrt(3)) + u*h;
        pt2 = h * (-1/sqrt(3)) + u*h;
        l = l - h * (deriv(u, n, pt1)^2 + deriv(u, n, pt2)^2);  
        l = l + h * (base_function(u, n, pt1)^2 + base_function(u, n, pt2)^2);  
    end

end