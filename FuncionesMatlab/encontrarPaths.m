function [paths,pathAG]=encontrarPaths(guivar)
    cd ..
        
    pathEsp=[pwd '\DatosEsp1\'];
    pathIng=[pwd '\DatosIng1\'];
    pathAle=[pwd '\DatosAle1\'];
    pathIta=[pwd '\DatosIta1\'];
    pathFra=[pwd '\DatosFra1\'];
    paths={pathEsp;pathIng;pathAle;pathIta;pathFra};
    pathAG=[pwd '\AlgoritmoGenetico\'];
    
    if exist('guivar')
        cd NNSPGUI
    else
        cd FuncionesMatlab
    end
end