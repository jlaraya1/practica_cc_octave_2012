%% Practica programada de script de control de calidad de datos

%  Instrucciones
%  ---------------
% 
%  este archivo contiene diversas funciones e instrucciones que le 
%  permitiran ir completando este script. Se adjuntan las siguientes funciones
%  necesarias para este ejercicio:
%
%     ccoet.m
%     bienvenido.m
%     grafDatos.m
%     saltos.m
%     picos.m
%     cotas.m
%     anomalias.m
%     estadisticas.m
%     repetidos.m

%Para esta práctica se incluyen dos archivos de datos horarios y diarios. El primero
%corresponde a datos horarios y está espaciado por columnas:
%==================================================================================
% año      Mes      Dia      Hora     Cont      T1     tlog     volbt mx   volt_min 
%----------------------------------------------------------------------------------
% 2011.00     3.00    18.00    14.00     0.00    29.12    33.52    12.95    12.88
% 2011.00     3.00    18.00    15.00     1.00    28.88    34.31    12.95    12.91
% 2011.00     3.00    18.00    16.00     2.00    27.95    32.28    13.01    12.92
% 2011.00     3.00    18.00    17.00     3.00    27.68    30.21    13.02    12.79
% 2011.00     3.00    18.00    18.00     4.00    25.68    28.13    12.83    12.64
%===================================================================================
%El archivo de datos diarios contiene las siguientes columnas:
%==============================================================
%  año         Mes      Dia      Hora     Cont    T1mx     T1mn
%--------------------------------------------------------------  
% 2011.00     3.00    19.00     7.00     0.00    30.09    21.22
% 2011.00     3.00    20.00     7.00     1.00    27.95    21.15
% 2011.00     3.00    21.00     7.00     2.00     9.35    19.79
% 2011.00     3.00    22.00     7.00     3.00    28.67    20.98
% 2011.00     3.00    23.00     7.00     4.00    28.94    21.63
%
% Para este ejercicio usted no requiere cambiar el código de este archivo,
% o de ninguna de las funciones mencionadas arriba.
%% Inicializar
clear all; close all; clc

%% ==================== Parte 1: Funcion Basica ====================
% Complete bienvenido.m 
fprintf('Corriendo bienvenido.m ... \n');
fprintf('Matriz identidad de 10x10 : \n');
bienvenido()

fprintf('Programa pausado. Presione "Enter" para seguir.\n');
pause;

%% ======================= Parte 2: graficos =======================
fprintf('Comencemos a hacer graficas ...\n')
data_hor = load('temp_hora.txt');
X = data_hor(:, 5); y = data_hor(:, 6);
m = length(y); % numero de filas

% Graficar datos
%===================================================================
% Note: Usted tiene que completar este código en  grafDatos.m
grafDatos(X, y);

fprintf('Programa detenido. Presione enter para continuar.\n');
pause;

%% =================== Parte 3: saltos horarios ===================
fprintf('vamos a correrle el algoritmo de saltos horarios a los datos ...\n')

%Trate de detectar los valores absoluto del salto de mayor magnitud que visualiza
%en el gráfico. Tiene sentido físico los saltos observados? Se debe a un error en la
%información, o se trata de un valor extremo? Es plausible dicho salto y la hora a la
%que se dio?

figure(2), clf;
salto=saltos(y);


% ======= Parte 4: Buscando valores atípicos y su posición en la serie: ============
%Para esta parte del ejercicio hemos definido la funcion cotas. 
%p=[i j f] retorna el numero de fila (i), el numero de columna (j) y el valor (f)
%COTAS saca los valores extremos superiores e inferiores usando dos criterios:
%valores que superan percentiles prefijados o valores fijos determinados por el usuario
%p=cotas(vector,sup,infe,col,modo)
p=cotas(y,99.9,0.1,1);

%% ======= Parte 5: Calculando climatologías básicas ============
figure(3), clf;
mensual=climat_mes(data_hor,2,6)
fprintf('Las columnas del reporte mensual representan lo siguiente: \n');
fprintf('PROMEDIO--MAXIMA-MINIMA--DESV. ESTANDAR--MEDIANA--COEF. VARIACION \n');
fprintf('Programa detenido. Presione enter para continuar.\n');
pause;

%====================================================
%       DATOS DIARIOS DE TEMPERATURA
%====================================================

data_dia = load('temp_dia.txt');
tmx = data_dia(:, 6); tmn = data_dia(:, 7);

figure(4), clf; 

subplot(1,2,1);
plot([tmx,tmn])
xlabel('contador');
ylabel('temperatura');
legend('Tmax','Tmin');
subplot(1,2,2); 
plot(abs(tmx-tmn),"r");
xlabel('contador');
ylabel('Rango');


fprintf('***Compilación exitosa***\n')



