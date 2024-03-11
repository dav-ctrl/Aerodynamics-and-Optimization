function [a,lift]=calcularliftinv(a)
    Z=importdata('naca6412.txt');
    Z=[Z(:,1),-Z(:,2)];
    S=rotacio(a,Z);
    writematrix(S,'D:\XFOIL6.99\nacaROT.txt','Delimiter',' ');
    if exist('resultados.txt', 'file')==2
        delete('resultados.txt');
    end
    ! xfoil < comandaments.txt
    t=readtable('resultados.txt');
    res=table2array(t);
    a
    lift=res(1,2)
end