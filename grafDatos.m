function grafDatos(x, y)
%GRAFDATOS grafica los vectores x y y 
%   grafDatos(x,y) grafica los puntos de datos y establece las etiquetas de los ejes
%   

% ======================ESCRIBA AQUI SU CODIGO ======================
% Instrucciones: Grafique los datos de temperatura usando los comandos
%               "figure" y "plot". defina las etiquetas de los ejes usando 
%               los comandos "xlabel" y "ylabel". Assuma que los datos 
%               del contador y de temperatura horaria han sido transferidos
%               a los argumentos x y y de esta funcion.
%
% Sugerencia: Puede usar la opcion'rx' con plot para que los marcadores aparezcan
%       como cruces rojas. Ademas, puede hacer mas grandes los marcadores 
%       usando plot(..., 'rx', 'MarkerSize', 10);

figure; % abrir una nueva ventana para la figura

plot(x, y, 'rx', 'MarkerSize', 10);
xlabel('contador');
ylabel('Temperatura horaria (ºC)');

% ============================================================

end
