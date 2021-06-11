

w=330; //mm
d=330;
t=150; //thickness

h=420; //height
h_frame=350;

leg_t = 20; //leg thickness


legs_h = 500;
legs_w = 250;
mat_t = 18; //material thickness

cylinder_rad = legs_w/2-15;
top_rad = 250;

top_thickness = 2*mat_t;

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

module leg2(x,y, a) {
    color("BurlyWood") {
        rotate([0,0,a]) {

            translate([x,y,legs_h/2]){
                cube(size = [legs_w, mat_t,legs_h], center = true);
                translate([0,0,legs_h/2+top_thickness/2]){
                    cube(size = [legs_w*(3/5), mat_t,top_thickness+0.5], center = true);
                }
            }
        }
    }
}


module cyl(h, r) {
    translate([0,0,h]){
        cylinder(h=top_thickness, r=r);
    }
}

module hex_top(h, r) {
    translate([0,0,h+top_thickness/2]){
        intersection(){
            cube(size = [top_rad*2, top_rad*2,top_thickness], center = true);
            rotate([0,0,45]) {
                cube(size = [top_rad*2, top_rad*2,top_thickness], center = true);
            }
        }
    }
}



leg2(0 ,0, 0);
leg2(0, 0, 90);



//Middle supporting disks
//cyl(legs_h*(1/4), cylinder_rad);
//cyl(legs_h*(3/4), cylinder_rad);

//Top
//cyl(legs_h, top_rad);
hex_top(legs_h, top_rad);


