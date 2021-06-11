    


mat_t = 18; //material thickness
hylle_d = 150;
hylle_w = 640-(2*mat_t);


vertical_spacing = 180;

support_h = 360;
support_d = 150;

support_spacing = 640/2;

module hylle(depth) {
    translate([0, 0, 0]){
        cube(size = [hylle_w, depth,mat_t],center=true);
    }
}

module support(x) {
    color("BurlyWood") {
       difference(){
       cube(size = [mat_t, support_d, support_h],center=true);
           translate([0,120,support_h/2]){
            rotate([45,0,0]){
                cube(size = [mat_t+2, 200, 200],center=true);
            }
        }
        }
    }
}


bottom_shelf_d = 150;
top_shelf_d = 120;

hylle(bottom_shelf_d);
translate([0, -(support_d-top_shelf_d)/2, vertical_spacing+mat_t]){ //Need to take in account the thickness of mat
    hylle(top_shelf_d);
}   

translate([-(hylle_w/2+mat_t/2), 0, support_h/2-mat_t/2]){
    difference(){
        support();
        translate([0,-support_d/2, -100]){
        cube(size = [mat_t+2, 10, 10],center=true);
        }
    }
}
translate([hylle_w/2+mat_t/2, 0, support_h/2-mat_t/2]){
        support();

}


