tmin = 0;
tmax = 10 * %pi;
y0 = 1;
z0 = -1/2;
a = 0;
b = 1;

n = 0;
while 1
    n = input("Entrez un entier n  strictement positif : ");
    if n > 0 then
        break;
    else
        disp("Erreur : Veuillez entrer un entier n strictement positif.");
    end 
end

h = (tmax - tmin) / n;
tt = tmin:h:tmax;

yy = zeros(1, n + 1);
zz = zeros(1, n + 1);
yy(1) = y0;
zz(1) = z0;

function val = f(t)
    val = t / 2;
endfunction

for i = 1:n
    zz(i + 1) = zz(i) + h * ((-a) * zz(i) + (-b) * yy(i) + f(tt(i)));
    yy(i + 1) = yy(i) + h * zz(i);
end

function y_exacte = solution_exacte(t)
    y_exacte = cos(t) - sin(t) + t / 2;
endfunction

clf();
plot(tt, yy, 'o-', 'LineWidth', 3);
plot(tt, solution_exacte(tt), 'r-', 'LineWidth', 3);
legend("Solution Approchée", "Solution Exacte");
title(sprintf(" (n = %d)", n));
xlabel("t");
ylabel("y(t)");
xgrid();
