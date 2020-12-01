%*********************************************************************
%  Funcion climat_mes                                                
%  Programador: Jose Luis Araya Lopez                                
%  Contacto: jlaraya1@gmail.com                                      
%                                                                    
%  Esta funcion fue desarrollada para generar la climatologia mensual
%  de un archivo de datos con un orden de columnas como el siguiente 
%                                                                    
%==================================================================================
% año      Mes      Dia      Hora     Cont      T1     tlog     volbt mx   volt_min 
%----------------------------------------------------------------------------------
% 2011.00     3.00    18.00    14.00     0.00    29.12    33.52    12.95    12.88
% 2011.00     3.00    18.00    15.00     1.00    28.88    34.31    12.95    12.91
% 2011.00     3.00    18.00    16.00     2.00    27.95    32.28    13.01    12.92
% 2011.00     3.00    18.00    17.00     3.00    27.68    30.21    13.02    12.79
% 2011.00     3.00    18.00    18.00     4.00    25.68    28.13    12.83    12.64
%                                                                   
%Requiere al menos un registro de un agno para sacar la climatologia *
%*********************************************************************
%A: Matriz sobre la cual se quiere sacar la climatologia mensual
%m: Columna que contiene el mes
%n: Columna sobre la cual se quiere sacar la climatologia mensual


%LA MATRIZ DE SALIDA DE LA FUNCION ES LA SIGUIENTE
%COL    SIGNIFICADO DE COL  
% 1     Mes    
% 2     promedios_mes  
% 3     desviaciones estandar    
% 4     maximos_mes
% 5     minimos_mes   
% 6     medianas_mes  
% 7     Coef. Variacion  
% 8     Numero de casos

function mensual=climat_mes(A,m,n)






%+++++++++++++++++Complete su codigo aqui+++++++++++++++++++++++++

e=find(A(:,m)==1)'  ;ene=A(e,:)

%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++





promedios_mes=[mean(ene(:,n));mean(feb(:,n));mean(mar(:,n));
mean(abr(:,n));mean(may(:,n));mean(jun(:,n));
mean(jul(:,n));mean(ago(:,n));mean(sep(:,n));
mean(oct(:,n));mean(nov(:,n));mean(dic(:,n))];
promedios_mes=[[1:1:12]',promedios_mes];

maximos_mes=[max(ene(:,n));max(feb(:,n));max(mar(:,n));
max(abr(:,n));max(may(:,n));max(jun(:,n));
max(jul(:,n));max(ago(:,n));max(sep(:,n));
max(oct(:,n));max(nov(:,n));max(dic(:,n))];
maximos_mes=[[1:1:12]',maximos_mes];

minimos_mes=[min(ene(:,n));min(feb(:,n));min(mar(:,n));
min(abr(:,n));min(may(:,n));min(jun(:,n));
min(jul(:,n));min(ago(:,n));min(sep(:,n));
min(oct(:,n));min(nov(:,n));min(dic(:,n))];
minimos_mes=[[1:1:12]',minimos_mes];

desviaciones_mes=[std(ene(:,n));std(feb(:,n));std(mar(:,n));
std(abr(:,n));std(may(:,n));std(jun(:,n));
std(jul(:,n));std(ago(:,n));std(sep(:,n));
std(oct(:,n));std(nov(:,n));std(dic(:,n))];
desviaciones_mes=[[1:1:12]',desviaciones_mes];

medianas_mes=[median(ene(:,n));median(feb(:,n));median(mar(:,n));
median(abr(:,n));median(may(:,n));median(jun(:,n));
median(jul(:,n));median(ago(:,n));median(sep(:,n));
median(oct(:,n));median(nov(:,n));median(dic(:,n))];
medianas_mes=[[1:1:12]',medianas_mes];


mensual=[promedios_mes,desviaciones_mes(:,2),maximos_mes(:,2),minimos_mes(:,2),medianas_mes(:,2)]

%Se incluye columna con coeficiente de variación:
mensual=[mensual,mensual(:,3)./mensual(:,2).*100]
save mensual.txt mensual

% Graficando los resultados del reporte mensual:
xx=1:6;yy=1:12;
[xxx,yyy]=meshgrid(xx,yy);
zzz=mensual;zzz(:,1)=[];
mesh(xxx,yyy,zzz);
xlabel('estadisticos'); ylabel('meses'); zlabel('temp');
title('Despliegue tridimensional de la tabla de estadisticos mensuales');


endfunction
