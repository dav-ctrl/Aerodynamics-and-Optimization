function liftf=calcularliftf(a)
    S=["naca 4412","gdes","flap",0.8,999,0.5,a,"eXec"," ","oper","v 110e6",...
        "seqp","pacc","resultados.txt"," ","a 0","a 0","a 0","a 0","a 0"]'
    writematrix(S,'D:\XFOIL6.99\comandamentsf.txt');
    if exist('resultados.txt', 'file')==2
        delete('resultados.txt');
    end
    ! xfoil < comandamentsf.txt
    t=readtable('resultados.txt');
    res=table2array(t);
    a
    drag=res(1,2)
end
