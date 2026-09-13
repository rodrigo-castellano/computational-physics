%selecciona datos de octubre de 2011(ficheros 201110*)
dates='2010';
%selecciona las estaciones AAA y BBB
stations=['DOU';'DRV';'IRT';'KDU';'KNY';'MMB';'VIC';];
%selecciona componentes (valen X,Y,Z,F,D,H,I)
comps='FDHI';
%representa los datos
plotIM2(dates,stations,comps);

