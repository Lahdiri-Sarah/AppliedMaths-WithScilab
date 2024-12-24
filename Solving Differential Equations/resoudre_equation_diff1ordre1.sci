function resoudre_equation_diff(f, y_exact , tmin, tmax, y0, n)

    h = (tmax - tmin) / n;
    tt = tmin:h:tmax;
    yy = zeros(1, n + 1);
    yy(1) = y0;

    for i = 1:n
        yy(i + 1) = yy(i) + h * f(tt(i));
    end


    clf(); 
    plot(tt, yy, 'o-', 'LineWidth', 3); 
    plot(tt, y_exact(tt), 'r-', 'LineWidth', 3);  
    legend("Solution Approchée", "Solution Exacte");
    title(sprintf(" (n = %d)", n));
    xlabel("t");
    ylabel("y(t)");
    xgrid();
endfunction

//Définir a(t)
a = 0
// Définir f(t)
function val = f(t)
    val = cos(t);
endfunction

// Définir y_exact(t)
function val = y_exact(t)
    val = sin(t);
endfunction

tmin = 0;
tmax = 10 * %pi;
y0 = 0;

while 1
    n = input("Entrez un entier n strictement positif : ");
    if n > 0 then
        resoudre_equation_diff(f, y_exact, tmin, tmax, y0, n);
        break;
    else
        disp("Erreur : Veuillez entrer un entier strictement positif.");
    end
end
