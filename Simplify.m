% syms x;
% y = 0.6./(0.05).^3.*(0.05+2.*(x-0.25)).*(x-0.30).^2+0.54./(0.05).^3.*(0.05+2.*(0.30-x)).*(x-0.25).^2+1./(0.05)^2.*(x-0.25).*(x-0.30).^2-1.4247./(0.05)^2.*(x-0.30).*(x-0.25).^2;
% y = 1/23*x + 132/23 + (-397/3212088 + 1/3212088*x)*(x - 121)*(x - 144);
% y= -1/2*x^2 + 3/2*x + (-3/4 +1/4*x)*x*(x - 1)*(x - 2);
% coefficients = coeffs(y, x)

% syms x;
% a = sym('a');
% b = sym('b');
% polynomial = -1/2*x^2 + 3/2*x + (a + b*x)*x*(x - 1)*(x - 2);
% diff(polynomial,x)

% A = [10 54.1 ;54.1 303.39];
% B = [52.0336 ;285.48955];
% x = linsolve(A, B)

% syms x y;
% eqn1 = -23*(x+121*y) + 1/23 == 1/22;
% eqn2 = 23*(x+144*y) + 1/23 == 1/24;
% solution = solve([eqn1, eqn2], [x, y])

% 47540031720206335563\13258597302978740224
% 2217244323479594407309/27153607276500459978752
% -3893052259663751827/18889465931478580854784
% 5880743594658235/18889465931478580854784