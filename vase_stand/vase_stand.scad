

w=330; //mm
d=330;
t=150; //thickness

h=420; //height
h_frame=350;

leg_t = 20; //leg thickness


legs_h = 500;
legs_w = 120;
mat_t = 18; //material thickness

cylinder_rad = legs_w/2-15;
top_rad = 200;

module leg(x,y, a) {
    
    rotate([0,0,a]) {
        difference() {
            translate([x,y,legs_h/2]){
                cube(size = [legs_w, mat_t,legs_h], center = true); //thin legs
            }
            translate([1050, 1+mat_t/2, legs_h/2]){
                rotate([90,0,0]) {
                    cylinder(h=mat_t+2, r=1000);
                }
            }
        }
    }
}

module cyl(h, r) {
    translate([0,0,h]){
        cylinder(h=mat_t, r=r);
    }
}


e=4;
leg(e+legs_w/2,0, 0);
leg(e+legs_w/2,0, 360/3);
leg(e+legs_w/2,0, 360*(2/3));


//Middle supporting disks
cyl(legs_h*(1/4), cylinder_rad);
cyl(legs_h*(3/4), cylinder_rad);

//Top
cyl(legs_h, top_rad);
cyl(legs_h+mat_t, top_rad);


