function y = f(x)
   // y = x^6 + x^2 + 9*x - 2;
    y = (exp(x) + 10*x^3 + x - 2) / 10;
endfunction

function dy = df(x)
   // dy = (6 * x^5) + (2 * x) + 9
    dy = (exp(x) + 30*x^2 + 1) / 10;
endfunction


xn = 1; 
eps = input("Entrez la précision ε  : ");

if eps <= 0 then
    disp("Erreur : la précision ε doit être strictement positive.");
    stop;
end

n = 0;  


while abs(f(xn)) >= eps then
    xn = xn - f(xn) / df(xn); 
    n = n + 1;  
end


disp(n);
disp("Racine approximative xbar :");
disp(xn);
disp("Valeur de |f(xbar)| :");
disp(abs(f(xn)));
