function ElSecretoDeShamir
clc;
fprintf('   Metodo de Incriptacion de Shamir\n\n');
sw=0;
while sw==0
    opt=input('Digite el numero correspodiente a la accion que desea calcular:\n1.Encriptar un mensaje \n2.Desencriptar un mensaje\n3.Salir\n');
    if opt==1
     %%Parte que esconde el mensaje
        clc;
        mensaje=input('Digite el secreto:\n','s');
        integrantes=input('Digite el numero de integrantes a los que les quiere compartir el secreto:\n');
        umbral=input('Digite el umbral que desea:\n');
        fprintf('Los puntos son:\n');
        c=encriptar(integrantes,mensaje,umbral)
        %fprintf('%d',c);
    else
        if opt==2
            %%Parte que encuentra el mensaje
            clc;
            numIntegra=input('Digite el numero de personas que tienen una parte del secreto:\n');
            numPar=input('Digite el numero de personas estan reunidas:\n');
            umbral=input('Digite el numero del umbral que se pacto desde el inicio para la codificacion:\n');

            if numPar >= umbral && numPar <= numIntegra
                mensaje=desencriptar(umbral);
                mensaje=diccionario2(mensaje);
                newcadena=replace(mensaje,'*',' ')             
            else
                fprintf('NO HAY EL NUMERO DE PERSONAS NECESARIAS PARA DECODIFICAR EL SECRETO\n\n');
            end
            sw=0;
        else
            if opt==3
                %%cierre del menú
                sw=1;
            end

        end
    end
end



end
%%Funcion que esconde el mensaje
function [puntos]=encriptar (numPerson,mensaje,umbral)    
%%Esta parte de aquí lo que hace es calcular los puntos o cordenadas
%%que se le va a dar a cada miembro 
    Y=diccionario(mensaje,umbral);%%Vector con los valores de cada caracter traducido 
    n=umbral-1;%%El grado del polinomia es uno menos al umbral requerido para desifrar el mensaje
    X=0:1:umbral-1;%%Vector con los valores de x, van de 0,1,2,3,.., hasta el umbral menos uno
    x0=X(length(X))+1:1:X(length(X))+numPerson;%%Los valores que con los cuales se van a evaluar la funcion, empizan uno mas el ultimo valor que tiene el vector X
    %%Calcula los Li(X)
    vecpuntos= zeros(numPerson,round(length(Y)/umbral)+1);%%Esta matriz me almacena los puntos, cada grupo de tamaño igual al numePersonas, se almacena en filas y las columnas son el numero de puntos obtenidos
    indiceY=0;%%Esto me controla los valores de Y que estoy tomando para divicion igual al umbral
    np=1;
    while np <= round(length(Y)/umbral)%%Genera los pares de puntos necesarios para numero de personas que se divide el secreto
        tem=1;%%Me controla cuantos puntos se generar 
        indx0=0;%%Me controla los valores para los cuales voy a evaluar 
        puntos=size(numPerson);%%Se almacena temporalmente los puntos que voy opteniendo
        while tem<=numPerson%Me genera los puntos que necesito para cada persona, genera de a uno para cada persona 
            suma=0;
            indx0=indx0+1;
            for i=1:n+1
                productoria=1;
                for j=1:n+1
                    if (j~=i)
                        productoria=productoria*((x0(indx0)-X(j))/(X(i)-X(j)));
                    end
                end
                suma=suma+Y(indiceY+i)*productoria;
                puntos(tem)=suma;
            end
            tem=tem+1;
        end        
        for i=1:1:length(puntos)
             if np == 1
                 vecpuntos(i,np)=x0(i);
             end                
             vecpuntos(i,np+1)=puntos(i);
        end
        indiceY=indiceY+umbral;
        np=np+1;
    end
    puntos=vecpuntos;
end
%%Funcion que se encarga de dividir en caracteres el mensaje
function [cadenadiv]=divcaracteres (mensaje,umbral)
    cadena=mensaje;
    newcadena=replace(cadena,' ','*');
    while ( mod(length(newcadena),umbral) ~= 0 )
        newcadena=strcat(newcadena,'*');
    end
    c=string(size(length(newcadena)));
    for i=1:length(newcadena)
        c(i)=newcadena(i);
    end
    cadenadiv=c;
