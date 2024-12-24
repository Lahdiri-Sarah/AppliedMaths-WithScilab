
function y = f(x)
   // y = x^6 + x^2 + 9*x - 2;
    y = (exp(x) + 10*x.^3 + x - 2) / 10
endfunction

a = 0;
//a = -1;
b = 1;


f1 = f(a);
f2 = f(b);

if f1 * f2 > 0 then
    disp("Erreur : f(a) * f(b) doit être négatif pour que la dichotomie soit applicable.");
    stop;
end

eps = input("Entrez la précision ε (epsilon > 0) : ");

if eps <= 0 then
    disp("Erreur : la précision ε doit être strictement positive.");
    stop;
end


n = 0; 
x1 = a; 
x2 = b; 
f1 = f(x1); 
f2 = f(x2); 

// Algorithme de dichotomie
while (abs(f1) >= eps) && (abs(f2) >= eps) then
    x3 = (x1 + x2) / 2; 
   
    f3 = f(x3); 
    if f1 * f3 < 0 then 
        x2 = x3; 
        f2 = f3;
    else
        x1 = x3;
        f1 = f3;
    end
    n = n + 1;
end

if abs(f1) < eps then
    xbar = x1;
else
    xbar = x2;
end



disp(n);
disp("Racine approximative xbar :");
disp(xbar);
disp("Valeur de |f(xbar)| :");
disp(abs(f(xbar)));
