[ptas,pathAG]=encontrarPaths;

liga='Espana';



    switch liga
        case 'Espana'
            load datosEsp0506_1213_puntos.mat
            teams=textread([ptas{1} '\' 'AllTeams.txt'],'%s');
            load RedNeuronalSptos2
            s=[ptas{1},'SPFixture1213.xlsx'];
            s=[ptas{1},'Jornada33Esp.xlsx'];
            dir='PartidosJ33Esp_conNombres3.txt';
            jornada='121333';
            par=34;
        case 'Inglaterra'
            load datosIng0506_1213_puntos.mat
            teams=textread([ptas{2} '\' 'AllTeams.txt'],'%s');
            load RedNeuronalEptos2
            s=[ptas{2},'EPFixture1213.xlsx'];
            %s=[ptas{2},'Jornada34Ing.xlsx'];
            dir='PartidosJ35Ing_conNombres.txt';
            jornada='121335';
            par=35;
        case 'Alemania'
            load datosAle0506_1213_puntos.mat
            teams=textread([ptas{3} '\' 'AllTeams.txt'],'%s');
            load RedNeuronalDptos2
            s=[ptas{3},'DPFixture1213.xlsx'];
            %s=[ptas{3},'Jornada31Ale.xlsx'];
            dir='PartidosJ32Ale_conNombres.txt';
            jornada='121332';
            par=32;
        case 'Italia'
            load datosIta0506_1213_puntos.mat
            teams=textread([ptas{4} '\' 'AllTeams.txt'],'%s');
            load RedNeuronalIptos2
            s=[ptas{4},'IPFixture1213.xlsx'];
            %s=[ptas{4},'Jornada34Ita.xlsx'];
            dir='PartidosJ35Ita_conNombres.txt';
            jornada='121335';
            par=35;
        case 'Francia'
            load datosFra0506_1213_puntos.mat
            teams=textread([ptas{5} '\' 'AllTeams.txt'],'%s');
            load RedNeuronalFptos2
            s=[ptas{5},'FPFixture1213.xlsx'];
            %s=[ptas{5},'Jornada34Fra.xlsx'];
            dir='PartidosJ35Fra_conNombres.txt';
            jornada='121335';
            par=35;
    end
    
    [n,t,x]=xlsread(s);
%     f=find(cell2mat(x(:,1))==par);
%     xsub=x(f,2:end);
    xsub=x;
    c={Theta1;Theta2;ms};
    pred=cell(size(x,1),8);

for i=1:size(x,1)
    eqlocal=eliminarEspacios(xsub{i,1});
    eqvis=eliminarEspacios(xsub{i,2});
    [p,h]=predecirPartido(c,datos,teams,eqlocal,eqvis,jornada);

    ap=x(i,3:5);
    pred(i,:)=[xsub(i,1),xsub(i,2),num2cell(h),ap];
    
end
pred
%Sin Nombres
%  fid = fopen([pathAG,'PartidosJ31Esp_conNombres.txt'], 'wt');
% fprintf(fid, [repmat('%g\t', 1, size(pred,2)-1) '%g\n'], roundn(pred,-4).');
% fclose(fid);

%Con Nombres
fid = fopen([pathAG,dir], 'wt');
for i=1:size(pred,1)
fprintf(fid,'%s\t%s\t%g\t%g\t%g\t%g\t%g\t%g\n',pred{i,:});
end
fclose(fid);