end
%%Funcion diccionario para incriptar
function [mensaje]=diccionario(secreto,umbral)
mensajediv=string(divcaracteres(secreto,umbral));%%vector con el mensaje ya dividido en caracteres
mensajenum=size(length(mensajediv));%%vecros con el mensaje traducido al valor numerico
tem=1;
for i=1:1:length(mensajediv)%%Se recorre todo el vector con el mensaje dividido y se hace la traduccion a su correspondiente valor numerico
    switch mensajediv(i)
       case 'a'
          mensajenum(tem)=30;
          tem=tem+1;
       case 'b'
          mensajenum(tem)=1;
          tem=tem+1;
       case 'c'
          mensajenum(tem)=2;
          tem=tem+1;
       case 'd'
          mensajenum(tem)=3;
          tem=tem+1;
       case 'e'
          mensajenum(tem)=4;
          tem=tem+1;
       case 'f'
          mensajenum(tem)=5;
          tem=tem+1;
       case 'g'
          mensajenum(tem)=6;
          tem=tem+1;
       case 'h'
          mensajenum(tem)=7;
          tem=tem+1;
       case 'i'
          mensajenum(tem)=8;
          tem=tem+1;
       case 'j'
          mensajenum(tem)=9;
          tem=tem+1;
       case 'k'
          mensajenum(tem)=10;
          tem=tem+1;
       case 'l'
          mensajenum(tem)=11;
          tem=tem+1;
       case 'm'
          mensajenum(tem)=12;
          tem=tem+1;
       case 'n'
          mensajenum(tem)=13;
          tem=tem+1;
       case 'ñ'
          mensajenum(tem)=14;
          tem=tem+1;
       case 'o'
          mensajenum(tem)=15;
          tem=tem+1;
       case 'p'
          mensajenum(tem)=16;
          tem=tem+1;
       case 'q'
          mensajenum(tem)=17;
          tem=tem+1;
       case 'r'
          mensajenum(tem)=18;
          tem=tem+1;
       case 's'
          mensajenum(tem)=19;
          tem=tem+1;
       case 't'
          mensajenum(tem)=20;
          tem=tem+1;
       case 'u'
          mensajenum(tem)=21;
          tem=tem+1;
       case 'v'
          mensajenum(tem)=22;
          tem=tem+1;
       case 'w'
          mensajenum(tem)=23;
          tem=tem+1;
       case 'x'
          mensajenum(tem)=24;
          tem=tem+1;
       case 'y'
          mensajenum(tem)=25;
          tem=tem+1;
       case 'z'
          mensajenum(tem)=26;
          tem=tem+1;
       case '.'
          mensajenum(tem)=27;
          tem=tem+1;
       case '¿'
          mensajenum(tem)=28;
          tem=tem+1;
       case '?'
          mensajenum(tem)=29;
          tem=tem+1;
       case '*'
          mensajenum(tem)=0;
          tem=tem+1;
       otherwise
          disp('Coloque el mensaje en minusculas y no use caracteres especiales, solo se aceptan los signos de interrogacion')
   end
end
mensaje=mensajenum;
end



%%Funcion que encuentra el mensaje
function [mensaje] = desencriptar (umbral)
    puntos=input('Digite los numeros que les fueron dados de la siguinte manera [Vo,V1,V2,...; Vo,V1,V2,...;...]: \n');
    [f,c]=size(puntos);
    x=size(f);
    y=zeros(f,c-1);
    xo=0:1:umbral-1;
    for i=1:1:f
        for j=2:1:c
            y(i,j-1)=puntos(i,j);
        end
        x(i)=puntos(i,1);
    end
    tm1=1;
    mesnum=zeros(umbral,umbral-1);
    while tm1 <= size(y,2)
        n=umbral-1;
        tm=1;
        indicex0=0;
        while tm <= length(xo)
            suma=0;
            indicex0=indicex0+1;
            for i=1:n+1
                productoria=1;
                for j=1:n+1
                    if (j~=i)
                        productoria=productoria*((xo(indicex0)-x(j))/(x(i)-x(j)));
                    end
                end
                suma=suma+y(i,tm1)*productoria;
            end
            mesnum(tm,tm1)=suma;
            tm=tm+1;
            %fprintf('El valor de Xo es igual a: %f\n',suma);
        end
        tm1=tm1+1;
    end
    mensaje=mesnum;
