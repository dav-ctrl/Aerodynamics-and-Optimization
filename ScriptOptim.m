% Perfil NACA 4412 %

% Cal canviar el document de importdata a 'naca4412.txt' en la funció @calculardrag 

fminunc(@calculardrag,0)
fminunc(@calculardrag,1)
fminunc(@calculardrag,2)
fminunc(@calculardrag,2.5)
fminunc(@calculardrag,3.1)
fminunc(@calculardrag,4)
fminunc(@calculardrag,5)
fminunc(@calculardrag,7)
fminunc(@calculardrag,8)
fminunc(@calculardrag,12)


% Perfil NACA 23012%

% Cal canviar el document de importdata a 'naca23012.txt' en la funció @calculardrag 


% PROVES fminunc SENSE CANVIAR PARÀMETRES %
fminunc(@calculardrag,0)
fminunc(@calculardrag,1)
fminunc(@calculardrag,2)

% PROVES fminunc CANVIANT PARÀMETRES %

% Prova amb DiffMinChange = 1 
opts = optimoptions(@fminunc,'Display','iter','DiffMinChange',1); 
fminunc(@calculardrag,0,opts)

% Prova amb DiffMinchange = 0.01

opts = optimoptions(@fminunc,'Display','iter','DiffMinChange',0.01); 
fminunc(@calculardrag,0,opts)

% Prova amb FiniteDifferenceStepSize = eps^(1/3)

opts = optimoptions(@fminunc,'Display','iter','FiniteDifferenceStepSize',eps^(1/3));
fminunc(@calculardrag,0,opts)

% Prova amb FiniteDifferenceType = 'central'

opts = optimoptions(@fminunc,'Display','iter','FiniteDifferenceType','central');
fminunc(@calculardrag,0,opts)

% Prova combinant FiniteDifferenceStepSize = eps^(1/3) i FiniteDifferenceType = 'central'

opts = optimoptions(@fminunc,'Display','iter','FiniteDifferenceStepSize', eps^(1/3),...
    'FiniteDifferenceType','central');
fminunc(@calculardrag,0,opts)

% Prova combinant DiffMinChange = 1 i FiniteDifferenceType = 'central'

opts = optimoptions(@fminunc,'Display','iter','DiffMinChange',1,...
    'FiniteDifferenceType','central');
fminunc(@calculardrag,0,opts)

% Prova combinant DiffMinChange = 0.01 i FiniteDifferenceType = 'central'

opts = optimoptions(@fminunc,'Display','iter','DiffMinChange',0.01,...
    'FiniteDifferenceType','central');
fminunc(@calculardrag,0,opts)

% Prova combinant DiffMinChange = 1 i FiniteDifferenceStepSize = eps^(1/3)

opts = optimoptions(@fminunc,'Display','iter','DiffMinChange',1,...
    'FiniteDifferenceStepSize',eps^(1/3));
fminunc(@calculardrag,0,opts)

% Prova combinant DiffMinChange = 0.01 i FiniteDifferenceStepSize = eps^(1/3)

opts = optimoptions(@fminunc,'Display','iter','DiffMinChange',0.01,...
    'FiniteDifferenceStepSize',eps^(1/3));
fminunc(@calculardrag,0,opts)

% Prova combinant DiffMinChange = 1, FiniteDifferenceStepSize = eps^(1/3) i
% FiniteDifferenceStepSize = eps^(1/3)

opts = optimoptions(@fminunc,'Display','iter','DiffMinChange',1,...
    'FiniteDifferenceStepSize',eps^(1/3),'FiniteDifferenceType','central');
fminunc(@calculardrag,0,opts)

% Prova combinant DiffMinChange = 0.01, FiniteDifferenceStepSize = eps^(1/3) i
% FiniteDifferenceStepSize = eps^(1/3)

opts = optimoptions(@fminunc,'Display','iter','DiffMinChange',0.01,...
    'FiniteDifferenceStepSize',eps^(1/3),'FiniteDifferenceType','central');
fminunc(@calculardrag,0,opts)

% PROVES AMB patternsearch %

% Proves per a minimitzar @calculardrag %
options = optimoptions('patternsearch','Display','iter');
A = [];
b = [];
Aeq = [];
beq = [];
lb = [];
ub = [];
nonlcon = [];
patternsearch(@calculardrag,-0.7,A,b,Aeq,beq,lb,ub,nonlcon,options);
patternsearch(@calculardrag,0,A,b,Aeq,beq,lb,ub,nonlcon,options);
patternsearch(@calculardrag,1,A,b,Aeq,beq,lb,ub,nonlcon,options);
patternsearch(@calculardrag,1.5,A,b,Aeq,beq,lb,ub,nonlcon,options);
patternsearch(@calculardrag,2,A,b,Aeq,beq,lb,ub,nonlcon,options);
patternsearch(@calculardrag,2.9,A,b,Aeq,beq,lb,ub,nonlcon,options);

% Proves per a minimitzar @calculardrag mantenint el lift negatiu %

nonlcon=@lifthelp


