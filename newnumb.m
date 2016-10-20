function basis = newnumb() 

syms('x','y','x2','y2','x3','y3','x12','x13','x23','y12','y13','y23');
b = sym(zeros(21));

k=1;
for i=0:5
    for j =0:5
        if i+j<=5
           b(1,k)=(x12^(j))*(y12^(i));
           k=k+1;
        end
     end
end
k=1;
for i=0:5
    for j =0:5
        if i+j<=5
           b(8,k)=(x23^(j))*(y23^(i));
           k=k+1;
        end
     end
end
k=1;
for i=0:5
    for j =0:5
        if i+j<=5
           b(15,k)=(x13^(j))*(y13^(i));
           k=k+1;
        end
     end
end

for k=1:21 
%vn
    b(7,k)=-diff(b(1,k),y12);
    b(14,k)=1/sqrt(2)*diff(b(8,k),x23)+1/sqrt(2)*diff(b(8,k),y23);
    b(21,k)=-diff(b(15,k),x13);  
end   
k=1;

for i=0:5
    for j =0:5
        if i+j<=5
           b(1,k)=(x^(j))*(y^(i));
           k=k+1;
        end
     end
end
k=1;
for i=0:5
    for j =0:5
        if i+j<=5
           b(8,k)=(x2^(j))*(y2^(i));
           k=k+1;
        end
     end
end
k=1;
for i=0:5
    for j =0:5
        if i+j<=5
           b(15,k)=(x3^(j))*(y3^(i));
           k=k+1;
        end
     end
end

for k=1:21
    %vx
    b(2,k)=diff(b(1,k),x);
    b(9,k)=diff(b(8,k),x2);
    b(16,k)=diff(b(15,k),x3);
    %vy
    b(3,k)=diff(b(1,k),y);
    b(10,k)=diff(b(8,k),y2);
    b(17,k)=diff(b(15,k),y3);
    %vxx
    b(4,k)=diff(b(2,k),x);
    b(11,k)=diff(b(9,k),x2);
    b(18,k)=diff(b(16,k),x3);
    %vyy
    b(5,k)=diff(b(3,k),y);
    b(12,k)=diff(b(10,k),y2);
    b(19,k)=diff(b(17,k),y3);
    %vxy
    b(6,k)=diff(b(2,k),y);
    b(13,k)=diff(b(9,k),y2);
    b(20,k)=diff(b(16,k),y3);
   
end
A= subs(b, x,0);
A= subs(A, y,0);

A= subs(A, x2,1);
A= subs(A, y2,0);

A= subs(A, x3,0);
A= subs(A, y3,1);

A= subs(A, x13,0);
A= subs(A, y13,0.5);

A= subs(A, x23,0.5);
A= subs(A, y23,0.5);

A= subs(A, x12,0.5);
A= subs(A, y12,0);

B = A\eye(21);
basis=sym(zeros(21,1));
for i=1:21
    for j=1:21
        if(abs(B(i,j)) < 10^-6)
            B(i,j) = 0;
        end
    end 
end
for i=1:21
    basis(i) = b(1,:)*B(:,i);
end