end
%%Funcion diccionario para desencriptar
function mensaje=diccionario2(Puntos)
mensajediv=Puntos;%%vector con el mensaje ya dividido en caracteres
mensajenum='';%%vecros con el mensaje traducido
tem=1;
for i=1:1:size(mensajediv,2)%%Se recorre todo el vector con el mensaje dividido y se hace la traduccion a su correspondiente valor numerico
    for j=1:1:size(mensajediv,1)
        switch mensajediv(j,i)
           case 0
              mensajenum=strcat(mensajenum,'*');
              tem=tem+1;
           case 1
              mensajenum=strcat(mensajenum,'b');
              tem=tem+1;
           case 2
              mensajenum=strcat(mensajenum,'c');
              tem=tem+1;
           case 3
              mensajenum=strcat(mensajenum,'d');
              tem=tem+1;
           case 4
              mensajenum=strcat(mensajenum,'e');
              tem=tem+1;
           case 5
              mensajenum=strcat(mensajenum,'f');
              tem=tem+1;
           case 6
              mensajenum=strcat(mensajenum,'g');
              tem=tem+1;
           case 7
              mensajenum=strcat(mensajenum,'h');
              tem=tem+1;
           case 8
              mensajenum=strcat(mensajenum,'i');
              tem=tem+1;
           case 9
              mensajenum=strcat(mensajenum,'j');
              tem=tem+1;
           case 10
              mensajenum=strcat(mensajenum,'k');
              tem=tem+1;
           case 11
              mensajenum=strcat(mensajenum,'l');
              tem=tem+1;
           case 12
              mensajenum=strcat(mensajenum,'m');
              tem=tem+1;
           case 13
              mensajenum=strcat(mensajenum,'n');
              tem=tem+1;
           case 14
              mensajenum=strcat(mensajenum,'ñ');
              tem=tem+1;
           case 15
              mensajenum=strcat(mensajenum,'o');
              tem=tem+1;
           case 16
              mensajenum=strcat(mensajenum,'p');
              tem=tem+1;
           case 17
              mensajenum=strcat(mensajenum,'q');
              tem=tem+1;
           case 18
              mensajenum=strcat(mensajenum,'r');
              tem=tem+1;
           case 19
              mensajenum=strcat(mensajenum,'s');
              tem=tem+1;
           case 20
              mensajenum=strcat(mensajenum,'t');
              tem=tem+1;
           case 21
              mensajenum=strcat(mensajenum,'u');
              tem=tem+1;
           case 22
              mensajenum=strcat(mensajenum,'v');
              tem=tem+1;
           case 23
              mensajenum=strcat(mensajenum,'w');
              tem=tem+1;
           case 24
              mensajenum=strcat(mensajenum,'x');
              tem=tem+1;
           case 25
              mensajenum=strcat(mensajenum,'y');
              tem=tem+1;
           case 26
              mensajenum=strcat(mensajenum,'z');
              tem=tem+1;
           case 27
              mensajenum=strcat(mensajenum,'.');
              tem=tem+1;
           case 28
              mensajenum=strcat(mensajenum,'¿');
              tem=tem+1;
           case 29
              mensajenum=strcat(mensajenum,'?');
              tem=tem+1;
           case 30
              mensajenum=strcat(mensajenum,'a');
              tem=tem+1;
           otherwise
              disp('Coloque el mensaje en minusculas y no use caracteres especiales, solo se aceptan los signos de interrogacion')
        end
   end
end
mensaje=mensajenum;
end