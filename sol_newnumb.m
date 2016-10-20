syms x y;
format long
f = sym(zeros(21,1));

f = newnumb();
lambda = 12.8205;
mu = 5.4959;
A = zeros(21);

for i=1:21
    for j=1:21
        F = lambda*(lap(f(i))*lap(f(j))) + mu*(biharm(f(i),f(j)));
        A(i,j) = int(int(F,x,0,1-y),y,0,1);
    end
end
%{
N = 6;
B = [1 2 3 9 15 8; 17 16 15 9 3 10; 3 4 5 11 17 10; 19 18 17 11 5 12;...
    5 6 7 13 19 12; 21 20 19 13 7 14];

GK = zeros(max(max(B)));
for j=1:N
    GK(B(j,:),B(j,:)) = GK(B(j,:),B(j,:)) + A;
end
GK2 = GK( 9:13, 9:13);
L = [100,-200,100,0,0]; 
U = GK2\L';
U1 = [0 ; U ; 0];
%}
