I = imread_ncut('jpg_images/4.jpg',100,100 );

for nb = 1:20
    nbSegments = nb*100;
    c = 100;
    tic;    
    SegLabel = ragSeg(I,c, nbSegments);
    disp(['The segments ' num2str(nbSegments) ' computation took ' num2str(toc) ' seconds on the ' num2str(size(I,1)) 'x' num2str(size(I,2)) ' image']);
    figure(nbSegments+1);clf
    bw = edge(SegLabel,0.01);
    J1=showmask(I,imdilate(bw,ones(2,2))); imagesc(J1);axis off
end
