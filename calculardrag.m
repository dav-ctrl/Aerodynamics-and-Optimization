function drag=calculardrag(a)
    Z=importdata('naca23012.txt');
    S=rotacio(a,Z);
    writematrix(S,'D:\XFOIL6.99\nacaROT.txt','Delimiter',' ');
    if exist('resultados.txt', 'file')==2
        delete('resultados.txt');
    end
    ! xfoil < comandaments.txt
    t=readtable('resultados.txt');
    res=table2array(t);
    a
    drag=res(1,3)
end