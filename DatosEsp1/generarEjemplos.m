temp='0506%0607%0708%0809%0910%1011%1112%1213';
r=regexp(temp,'%','split');

load datosPrimeraDiv0506_1213J29
Equipos=textread('AllTeams.txt','%s');
Ej=[];
for i=3:size(temporadas,2) %for de todas las temporadas empezando por la 0708
      tempo=r(i);
      totalPartidos=38;
      
      if i==size(temporadas,2)
         totalPartidos=29; 
      end
      
    for j=1:size(temporadas,1)%For de los equipos
        
        nombreEquipo=temporadas(j,i);
        equipo=strcmp(Equipos(:,1),nombreEquipo);
        datosequipo=datos(:,:,equipo);
    
        for jornada=1:totalPartidos
      
        part=strcat(tempo,num2str(jornada));
        [E,ag]=generarDatos(datos,datosequipo,part);
        
        if ag==1
        Ej=[Ej;E];
        end
        
        end
    end
    
end

save ('EjemplosJ29SP.mat','Ej');