%[3   -32    52;4   -85   113;5  -159   198;6  -254   307]


numPar=input('Digite el numero de personas que se reunieron:\n');
umbral=input('Digite el numero del umbral que se pacto desde el inicio para la codificacion:\n');



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
    newsuma=0;
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
mesnum