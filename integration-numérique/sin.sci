// Définir la fonction f(t) = sin(t)
function y = f(t)
    y = sin(t);
endfunction

// Définir l’intervalle [a, b] = [0, π/2]
a = 0;
b = %pi / 2;

// Définir la valeur A
A = -cos(b) + cos(a);

// Afficher la valeur de A avec le format scientifique
mprintf("%18.12e\n", A);

// Demander à l'utilisateur d'entrer un entier n pair et strictement positif
n = 0; 
while 1
    n = input("Entrez un entier n pair et strictement positif : ");
    if n > 0 & modulo(n, 2) == 0 then
        break; 
    else
        disp("Erreur : Veuillez entrer un entier pair et strictement positif.");
    end
end

h = (b - a) / n;

// Calculer A1 avec la méthode des rectangles à gauche
xi_1 = a + (1:n) * h;
A1 = sum(f(xi_1) * h);
e1 = abs(A - A1);

// Afficher la valeur de A1 et l'erreur e1
mprintf("A1 (méthode à gauche) = %18.12e\n", A1);
mprintf("Erreur e1 = |A - A1| = %10.3e\n", e1);

// Calculer A2 avec la méthode des rectangles à droite
xi_2 = a + (0:n-1) * h;
A2 = sum(f(xi_2) * h);
e2 = abs(A - A2);

// Afficher la valeur de A2 et l'erreur e2
mprintf("A2 (méthode à droite) = %18.12e\n", A2);
mprintf("Erreur e2 = |A - A2| = %10.3e\n", e2);

// Calculer A3 avec la méthode des rectangles au milieu
xi = a + (0:n) * h;
s = 0;
for i = 1:n
    s = s + f(a + (i-(1/2))*h) * h;
end
A3 = s;
e3 = abs(A - A3);

// Afficher la valeur de A3 et l'erreur e3
mprintf("A3 (méthode au milieu) = %18.12e\n", A3);
mprintf("Erreur e3 = |A - A3| = %10.3e\n", e3);

// Calculer A4 avec la méthode des trapèzes
xi_trapeze = a + (1:n-1) * h;
A4 = (h/2) * ((f(a) + f(b)) + 2 * sum(f(xi_trapeze)));
e4 = abs(A - A4);

// Afficher la valeur de A4 et l'erreur e4
mprintf("A4 (méthode des trapèzes) = %18.12e\n", A4);
mprintf("Erreur e4 = |A - A4| = %10.3e\n", e4);

// Calculer A5 avec la méthode de Simpson
s = 0;
for i = 1:n
    s = s + f(a + (i - 1/2) * h);
end
s_1 = s;

s = 0;
for i = 1:n-1
    s = s + f(a + i * h);
end
s_2 = s;

A5 = (h / 6) * (f(a) + f(b) + 4 * s_1 + 2 * s_2);
e5 = abs(A - A5);

// Afficher la valeur de A5 et l'erreur e5
mprintf("A5 (méthode de Simpson) = %18.12e\n", A5);
mprintf("Erreur e5 = |A - A5| = %10.3e\n", e5);
