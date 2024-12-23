//////////////////////////////////////////////////////////////////////////////
// 
// INTERPOLATION LINEAIRE PAR INTERVALLES (PAR MORCEAUX)
//
//////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////
// calculer la valeur yy=f(tt) de la fonction qui interpole les donnees
// (t(k),y(k)) avec 1 <= k <= N
// Entree : t = vecteur des N abscisses t(k), ces N abscisses sont supposees
//              distinctes et triees par ordre croissant : 
//              pour tout k, t(k)<t(k+1)
//          y = vecteur de N valeurs
//          tt = un reel qu'on suppose entre t(1) et t(N)
// Sortie : yy = la valeur f(tt)
function yy = fct_interp_lin(t,y,tt)
    
    // le nombre de donnees
    N = length(t);
    
    // trouver l'entier k entre 1 et N-1 tel que tt appartient a [t(k),t(k+1)]
	//
    // algorithme pour trouver k :
    //  k <-- 1
    //  tant que k<N et tt>t(k+1)
    //    k <-- k+1
    //  fin_tant_que

k = 1
while (k < N & tt > t ( k + 1 ) )
      k = k + 1
end

    
    // calculer la valeur yy en utilisant 
    // les valeurs (t(k),y(k)), (t(k+1),y(k+1)) et la valeur tt :
	// calculer les coefficients a et b, puis calculer yy = a*tt+b
a = (y(k+1) - y(k)) / (t(k+1) - t(k))
b = y(k) - a * t(k)
yy = a * tt + b
		
endfunction


//////////////////////////////////////////////////////////////////////////////
// interpolation lineaire par morceaux
// 
// 1) se donner N points (t(k),y(k)) avec t(1) < t(2) < ... < t(k-1) < t(k)
//
// 2) calculer la fonction lineaire par morceaux qui interpole les donnees
//    pour des valeurs de tt entre t(1) et t(N)
//
// 3) puis tracer les donnees et la fonction

    // -------------- //
    // 1) les donnees //
    t = ( 1 : 9) * %pi
    y = cos(t)
    
    // nombre de donnees
    N = length(t); 
    
    // ------------------------------------------------ //
    // 2) calcul de la fonction interpolant les donnees //
    //    pour P valeurs de t entre t(1) et t(N)        //
    P = 1000;
    tt = linspace(t(1),t(N),P);
    yy = zeros(1,P); // yy : valeurs de f(tt)
    for j=1:P
        yy(j) = fct_interp_lin(t,y,tt(j))
    end
    
    // -----------------------------------------------------------------  //
    // 3) representation graphique dans une meme fenetre                  //
    //    des donnees (t(k),y(k)) sous forme de points rouges             //
    //    et de la fonction  yy=f(tt) sous forme d'une courbe noire       //
plot(t, y, 'r.', 'markersize', 20)
plot(tt, yy, 'k-', 'linewidth', 20)
title("Interpolation linéaire par morceaux")

