open("/media/backup/NpSurfaceCounter/testdata/aug_13_12/30000/f1_b1_30k1kx1_high.tif");
//setTool("rectangle");
makeRectangle(3, 30, 1021, 630);
run("Crop");
saveAs("Tiff", "/media/backup/NpSurfaceCounter/RunResults/aug_13_12/30000/f1_b1_30k1kx1_high/f1_b1_30k1kx1_high_cropped.tif");
getHistogram(values, counts, 256);
d=File.open("/media/backup/NpSurfaceCounter/RunResults/aug_13_12/30000/f1_b1_30k1kx1_high/f1_b1_30k1kx1_high_greyscale.txt");
getThreshold(threshold, max);
for (k=0; k<values.length; k++) { print(d, k+" "+counts[k]);}
File.close(d);
run("Set Scale...", "distance=1 known=9.25666666667 pixel=1 unit=nm");
//run("Threshold...");
setThreshold(122, 255);
run("Despeckle");
run("Set Measurements...", "area mean standard modal min centroid center perimeter bounding fit shape feret's integrated median skewness kurtosis area_fraction stack limit redirect=None decimal=3");
run("Analyze Particles...", "size=0.0-Infinity circularity=0.0-1.0 show=Ellipses display clear exclude summarize");
saveAs("Results", "/media/backup/NpSurfaceCounter/RunResults/aug_13_12/30000/f1_b1_30k1kx1_high/f1_b1_30k1kx1_high_stats_full.txt");
saveAs("Tiff", "/media/backup/NpSurfaceCounter/RunResults/aug_13_12/30000/f1_b1_30k1kx1_high/f1_b1_30k1kx1_high_circles.tif");
close();
//run("Threshold...");
run("Convert to Mask");
getHistogram(values, counts, 256);
d=File.open("/media/backup/NpSurfaceCounter/RunResults/aug_13_12/30000/f1_b1_30k1kx1_high/f1_b1_30k1kx1_high_blackwhite.txt");
getThreshold(threshold, max);
for (k=0; k<values.length; k++) { print(d, k+" "+counts[k]);}
File.close(d);
saveAs("Tiff", "/media/backup/NpSurfaceCounter/RunResults/aug_13_12/30000/f1_b1_30k1kx1_high/f1_b1_30k1kx1_high_adjusted.tif");
close();