% Dominio -> Que estructura tienen
% Predicado -> no funcion
% Meta
% Clausulas -> Hechos, base de conocimiento
% Reglas



% Representación, Constructores,Predicados de Pertenencia, Selectores, Modificadores
% La estructura del TDA debe considerar al menos el nombre del repositorio git, su fecha/hora de creación y las 4 zonas de trabajo (workspace, index, localRepository y remoteRepository).



% Representacion Repositorio
/*
Una lista con los siguientes 7 elementos: nombreRepo, nombreAutor, fecha, workpspace, ind3x, l0cal, remote.
nombreRepo: String, es el nombre del repositorio
nombreAutor: String, es el nombre del autor del repo
fecha: Intiger que representa la fecha de modirficacion
workpspace: Una lista con elementos que representa el workspace del repositorio
ind3x: Una lista con elementos que representa el index del repositorio
l0cal: Una lista con elementos que representa el local repository del repositorio
remote: Una lista con elementos que representa el remote repository del repositorio
*/

% Predicados

% Insertar un elemento en una lista
insertarElemento(Elemento,[],[Elemento]).

% Inserta el elemento en la primera posicion de la lista .
insertarElemento(Elemento,[Cabeza|Cola], [Elemento, Cabeza|Cola]).

% Reemplaza el N elemento de una lista, parte de 0.
reemplazaN(Lista, N, X, NuevaLista) :-
    same_length(Lista, NuevaLista),
   append(Prefijo, [_|Sufijo], Lista),
   length(Prefijo, N),
   append(Prefijo, [X|Sufijo], NuevaLista).


% Concatena 2 listas
conc([],B,B).
conc([X|D],B,[X|E]) :- conc(D,B,E).


% Obtener un elemento de la lista

% Member, si un elemento pertenece a la lista
 % ejemplo. member(1,[1,2,3,4]) => true
 
%Append Permite unificar 2 listas en una:append([1,2],[3,4],X)X=[1,2,3,4]o verificar que una lista es la unión de otras 2:append([a,b],[c],[a,b,c])yes
%Es más útil con los argumentos sin instanciar:append(X,[3,4],[1,2,3,4]).Yes, X=[1,2]append([1,2],Y,[1,2,3,4])Yes, Y=[3,4]

%Tamaño de una lista
size([],0).size([X|Y], N):-size(Y, N1), N is N1+1.

% Invertir lista
invertir_lista(X,X,0).invertir_lista([X|Y], L, N):-N1 is N-1, append(Y,[X],Y1), invertir_lista(Y1, L, N1).

% fecha
fecha(Hoy) :-
    get_time(Stamp),
    stamp_date_time(Stamp, DateTime, local),
    date_time_value(date, DateTime, Hoy).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  REQUERIMIENTOS FUNCIONALES  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ASK
%Predicado que permite a un usuario con sesión iniciada en la plataforma realizar una nueva pregunta. Cada pregunta registra el autor de la misma 
%(obtenido desde la sesión iniciada con login), fecha de publicación, la pregunta, un listado de etiquetas. El retorno es true si se puede satisfacer en “Stack2”
%el stack con la nueva pregunta incluida y sin la sesión activa del usuario que realizó la pregunta.

% 1)
% hechos: A partir de su implementación de los TDAs, proporcionar una base de hechos que contengan al menos: 2 stacks, 4 usuarios registrados, 5 preguntas y 10 respuestas.









