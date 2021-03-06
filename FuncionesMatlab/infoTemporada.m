function C=infoTemporada(equipo,temporada,tempo)

    %PartidoRival H/A FTHG FTAG FTR HS AS HST AST HF AF
    %HC AC HY AY HR AR 
    C=cell(1,21);
    i=2;
    j=1;
    puntos=0;
    while i<=size(temporada,1)%todas las jornadas
        temporada(i,3)={eliminarEspacios(char(temporada(i,3)))};
        temporada(i,4)={eliminarEspacios(char(temporada(i,4)))};
        b=estaEnArreglo(equipo,temporada(i,:)');
        
        if b==0
            i=i+1;
        else
            juego=temporada(i,:);
            [ha,Rival]=HomeAway(equipo,juego);
            [par,FTR]=obtenerParametros(juego);
            p=calcularPuntos(ha,FTR);
            puntos=puntos+p;
            tempor=char([char(tempo) num2str(j)]);
            C(j,:)=[tempor, Rival, ha, par,puntos];%Separado temporada y jornada
            i=i+1;
            j=j+1;
        end
       
    end
end