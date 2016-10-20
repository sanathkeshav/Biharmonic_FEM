clear all;
close all;
A= dlmread('local_stiffness.txt');
B = dlmread('connectivity.txt');
L = dlmread('load1.txt');
L=-L;
GK = zeros(max(max(B)));
GL = zeros(max(max(B)),1);
N=450;
n = 15;
m = 15;
for j=1:N
    GK(B(j,:),B(j,:)) = GK(B(j,:),B(j,:)) + A;
    GL(B(j,:),1) = GL(B(j,:),1) + L;
end

k=1;
%k1 = 9*n+7;
k2 = 7*n+1;
%k3 = 7*n+2;
%k4 = 7*n+3;

%DEL =[k k1 k2 k3 k4];
DEL =[k k2];
for i=1:m
    k  = k +9*n+7;
    %k1 = k1+9*n+7;
    k2 = k2+9*n+7;
    %k3 = k3+9*n+7;
    %k4 = k4+9*n+7;
    if k < max(max(B)) 
        DEL = [DEL k];
    end
    %{
    if k1 < max(max(B)) 
        DEL = [DEL k1];
    end
    %}
    if k2 < max(max(B))
        DEL = [DEL k2];
    end
    %{
    if k3 < max(max(B))
        DEL = [DEL k3];
    end
    
    if k4 < max(max(B))
        DEL = [DEL k4];

    end
    %}
    
    
end

total_nodes = 1:2241;

dispnodes = setdiff(total_nodes,DEL);

GK1 = GK(dispnodes,dispnodes);
GL1 = GL(dispnodes,1);

u = GK1\GL1;
DEL = sort(DEL);

u=u';
for i= DEL 
        u = [u(1:i-1) zeros(1,1) u(i:end)];
end


node=1;
soln=zeros(16);
for height=1:m+1
    i=1;
    for xin = node:7:node+7*n
        xin;
        soln(i,height)=u(xin);
        i=i+1;
    end
    node=node+9*n+7;
end
soln;
surf(soln);

