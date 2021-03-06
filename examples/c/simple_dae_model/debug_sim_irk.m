clear variables
close all
clc

generate_casadi_functions()

M = [   1.05000,   0.00000,   0.00000,  -0.10000; ... 
        0.00000,   1.05000,  -0.10000,   0.00000; ... 
       -0.05000,   0.00000,   1.00000,   0.00000; ... 
        0.00000,  -0.05000,   0.00000,   1.00000 ];

res = [   -1.00000 
          -0.05070; 
           1.00000; 
           0.05070;
      ];

x0 = [   -1.00000; 
         -0.05070 
 ];

xt = [   -1.00000; 
         -0.05070 
 ];

z0 = [0; 0];
u0 = [0; 0];
u0(1) = 0.0; u0(2) = 0.000000;

delta = M\res

K =     0*[    0.94735; 
            -0.04244; 
            -0.95263; 
            -0.05282; 
];

K = K - delta

%% Set up States & Controls
k_sol = K(1:2);
z_sol = K(3:4);

x_sol = x0 + 0.1*0.5*k_sol

f_eval     =        [ k_sol(1)+x_sol(1)-0.1*z_sol(2)-u0(1); ...
                      k_sol(2)+x_sol(2)-0.1*z_sol(1)-u0(2);  ...
                      z_sol(1)-x_sol(1); ...
                      z_sol(2)-x_sol(2)]
