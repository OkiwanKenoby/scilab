clc // effacer la console scilab
clear // effacer les données : equivalent scilab de clear all

function y=f_permut (M) ; // M est une matrice .
    [ r , c ]= size (M) ; // r : nombre de lignes , c , de colonnes
    A=(c +1)*ones ( r , 1 ) ; // Colonne de ( c+1) a r lignes .
    y = [];
    for j= 0:c
        B=[M( : , 1 : j ) ,A, M( : , j+1 :c ) ] ; // Matrice a r lignes , c+1 colonnes :
        //on a intercale A au debut , entre les colonnes , a la fin .
        y= [y ; B];
        //disp('aB=');disp(B) ;
    end
endfunction

function liste_permut ( n ) ; // n est un entier >0.
    tic ( ) ;
    M= [ 1 ] ;
    for j=1 :n-1
       // disp('j='+string(j))
        M=f_permut (M) ;
    end ;
    temps=toc ( ) ;
    disp(M) ;
    disp('La duree du  calcul ,en secondes, est '+string ( temps ) );
    disp('il y a '+string(factorial(n))+' permutation');
endfunction


function Z=Operation (Resultat, operation, terme) ;
    if (operation == 0) then
        Z = Resultat ;
    end
    if (operation == 1) then
        Z = Resultat + terme;
    end
    if (operation == 2) then
        Z = Resultat * terme;
    end
     if (operation == 3) then
        Z = Resultat - terme;
    end
endfunction

function Z=StringOperation ( operation) ;
    if (operation == 0) then
        Z = "" ;
    end
    if (operation == 1) then
        Z = "+";
    end
    if (operation == 2) then
        Z = "*";
    end
     if (operation == 3) then
        Z = "-";
    end
endfunction

function compte_est_bon ()
    //liste_permut ( 5);
    //disp(perms([1, 2, 3, 4, 5]));
    HT(1)=input("Première carte à tirer parmi 1, 2, 3, 4, 5, 6, 7, 8 ,9, 10, 25: ");
    HT(2)=input("Deuxième carte à tirer parmi 1, 2, 3, 4, 5, 6, 7, 8 ,9, 10, 25: ");
    HT(3)=input("Troisième carte à tirer parmi 1, 2, 3, 4, 5, 6, 7, 8 ,9, 10, 25: ");
    HT(4)=input("Quatrième carte à tirer parmi 1, 2, 3, 4, 5, 6, 7, 8 ,9, 10, 25: ");
    HT(5)=input("Et cinquième carte à tirer parmi 1, 2, 3, 4, 5, 6, 7, 8 ,9, 10, 25: ");
    disp(HT);
    A=perms(HT);
    //A=perms([1, 2, 3, 4, 5]);
    Target =input("Nombre à trouver: ");
    L=size(A);
    //disp(L(1));
    disp(A(1,:));
    compteur = 0;
    
    for ll=1:L(1)
        for i=0:3
             for j=0:3
                 for k=0:3
                     for l=0:3
                        Iteration = 0;
                        if (i==0 & j==0 & k==0 & l==0 ) then 
                          //  disp('coucou'); 
                        end
                        if (i>0) then 
                            Iteration = A(ll,1);
                        end
                        Iteration=Operation (Iteration, i, A(ll,2));
                        Iteration=Operation (Iteration, j, A(ll,3)); 
                        Iteration=Operation (Iteration, k, A(ll,4));
                        Iteration=Operation (Iteration, l, A(ll,5)); 
                        if (Iteration == Target) then
                            compteur = compteur +1 ;
                            Formule = "(";
                            if (i>0) then
                                Formule = Formule + string(A(ll,1))+StringOperation (i)+string(A(ll,2))+")";
                            end
                            if (j>0) then
                                if ( i > 0) then
                                    Formule = "("+Formule + StringOperation (j);
                                end
                                Formule = Formule +string(A(ll,3))+")";
                            end
                            if (k>0) then
                                Formule = "("+Formule + StringOperation (k)+string(A(ll,4))+")";
                            end
                            if (l>0) then
                                Formule = "("+Formule + StringOperation (l)+string(A(ll,5))+")";
                            end
                           // disp('i='+StringOperation (i)+' j='+StringOperation (j)+' k='+StringOperation (k)+' l='+StringOperation (l));
                            disp (Formule);
                            //disp(A(ll,:));
                        end
                      end
                 end
             end
        end
    end
    disp('il y a '+string(compteur)+' façons de réaliser '+string(Target));
endfunction
