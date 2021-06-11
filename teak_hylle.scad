    



hylle_d = 200;
hylle_w = 1100;
hylle_t = 18; //material thickness

vertical_spacing = 300;

support_l = 500;
support_d = 100;
support_angle = 30;
support_spacing = 50;

module hylle(x) {
    translate([-x/2, 0, 0]){
        cube(size = [hylle_w+x, hylle_d,hylle_t]);
    }
}

module support() {
    color("BurlyWood") {
        translate([support_spacing, 0, support_l/2-0]){
            rotate([0, 90-support_angle, 0]) {
                cube(size = [support_l, support_d, hylle_t]);
            }
        }
    }
}

translate([-hylle_w/2, 0, -vertical_spacing/2]){
    translate([0, 0, vertical_spacing]){
        hylle(-250);    
    }
    
    hylle(00);
} 


support();
mirror([1,0,0] ) { 
    support();
}

