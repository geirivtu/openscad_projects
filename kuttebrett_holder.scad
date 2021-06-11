    

mat_t = 18;

holder_outer_w = 200;
holder_wall_t = 35;
holder_outer_l = 250;

holders_h = 150;
holders_d = 6;
holders_a = 15;

len_between = 50;

translate([0, holder_outer_l/2, 0]){
    difference(){
        cube(size = [holder_outer_w, holder_outer_l, mat_t], center=true);
        translate([0,20,0]){
            cube(size = [holder_outer_w-holder_wall_t*2, holder_outer_l-20, mat_t+2], center=true);
        }
    }
}


module brett() {
    translate([0,0,300/2+5]) {
        rotate([holders_a, 0, 0]) {
            color( "SteelBlue", 0.5 ) {
            cube(size = [500, 18, 300], center=true);
            }
        }
    }
}

module round_brett() {
    translate([0,0,300/2-3]) {
        rotate([90+holders_a, 0, 0]) {
            color( "Tomato", 0.5 ) {
            cylinder(h=30, d=300);
            }
        }
    }
}

module holder(x,y, a) {
    module tmp(){
        translate([holder_outer_w/2-holder_wall_t/2,y,0]){
            rotate([a, 0, 0]) {
                cylinder(h=holders_h, d=holders_d);
            }
        }
    }
    
    tmp();
    mirror([1,0,0] ) { 
         tmp();
    }
}


brett();

translate([0,3*len_between-35,0]){
round_brett();
}

for (i = [0:len_between:holder_outer_l-20]) {
    translate([0,i+20,0]){
        holder(0,0,holders_a);
    }
}


