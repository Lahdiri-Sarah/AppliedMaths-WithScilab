//////////////////////////////////////////////////////////////////////////////
//
// INTERPOLATION CUBIQUE PAR INTERVALLES (PAR MORCEAUX)
//
//////////////////////////////////////////////////////////////////////////////

// calcul des coefficients a, b et c de la fonction f(t) = a*t*t+b*t+c
// qui interpole les donnees (t1,y1, (t2,y2) et (t3,y3)
//  f(t1) = y1 , f(t2) = y2 , f(t3) = y3
// Entree : t1,y1,t2,y2,t3,y3 = 6 valeurs telles que t1 < t2 < t3
// Sortie : a,b,c = 3 reels
function [a,b,c] = interp_parabolique(t1,y1,t2,y2,t3,y3)
      a = ((y3 - y2) / (t3 - t2) - (y2 - y1) / (t2 - t1)) / (t3 - t1)
      b = ((y2 - y1) / (t2 - t1) - a * (t1 + t2))
      c = y1 - a * (t1 * t1) - b * t1



endfunction

//////////////////////////////////////////////////////////////////////////////
// interpolation lineaire par morceaux
// 
// 1) se donner N points (t(k),y(k)) avec t(1) < t(2) < ... < t(k-1) < t(k)
//
// 2) calculer la fonction cubique par morceaux qui interpole les donnees
//
// 3) puis tracer les donnees et la fonction dans une meme fenetre

    // 1) les donnees
    t = [0, %pi/6, %pi/3, %pi/2, 2*%pi/3, 5*%pi/6, %pi]
    y = [0, 1/2, sqrt(3)/2, 1, sqrt(3)/2, 1/2, 0]
//    t = [1 2 3 4 5];
//    y = [2 3 2 3 2];
    
    // nombre de donnees
    N = length(t);
    
    // -------------------------------------------------------------- //    
    // 2) calcul des N fonctions f_k avec 1 <= k <= N                 //
    // les 3 coefficients a_k, b_k et c_k definissant la fonction f_k //
    // sont stockees dans la ligne d'indice k du tableau Cf           //
    // contenant N lignes et 3 colonnes                               //
    //                                                                //
    //      | a_1   b_1   c_1  |                                      //
    //      | a_2   b_2   c_2  |                                      //
    //      | ...   ...   ...  |                                      //
    // Cf = | a_k   b_k   c_k  |                                      //
    //      | ...   ...   ...  |                                      //
    //      | a_N   b_N   c_N  |
                                                                       //
    //                                                                //
    // -------------------------------------------------------------- //    
    
    // creation du tableau Cf avec N lignes et 3 colonnes
    Cf = zeros(N,3)
    
    // determination des coefficients des N-2 fonctions f_k avec 2 <= k <= N-1  
    for (k = 2:N-1)
        t1 = t(k-1)
        t2 = t(k)
        t3 = t(k+1)
        y1 = y(k-1)
        y2 = y(k)
        y3 = y(k+1)

       [a,b,c] = interp_parabolique(t1, y1, t2, y2, t3, y3);
     
        Cf(k , 1) = a
        Cf(k , 2) = b
        Cf(k , 3) = c
     end

    
    // ajout des 2 fonctions f_1 = f_2 et f_N = f_N-1 :
    //  copier la deuxieme ligne de Cf dans la premiere
    // Cf(1, :) = Cf(2, :)
        Cf(1, 1) = Cf(2, 1) 
        Cf(1, 2) = Cf(2, 2)
        Cf(1, 3) = Cf(2, 3)
     //  copier l'avant-derniere ligne de Cf dans la derniere
    // Cf(N, :) = Cf(N - 1, :)
        Cf(N, 1) = Cf(N-1, 1)
        Cf(N, 2) = Cf(N-1, 2)
        Cf(N, 3) = Cf(N-1, 3)

        
    
    // --------------------------------------------------------- //    
    // 3) representation graphique des donnees et de la fonction //
    // --------------------------------------------------------- //    

    // creation de la fenetre graphique
    fid = scf()

    
    // representation des donnees sous forme de points rouges de taille 8
    plot(t,y,'r.','markersize',9)
        
    // representation de la fonction intervalle par intervalle
    for k=1:N-1
        
        // bornes de l'intervalle [t(k),t(k+1)]
        t1 = t(k)
        t2 = t(k+1)
         
        // differentes valeurs dans l'intervalle [t1,t2]        
        tt = linspace(t1,t2,1000)

        // recuperer les trois coefficients (a1,b1,c1) de la fonction f_k
        //  dans la ligne d'indice k de Cf
        // (a1,b1,c1) coefficients de f_k(t) = a1*t*t+b1*t+c1
        a1 = Cf(k, 1) 
        b1 = Cf(k, 2) 
        c1 = Cf(k, 3) 
        
        // recuperer les trois coefficients (a2,b2,c2) de la fonction f_{k+1} 
        //  dans la ligne d'indice k+1 de Cf
        // (a2,b2,c2) coefficients de f_k+1(t) = a2*t*t+b2*t+c2
        a2 = Cf(k+1,1)
        b2 = Cf(k+1,2)
        c2 = Cf(k+1,3)

        // evaluation de la fonction f sur les valeurs tt
           yy1 = a1 * ( tt .* tt ) + b1 .* tt + c1 
        
        // representation graphique de f dans l'intervalle [t1,t2] 
        plot(tt,yy1,'k-','linewidth',5)
        xtitle("Approximation cubique des données n°3", "t", "f(t)")
    end
      // Tracé de la fonction g(t) = sin(t) sur l'intervalle [0, pi]
      tt_sin = linspace(0, %pi, 1000)
      yy_sin = sin(tt_sin)
      plot(tt_sin, yy_sin, 'r--', 'linewidth', 2)
      legend(["Interpolation cubique", "g(t) = sin(t)"])
