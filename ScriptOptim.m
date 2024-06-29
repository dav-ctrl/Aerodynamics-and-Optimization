% En aquest document estan tots els experiments, incluits al treball o no, que s'han realitzat durant el TFG%

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

patternsearch(@calculardraginv,0,A,b,Aeq,beq,lb,ub,nonlcon,options);

nonlcon=@lifthelpinv

patternsearch(@calculardraginv,0,A,b,Aeq,beq,lb,ub,nonlcon,options);

% Problema multiobjectiu %

f=@(a) [dragflap(a),liftflap(a)];
gamultiobj(f,2);
paretosearch(f,2);

% Front de Pareto %

% Per a cada valor del lift canviem el programa @paretolift introduint el lift
% fixat corresponent 

% Per als valors del lift entre 1.05 i 1.1937 
patternsearch(@dragflap,1,[],[],[],[],0.05,10,@paretolift)

% Per a valors del lift entre 1.2016 i 1.3014
patternsearch(@dragflap,2.2,[],[],[],[],0.05,10,@paretolift)

% Per a valors del lift entre 1.313 i 1.3463
patternsearch(@dragflap,4,[],[],[],[],0.05,10,@paretolift)

% Per a valors del lift entre 1.4070 i 1.4493
patternsearch(@dragflap,5,[],[],[],[],0.05,10,@paretolift)

lift=[1.05,1.06,1.075,1.08,1.0998,1.11,1.1195,1.353,1.1492,1.1648,1.1749,...
    1.1817,1.1937,1.2016,1.2121,1.2237,1.2379,1.2511,1.2684,1.2784,1.2889,...
    1.3014,1.313,1.3217,1.3361,1.3463,1.4070,1.4135,1.4197,1.4383,1.4493];
dragmin=[0.0064,0.00645,0.00654,0.00658,0.00672,0.00678,0.00684,0.00697,...
    0.00708,0.00718,0.00726,0.00733,0.00745,0.0075,0.0076,0.0077,0.0079,...
    0.0080,0.0082,0.0083,0.0085,0.0086,0.00878,0.00891,0.00912,0.00928,...
    0.01128,0.01145,0.01165,0.01238,0.01288]
angflap=[0.206512451171875,0.33984375,0.540985107421875,0.613265991210938,...
    0.884780883789063,1.0244140625,1.154052734375,1.376953125,1.5732421875,...
    1.791015625,1.93310546875,2.03271484375,2.21044921875,2.3230,2.4768,...
    2.6531,2.8646,3.0633,3.3370,3.4932,3.6648,3.8709,4.061328125,4.21171875,...
    4.4619140625,4.64482421875,6.03125,6.1796875,6.33984375,6.842895507812500,7.15576171875]

% Paret de Pareto del coeficient del drag minimitzat respecte del coeficient del lift %

plot(lift,dragmin,'b*')
ylabel('Coeficient drag')
xlabel('Coeficient sustentació')
title('Paret de Pareto del drag minimitzat respecte del lift')

% Gràfica dels angles d'apertura del flap per a cada valor del coeficient del lift %

plot(lift,angflap,'go')
ylabel('Angle apertura flap')
xlabel('Coeficient sustentació')


