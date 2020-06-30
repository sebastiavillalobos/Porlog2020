% Dominio -> Que estructura tienen
    %


% Predicado -> no funcion

% Meta
    %Primaria

    %Secundaria

% Clausulas -> Hechos, base de conocimiento

% Reglas



% Insertar un elemento en una lista
insertarElemento(Elemento,[],[Elemento]).
insertarElemento(Elemento,[Cabeza|Cola], [Elemento, Cabeza|Cola]).

% Determinar si un elemento pertenece a la lista
% Eliminar un elemento con la posicion dada
% Modificar elemento a la posicion dada

% Hechos, Loshechosexpresan  relaciones  entre  los  objetos  del  universo  de 
 discurso,Hechos Prologque son verdaderas incondicionalmente. 

% Metas, Clausulas sin Cabeza

% Reglas, Las reglas son verdades condicionadas (cláusulas con cabeza y cuerpo). 


%%%%% LISTAS %%%%%%

% Filtra una lista con elementos con una propiedad.
gringas([X]) :- loc_en(X,usa).
gringas([X|Xs]) :- loc_en(X,usa), gringas(Xs).

pares([],[]).
pares([X|Xs],[X|Ys]) :- par(X), pares(Xs,Ys).
pares([X|Xs],Ys) :- impar(X), pares(Xs,Ys).

menor([],[]).
menor([X|Xs],[X|Ys]):- menor_que(X), menor(Xs,Ys).
menor([X|Xs],Ys):- not(menor_que(X)), menor(Xs,Ys).
% El caso que detiene la recursividad es cuando la lista analizada tiene un ele-mento. 

% Busca  si  unelemento es miembro de una lista
% % miembro(X,Ys)
% % El elemento X es miembro de la lista Ys
miembro(X,[X|_]).
miembro(X,[_|Ys]) :- miembro(X,Ys).
% miembro(4, [1,2,3,4,5,6]).  True

% calcular  la  longitud  de  una lista
% % long(Xs,L)
% % L es la longitud de la lista Xs
long([],0).
long([_|Xs],L) :- long(Xs,L1), L is L1+1.
% long([1,2,3,4,5],L).  L=5

% Permite unir dos listas en una tercera:
append([],Ys,Ys).
append([X|Xs], Ys, [X|Zs]) :-  append(Xs,Ys,Zs).