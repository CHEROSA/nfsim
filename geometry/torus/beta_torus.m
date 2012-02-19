function [bi, Dbi, D2bi] = beta_torus(q, qc, r, R, rot)
%BETA_TORUS     single torus implicit function and gradient.
%
% See also BETA_TORI, PLOT_TORUS.
%
% File:      beta_torus.m
% Author:    Ioannis Filippidis, jfilippidis@gmail.com
% Date:      2010.11.24 - 2011.09.11
% Language:  MATLAB R2011a
% Purpose:   torus \beta_i implicit function
% Copyright: Ioannis Filippidis, 2010-

%todo: D2bi

npnt = size(q, 2);

qi = rot.' *bsxfun(@minus, q, qc); % homogenous transform

bi = nan(1, npnt);

x = qi(1, :);
y = qi(2, :);
z = qi(3, :);

nqi2 = vnorm(qi, 1, 2).^2;

bi(1, :) = (nqi2 +R^2 -r^2).^2 -4 *R^2 *(x.^2 +y.^2);
%bi(bi <= 0) = 0;

Dbi(:, 1:npnt) = 4 .*[x .*(nqi2 -R^2 -r^2);
                      y .*(nqi2 -R^2 -r^2);
                      z .*(nqi2 +R^2 -r^2) ];
                  
Dbi = rot *Dbi;

a1 = 4 .*(3 .*x.^2 +y.^2 +z.^2 -R^2 -r^2);
a2 = 8 .*x .*y;
a3 = 8 .*x .*z;
a4 = 8 .*x .*y;
a5 = 4 .*(x.^2 +3 .*y.^2 +z.^2 -R^2 -r^2);
a6 = 8 .*y .*z;
a7 = 8 .*x .*z;
a8 = 8 .*y .*z;
a9 = 4 .*(x.^2 +y.^2 +3 .*z.^2 +R^2 -r^2);

D2bi = cell(1, npnt);
for i=1:npnt    
    curD2bi = [a1(1, i), a2(1, i), a3(1, i);
               a4(1, i), a5(1, i), a6(1, i);
               a7(1, i), a8(1, i), a9(1, i) ];
    
    curD2bi = rot *curD2bi *rot.';
    D2bi{1, i} = curD2bi;
end

%bi(i, 1) = norm(q-qc, 2).^2 -r^2 ...
%          +R^2 -2 .*R .*sqrt(norm(q-qc, 2).^2 -dot(q-qc, n1).^2) ...
%          +dot(q1./norm(q1,2), n2).^2; % symmetry breaking term
