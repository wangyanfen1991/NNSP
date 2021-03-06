function [d,ag]=encontrarPartidoFuzzy(datosequipo,ymin,ymax, parametro, ventana, numpartido, nombreequipo)

%ventana puede ser un string o un numero
%datos es un cell de 2 dimensiones que es el resultado de cada equipo.

d={};
ptsacum=0;
pos=0;
ag=1;
ventanaz=5;
if strcmp(numpartido,'ultimo')
       numpartido=ultimoPartido(datosequipo);%Encontrar ultimo partido
end

if (strcmp(parametro,'local'))
    inddat=[datosequipo{:,3}]==1;
    dat=datosequipo(inddat,:);
        d1=size(dat,1);%Ultima Fila
    
     

     te=str2double(numpartido(1:4));
    pj=str2double(numpartido(5:end));

    flag=0;
    while d1>0 && flag==0
        ultenf=char(dat(d1,1));
        teult=str2double(ultenf(1:4));
        pjult=str2double(ultenf(5:end));

        %El ultimo partido debe ser de igual temporada y menor jornada O
        %de menor temporada
        if teult>te
            d1=d1-1;
        elseif teult == te %Si son de la misma temporada la jornada tiene que ser menor
            if pj>pjult
                numpartido=ultenf;
                flag=1;
            else
                d1=d1-1;
            end
        else
            numpartido=ultenf;
            flag=1;
        end
        
    end
    

    
    if size(dat,1)==0
        d=zeros(1,ventanaz);
        ag=0;
    else
    
    d=PartidosFuzzy(dat,ventana,numpartido,ymin,ymax);
    end
elseif(strcmp(parametro,'visitante'))
    inddat=[datosequipo{:,3}]==2;
    dat=datosequipo(inddat,:);
        d1=size(dat,1);%Ultima Fila
    
     

     te=str2double(numpartido(1:4));
    pj=str2double(numpartido(5:end));

    flag=0;
    while d1>0 && flag==0
        ultenf=char(dat(d1,1));
        teult=str2double(ultenf(1:4));
        pjult=str2double(ultenf(5:end));

        %El ultimo partido debe ser de igual temporada y menor jornada O
        %de menor temporada
        if teult>te
            d1=d1-1;
        elseif teult == te %Si son de la misma temporada la jornada tiene que ser menor
            if pj>pjult
                numpartido=ultenf;
                flag=1;
            else
                d1=d1-1;
            end
        else
            numpartido=ultenf;
            flag=1;
        end
        
    end
    

    if size(dat,1)==0
        d=zeros(1,ventanaz);
        ag=0;
    else
    
    d=PartidosFuzzy(dat,ventana,numpartido,ymin,ymax);
    end
elseif(strcmp(parametro,'equipo'))
    
    inddat= strcmp(datosequipo(:,2),nombreequipo);
    dat=datosequipo(inddat,:);
    d1=size(dat,1);%Ultima Fila
    
    te=str2double(numpartido(1:4));
    pj=str2double(numpartido(5:end));

    flag=0;
    while d1>0 && flag==0
        ultenf=char(dat(d1,1));
        teult=str2double(ultenf(1:4));
        pjult=str2double(ultenf(5:end));

        %El ultimo partido debe ser de igual temporada y menor jornada O
        %de menor temporada
        if teult>te
            d1=d1-1;
        elseif teult == te %Si son de la misma temporada la jornada tiene que ser menor
            if pj>pjult
                numpartido=ultenf;
                flag=1;
            else
                d1=d1-1;
            end
        else
            numpartido=ultenf;
            flag=1;
        end
        
    end
    
    

    if size(dat,1)==0
        d=zeros(1,ventanaz);
        ag=0;
    else

    d=PartidosFuzzy(dat,ventana,numpartido,ymin,ymax);
    end
    
elseif(strcmp(parametro,'equipovisitante'))%Contra un equipo jugando de visitante
    
    inddat= strcmp(datosequipo(:,2),nombreequipo);
    dat=datosequipo(inddat,:);
    inddat=[dat{:,3}]==2;
    dat=dat(inddat,:);
    d1=size(dat,1);%Ultima Fila
    
     

     te=str2double(numpartido(1:4));
    pj=str2double(numpartido(5:end));

    flag=0;
    while d1>0 && flag==0
        ultenf=char(dat(d1,1));
        teult=str2double(ultenf(1:4));
        pjult=str2double(ultenf(5:end));

        %El ultimo partido debe ser de igual temporada y menor jornada O
        %de menor temporada
        if teult>te
            d1=d1-1;
        elseif teult == te %Si son de la misma temporada la jornada tiene que ser menor
            if pj>pjult
                numpartido=ultenf;
                flag=1;
            else
                d1=d1-1;
            end
        else
            numpartido=ultenf;
            flag=1;
        end
        
    end
     
 
    if size(dat,1)==0
        d=zeros(1,ventanaz);
        ag=0;
    else
    
    d=PartidosFuzzy(dat,ventana,numpartido,ymin,ymax);
    end
elseif(strcmp(parametro,'equipolocal'))%Contra un equipo jugando de local
    
    inddat= strcmp(datosequipo(:,2),nombreequipo);
    dat=datosequipo(inddat,:);
    inddat=[dat{:,3}]==1;
    dat=dat(inddat,:);
    d1=size(dat,1);%Ultima Fila
    
     

     te=str2double(numpartido(1:4));
    pj=str2double(numpartido(5:end));

    flag=0;
    while d1>0 && flag==0
        ultenf=char(dat(d1,1));
        teult=str2double(ultenf(1:4));
        pjult=str2double(ultenf(5:end));

        %El ultimo partido debe ser de igual temporada y menor jornada O
        %de menor temporada
        if teult>te
            d1=d1-1;
        elseif teult == te %Si son de la misma temporada la jornada tiene que ser menor
            if pj>pjult
                numpartido=ultenf;
                flag=1;
            else
                d1=d1-1;
            end
        else
            numpartido=ultenf;
            flag=1;
        end
        
    end
    
    
    

    if size(dat,1)==0
        d=zeros(1,ventanaz);
        ag=0;
    else
    d=PartidosFuzzy(dat,ventana,numpartido,ymin,ymax);
    end
    
elseif(strcmp(parametro,'general'))
    

    [dmy,d1]=ultimoPartido(datosequipo);%Ultima Fila
    dat=datosequipo;
    te=str2double(numpartido(1:4));
    pj=str2double(numpartido(5:end));

    flag=0;
    while d1>0 && flag==0
        ultenf=char(dat(d1,1));
        teult=str2double(ultenf(1:4));
        pjult=str2double(ultenf(5:end));

        %El ultimo partido debe ser de igual temporada y menor jornada O
        %de menor temporada
        if teult>te
            d1=d1-1;
        elseif teult == te %Si son de la misma temporada la jornada tiene que ser menor
            if pj>pjult
                numpartido=ultenf;
                flag=1;
            else
                d1=d1-1;
            end
        else
            numpartido=ultenf;
            flag=1;
        end
        
    end
    
    
 if size(dat,1)==0
        d=zeros(1,ventanaz);
        ag=0;
 else
 
 d=PartidosFuzzy(dat,ventana,numpartido,ymin,ymax);
 end
 
else
    d={};
end

end
