function salto=saltos(A)
%SALTOS genera el vector de saltos consecutivos en valor absoluto de la columna de datos
%ingresada

% ======================ESCRIBA AQUI SU CODIGO ======================
% Instrucciones: Complete el código faltante requerido para que la función calcule
%               eficientemente los valores absoluto del salto entre horas consecutivas.
%               Recuerde que este algoritmo es útil para datos con una distribución 
%               consecutiva donde se asume cierto grado de correlación con el dato previo.
%               Esto podría no ser cierto para datos en otras resoluciones, como por ejemplo,
%               màximas o mínimas diarias en días consecutivos.
%
% Sugerencia: 
%       
%       
%CALCULO DE COLUMNA DE SALTOS

[m,n]= size(A)

A2=A;
A2=[NaN;A2];
[m,n]= size(A2);
salto=abs(A-A2(1:m-1));
plot(salto);
xlabel('contador');
ylabel('Valor absoluto del salto (ºC)');

save salto.txt salto %Salvando el resultado en archivo de texto


% ============================================================

end
