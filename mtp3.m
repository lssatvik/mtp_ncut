I = imread_ncut('jpg_images/12.jpg',300,300 );

for nbSegments = [2,5,10,20]
    tic;
    [SegLabel,NcutDiscrete,NcutEigenvectors,NcutEigenvalues,W,imageEdges]= NcutImage(I,nbSegments);
    %SegLabel = getSeg(W,nbSegments,nr,nc);
    disp(['The segments ' num2str(nbSegments) ' computation took ' num2str(toc) ' seconds on the ' num2str(size(I,1)) 'x' num2str(size(I,2)) ' image']);
    figure(nbSegments);clf
    bw = edge(SegLabel,0.01);
    J1=showmask(I,imdilate(bw,ones(2,2))); imagesc(J1);axis off
end