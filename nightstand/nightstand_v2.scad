

w=330; //mm
d=330;
t=150; //thickness

h=420; //height
h_frame=350;

leg_t = 20; //leg thickness
mat_t = 15; //material thickness


module leg(x,y) {
    translate([x,y,0]){
        cube(size = [leg_t,leg_t,h-h_frame], center = false); //thin legs
        //cube(size = [leg_t,d,h-t], center = false); //side wals
    }
}

//Frame
translate([0,0,h-h_frame]){ 
    difference() {
    cube(size = [w,d,h_frame], center = false);
    translate([mat_t,mat_t,mat_t]){
    cube(size = [w-(2*mat_t),2*d,h_frame-(2*mat_t)], center = false);}
    }
}

//Top shelf with drawer
translate([0,0,h-h_frame]){
    cube(size = [w,d,t], center = false);
    translate([15,d-20,15]){ color("SaddleBrown", 0.8){
        cube(size = [w-30,30,t-30], center = false); //Drawer front
        }}
}

//Drawer fob
fob_w=15;
translate([w/2,d+15, h-h_frame+t/2]) { rotate([90,0,0]){ color("DarkGoldenrod", 1.0) {
    cylinder(h=20, r1 = fob_w, r2 = fob_w, center = false);
}}}

/*
//Under shelf
translate([0,0,100]){
    cube(size = [w,d,15], center = false);
}
*/



leg(0, 0);
leg(0, d-leg_t);
leg(w-leg_t, 0);
leg(w-leg_t, d-leg_t);