tmin = -1;
tmax = 1;
y0 = exp(1) + 1/exp(1); 
z0 = -exp(1) + 1/exp(1); 
a = 0;
b = -1;

n = 0;
while 1
    n = input("Entrez un entier n strictement positif : ");
    if n > 0
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
    val = 0; 
end

for i = 1:n
    zz(i + 1) = zz(i) + h * ((-a) * zz(i) + (-b) * yy(i) + f(tt(i)));
    yy(i + 1) = yy(i) + h * zz(i);
end

function y_exacte = solution_exacte(t)
    y_exacte = exp(t) + exp(-t); 
end

clf();
plot(tt, yy, 'o-', 'LineWidth', 3);
plot(tt, solution_exacte(tt), 'r-', 'LineWidth', 3);
legend("Solution Approchée", "Solution Exacte");
title(sprintf("Solution Approchée et Exacte (n = %d)", n));
xlabel("t");
ylabel("y(t)");
xgrid();
