title = getTitle();
run("Duplicate...", " ");
run("To ROI Manager");
	title= getTitle();
function findRoiWithName(roiName) { 
	nR = roiManager("Count"); 
 
	for (i=0; i<nR; i++) { 
		roiManager("Select", i); 
		rName = Roi.getName(); 
		if (matches(rName, roiName)) { 
			return i;			
		} 
	} 
	return -1;
} 

	findRoiWithName("wt2");
	run("Gaussian Blur...", "sigma=8");


findRoiWithName("rt2");
setBackgroundColor(255, 255, 255);
run("Clear Outside");
roiManager("Deselect"); 
roiManager("Delete");


getStatistics(area, mean, min, max, std, histogram);
k1=(max-min)/5;
k2=k1*2;
k3=k1*3;
k4=k1*4;
k5=k1*5;
mins = newArray(max,155,104,(k1*2)+1,k1+1,min);
maxs = newArray(max,k1*5,k1*4,k1*3,k1*2,k1);




for (i = 0; i < 6; i++) {
setThreshold(mins[i], maxs[i]);
area = getValue("Area limit");
if (area > 0) {
		run("Create Selection");
		roiManager("add")
		run("Select None");
		}
			
	}
resetThreshold;



run("Manual Threshold...", "min=155 max=254");
run("Create Selection");
roiManager("Add");

run("Manual Threshold...", "min=104 max=154");
run("Create Selection");
roiManager("Add");

run("Manual Threshold...", "min=66 max=103");
run("Create Selection");
roiManager("Add");

run("Manual Threshold...", "min=46 max=65");
run("Create Selection");
roiManager("Add");

run("Manual Threshold...", "min=0 max=45");
run("Create Selection");
roiManager("Add");
run("ROI Manager to LabelMap(2D)");
selectImage(3);
saveAs(".tif", "C:/Users/Administrator/Desktop/labelmaps/tieredfissureslabelmap_"+title+".tif");
saveAs("text image", "C:/Users/Administrator/Desktop/tieredfissure_testimages/_tieredfissureslabelmap"+title);
close("*");
roiManager("Reset");