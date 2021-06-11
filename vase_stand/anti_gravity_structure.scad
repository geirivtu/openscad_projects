
mat_t = 18;

circle_t = 20;
circle_outer_d = 150;

height = 200;

module arm_v1(){
    support_h = (2/3)*height;
    
    translate([(circle_outer_d/2),0,0]){
        cylinder(h=support_h, d=circle_t/2);
    }
    
    translate([0,0,support_h]){
        rotate([0,90,0]){
            cylinder(h=circle_outer_d/2, d=circle_t/2);
        }
    }
}

module arm_v2(){
    support_h = (2/3)*height;
    
    translate([circle_outer_d/2, 0, 0]){
        rotate([0, -28, 0]){
            cylinder(h=height*(4/5), d=circle_t/2);
        }
    }
}

module support(a) {
    rotate([0, 0, a]) {
        translate([circle_outer_d/2-circle_t/4, 0, 0]){
            cylinder(h=height, d=2);
        }
    }
}

module main_support() {
    main_support_h = height*(1/3);
    
    translate([0, 0, height/2-main_support_h/2]){
        cylinder(h=main_support_h, d=4);
    }
}

module ring(){
    difference(){
        cylinder(h=mat_t, d=circle_outer_d);
        
        translate([0,0,-1]){
            cylinder(h=mat_t+2, d=circle_outer_d-circle_t);
        }
    }
    
    arm_v2();
}

// Supports
color("LightGrey"){
    support(0);
    support(360/3);
    support(360*(2/3));
        
    main_support();
}



// Floating rings
color("Chocolate"){
    ring();

    translate([0,0,height]){
        rotate([0,180,0]){
            ring();
        }
    }
}



