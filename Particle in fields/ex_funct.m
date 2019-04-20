function [ dr ] = ex_funct( t,r )
global w ch_x ch_vx ch_t;
dr = zeros(2,1);
x = r(1); vx = r(2);
dr(1) = vx;
dr(2) = -w^2*(ch_t/ch_x)^2*sin(x*ch_x);

end