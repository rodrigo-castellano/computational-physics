%selecciona datos de octubre de 2011(ficheros 201110*)
>> dates='2003';
%selecciona las estaciones AAA y BBB
>> stations=['KDU';'KNY'];
%selecciona componentes (valen X,Y,Z,F,D,H,I)
>> comps='XYZ';
%representa los datos
>> plotIM2(dates,stations,comps);

