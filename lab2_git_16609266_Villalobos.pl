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


% GetElemento de una lista
primer([E|_],E).                % nombreRepo    0
segundo([_,E|_],E).             % nombreAutor   1
tercero([_,_,E|_],E).           % fecha         2
cuarto([_,_,_,E|_],E).          % workpspace    3
quinto([_,_,_,_,E|_],E).        % ind3x         4
sexto([_,_,_,_,_,E|_],E).       % l0cal         5
septimo([_,_,_,_,_,_,E|_],E)    % remote        6



% fecha
fecha(Hoy) :-
    get_time(Stamp),
    stamp_date_time(Stamp, DateTime, local),
    date_time_value(date, DateTime, Hoy).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  REQUERIMIENTOS FUNCIONALES  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% gitInit
% Predicado que permite consultar el valor que debe tomar RepoOutput a partir de un nombre y autor. RepoOutput tendría un repositorio vacío sin commits y sin archivos en sus zonas.

gitInit(NombreRepo, Autor, RepoOut):- insertarElemento(fecha(Hoy),[workpspace, ind3x, l0cal, remote],L), insertarElemento(Autor,L,L1), insertarElemento(NombreRepo,L1,RepoOut).
% Predicado que retorna un Repositorio con el nombre del mismo, nombre del autor, fecha de creacion, y un workpspace vacio, ind3x vacio, l0cal vacio y un remote vacio.


% gitAdd: 
/* Predicado que permite consultar el valor que debe tomar RepoOutput a partir de un repositorio de entrada RepoInput tal que en RepoOutput se mueven los archivos desde la zona Workspace a la zona Index. 
Puede hacerlo con la especificación de una lista de nombres de archivos concretos (nombres como strings).
RepoInput corresponde al repositorio de entrada a este predicado con las cuatro zonas de acuerdo a la representación escogida para este TDA. En la variable RepoOutput debe retornar el resultado, 
esto aplica para todos los siguientes predicados que usen estas variables.
        gitAdd(RepoInput, Archivos, RepoOutput).
    ejemplos de uso: gitAdd(RepoInput, [ “file1.txt”, “f2.pl”, “archivo3.docx” ], RepoOutput).
             gitadd(RepoInput, [ ], RepoOutput).

*/

gitAdd(RepoIn, Archivos, RepoOut):- cuarto(RepoIn, L), reemplazaN(RepoIn, 4, L, RepoOut), reemplazaN(RepoIn, 3, workspace, RepoOut).
% Predicado que mueve los archivos almacenados en el workspace al ind3x.

% gitCommit
% Predicado que permite consultar el valor que debe tomar RepoOutput a partir de un repositorio de entrada RepoInput tal que en RepoOutput  hay un commit con los cambios almacenados en index y especificando un mensaje descriptivo (un string) para llevarlos al LocalRepository.

gitCommit(RepoIn, Mensaje, RepoOut):- quinto(RepoIn, L), reemplazaN(RepoIn, 5, L, M), reemplazaN(M, 4, Mensaje, RepoOut).
% Predicado que retorna un repositorio con un mensaje en el ind3x y mueve los archivos al l0cal.

% gitPush
% Predicado que permite consultar el valor que debe tomar RepoOutput a partir de un repositorio de entrada RepoInput tal que en RepoOutput se envían los commit desde el repositorio local al 
% repositorio remoto registrado en las zonas de trabajo.
    
gitPush(RepoIn, RepoOut):- sexto(RepoIn, K), reemplazaN(RepoIn, 6, K, RepoOut).
% Predicado que retorna un repositorio con los elementos almacenados en el l0cal al remote.



