function W = buildW(I)
    
    tic;

    [nr,nc,nb] = size(I);

    pixels = nr*nc;

    %W = sparse(pixels,pixels);

    X = zeros(pixels);
    Y = zeros(pixels);
    V = zeros(pixels);
    counter = 0;
    
    maxdist = hypot(nr,nc);

    for i=1:pixels
        counter = counter + 1;
        X(counter) = i;
        Y(counter) = i;
        V(counter) = 1;
        %W(i,i) = 1;
        [xi,yi] = getCoor(i,nc);
        for j=i+1:pixels
            [xj,yj] = getCoor(j,nc);
            pi = I(xi,yi);
            pj = I(xj,yj);
            %dij = pdist([xi,yi;xj,yj],'euclidean');
            dij = sqrt((xi-xj).^2 + (yi-yj).^2);
            w = exp(-abs(pi-pj)/16)*exp(-dij/36);
            %w = 1 - abs(pi-pj)/255;
            %w = exp(-abs(pi-pj)/75);
            if w > 0.01                
                counter = counter + 1;
                X(counter) = i;
                Y(counter) = j;
                V(counter) = w;
                counter = counter + 1;
                X(counter) = j;
                Y(counter) = i;
                V(counter) = w;
                %W(j,i) = w;
                %W(i,j) = w;
            end
        end
        if mod(i,1000) == 0
            i
        end
    end
    
    X = X(1:counter);
    Y = Y(1:counter);
    V = V(1:counter);
    
    W = sparse(X,Y,V);
    disp(['W computation took ' num2str(toc)]);
end

function [x,y] = getCoor(pixel,nc)
    y = mod(pixel,nc);
    if y == 0
        y = nc;
    end
    x = (pixel-y)/nc + 1;
end