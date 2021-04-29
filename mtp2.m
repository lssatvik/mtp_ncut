for nbSegments = [2,3,4,5,10]
    tic;
    %[SegLabels,NcutDiscrete,NcutEigenvectors,NcutEigenvalues,W,imageEdges]= NcutImage(I,nbSegments);
    SegLabel = getSeg(W,nbSegments,nr,nc);
    disp(['The segments ' num2str(nbSegments) ' computation took ' num2str(toc) ' seconds on the ' num2str(size(I,1)) 'x' num2str(size(I,2)) ' image']);
    figure(nbSegments);clf
    bw = edge(SegLabel',0.01);
    J1=showmask(I,imdilate(bw,ones(2,2))); imagesc(J1);axis off
end

function SegLabel = getSeg(W,nbsegments,nr,nc)
    [NcutDiscrete,NcutEigenvectors,NcutEigenvalues] = ncutW(W,nbsegments);
    
    SegLabel = zeros(nr,nc);
    for j=1:size(NcutDiscrete,2)
        SegLabel = SegLabel + j*reshape(NcutDiscrete(:,j),nr,nc);
    end
end
    