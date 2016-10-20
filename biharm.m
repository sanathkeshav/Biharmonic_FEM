function V = biharm(u,v)
    syms x y;
    V = diff(u,x,2)*diff(v,x,2) + 2*diff(diff(u,x),y)*diff(diff(v,x),y) + diff(u,y,2)*diff(v,y,2);

end

