function SegLabels = ragSeg(I,c, segs)

I = py.numpy.array(I);

labels1 = py.skimage.segmentation.slic(I,pyargs('compactness',int32(c),'n_segments',int32(segs),'start_label',int32(1)));

g = py.skimage.future.graph.rag_mean_color(I,labels1,pyargs('mode','similarity'));

SegLabels = py.skimage.future.graph.cut_normalized(labels1,g);

SegLabels = double(SegLabels);