[x1, x2] = meshgrid(-.5:0.05:0.5, -.5:.05:.5);
x1dot = -x1 - 2 *x2 .*x1.^2+x2; %Note the use of .* and .^
x2dot = -x1-x2;
quiver(x1,x2,x1dot, x2dot)
