function p=cotas(A,sup,infe,modo)

%p=[i j f] retorna el numero de fila (i), el numero de columna (j) y el valor (f)
%COTAS saca los valores extremos superiores e inferiores usando dos criterios:
%valores que superan percentiles prefijados o valores fijos determinados por el usuario
%p=cotas(vector,sup,infe,col,modo)
%==============================================================================================
%A:    el vector de datos al que se le va a extraer los valores extremos. 
%      En el caso de un solo vector se especifica "1" como numero 
%      de columna
%sup:  valor superior. Si se usa el criterio de percentiles debe ser el percentil superior
%      de 1 a 1oo. Idem para "infe"
%modo: Modo "0" para cotas dadas por el usuario, modo "1" para cotas calculadas usando el
%      percentil

% NOTA: La funcion debe devolverle la matriz filtrada con respecto a la columna especificada.

% ======================ESCRIBA AQUI SU CODIGO ======================
% Instrucciones: Complete el código faltante requerido para que la función calcule
%               eficientemente los valores absoluto del salto entre horas consecutivas.
%               Recuerde que este algoritmo es útil para datos con una distribución 
%               consecutiva donde se asume cierto grado de correlación con el dato previo.
%               Esto podría no ser cierto para datos en otras resoluciones, como por ejemplo,
%               màximas o mínimas diarias en días consecutivos.
%
       
%CALCULO DE VALORES EXTREMOS.

%calculando los rangos del salto (P99.9)
if modo ==1
sup=prctile(A,sup); infe=prctile(A,infe)
end

[i,j]=find(A>=sup);f=A(i,1);p=[i j f];
[i,j]=find(A<infe);f=A(i,1);pp=[i j f];

p=[p;pp];

save p.txt p %Salvando el resultado en archivo de texto


% ============================================================

end
