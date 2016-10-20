clear all;
close all;
n = 2;
m = 2;
k=1;
k1 = 9*n+7;
k2 = 7*n+1;
k3 = 7*n+2;
k4 = 7*n+3;

DEL =[k k1 k2 k3 k4];
for i=1:m
    k  = k +9*n+7;
    k1 = k1+9*n+7;
    k2 = k2+9*n+7;
    k3 = k3+9*n+7;
    k4 = k4+9*n+7;
    if k < 71
        DEL = [DEL k];
    end
    
    if k1 < 71 
        DEL = [DEL k1];
    end
    
    if k2 < 71
        DEL = [DEL k2];
    end
    
    if k3 < 71
        DEL = [DEL k3];
    end
    
    if k4 < 71
        DEL = [DEL k4];

    end
end

%{     
ind(1) = 0;
for i= 1:70
    count=0;
    for j=1:size(DEL)
        if i==DEL(j) 
            count=1;
            break;
        end
    end
    ind(k)=i;
end


k=1;
j=1;
for i= 1:70
    if i==DEL(j) && j<=size(DEL,1)
        j=j+1;
        continue
    end
    a(k)=i;
    k=k+1;
end
%}



