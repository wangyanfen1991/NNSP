function [p,h] = predecirResultados(liga,nombreLocal,nombreVis,jornada)

    ptas=encontrarPaths;

    switch liga
        case 'Espana'
            load datosPrimeraDiv0506_1213J29.mat
            teams=textread([ptas{1} '\' 'AllTeams.txt'],'%s');
            load RedNeuronalSEDI
        case 'Inglaterra'
            load datosIng0506_1213.mat
            teams=textread([ptas{2} '\' 'AllTeams.txt'],'%s');
            load RedNeuronalSEDI
        case 'Alemania'
            load datosAle0506_1213.mat
            teams=textread([ptas{3} '\' 'AllTeams.txt'],'%s');
            load RedNeuronalSEDI
        case 'Italia'
            load datosIta0506_1213.mat
            teams=textread([ptas{4} '\' 'AllTeams.txt'],'%s');
            load RedNeuronalSEDI
    end
    c={Theta1;Theta2;ms};
    [p,h]=predecirPartido(c,datos,teams,nombreLocal,nombreVis,jornada);
    

end