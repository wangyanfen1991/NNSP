temp='0506%0607%0708%0809%0910%1011%1112%1213';
r=regexp(temp,'%','split');

paths=encontrarPaths;
path=paths{4};%paths{1} Espana
              %paths{2} Inglaterra
              %paths{3} Alemania
              %paths{4} Italia

%load datosPrimeraDiv0506_1213J29
load datosIta0506_1213.mat
Equipos=textread([path 'AllTeams.txt'],'%s');
EjIta=[];
for i=3:size(temporadas,2) %for de todas las temporadas empezando por la 0708
      tempo=r(i)
      totalPartidos=38;
      
      if i==size(temporadas,2)
         totalPartidos=30; 
      end
      
    for j=1:size(temporadas,1)%For de los equipos

        nombreEquipo=temporadas(j,i)
        equipo=strcmp(Equipos(:,1),nombreEquipo);
        datosequipo=datos(:,:,equipo);
    
        for jornada=1:totalPartidos

        part=strcat(char(tempo),num2str(jornada));
        [E,ag]=generarDatos(datos,datosequipo,part);
        
        if ag==1
        EjIta=[EjIta;E];
        end
        
        end
    end
    
end

save ('EjemplosJ29IP.mat','EjIta');
