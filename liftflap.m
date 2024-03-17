function liftf=liftflap(a)
    Z=importdata('naca4412.txt');
    S=rotacio(10,Z);
    writematrix(S,'D:\XFOIL6.99\nacaROT.txt','Delimiter',' ');
    V=["load nacaROT.txt","NACA","gdes","flap",0.7,999,0.5,a,"eXec"," ","oper","v 3e6",...
        "seqp","pacc","resultados.txt"," ","a 0","a 0","a 0","a 0","a 0",...
        "a 0","a 0","a 0","a 0","a 0","a 0","a 0","a 0","a 0","a 0","a 0",...
        "a 0","a 0","a 0","a 0","a 0","a 0","a 0","a 0","a 0","a 0","a 0"]';
    writematrix(V,'D:\XFOIL6.99\comandamentsf.txt');
    if exist('resultados.txt', 'file')==2
        delete('resultados.txt');
    end
    ! xfoil < comandamentsf.txt
    t=readtable('resultados.txt');
    res=table2array(t);
    a
    liftf=-res(1,2)
end
