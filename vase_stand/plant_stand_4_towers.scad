

//material stats : t=36,w=385,l=1430

mat_w = 300;
mat_t = 36; //material thickness

tower_h = 300;
support_h=50;
tower_internal_width = 210;

echo("tower_h =", tower_h);
echo("internal width = ", tower_internal_width);
h_center_support = tower_h/2+support_h+mat_t/2;
echo("h center supports = ", h_center_support); 


cube(size = [mat_t, mat_t, h_center_support], center = true);

module green_vase() {
    color("OliveDrab"){
    translate([0,0, 200/2]){
        difference(){
            cylinder(h=200, r=100, center=true);
            translate([0,0,10]){
                cylinder(h=190, r=90, center=true);
            }
        }
    }
    }
}

module grey_palm_vase() {
    //d=26
    //d_bot = 21
    //h=25
    //flat = 7
    
    h_horizontal_area = 70;
    h_angled_area = 180;
    r_bottom = 105;
    r_top = 155;
    
    module v(r_bottom) {
        translate([0,0,h_angled_area/2+h_horizontal_area/2]){
            cylinder(h=h_horizontal_area, r=r_bottom+50, center=true);
        }
        cylinder(h=h_angled_area, r1=r_bottom, r2=r_bottom+50, center=true);
    }
    
    translate([0,0,180/2]){
        color("DarkGray"){
            difference(){
              v(105);
              translate([0,0,5]){
                v(90);
              }
            }
        }
    }
}

module leg(x_disp, y_disp) {
    translate([x_disp, y_disp, 0]){
        cube(size = [mat_t, mat_t, tower_h], center = true);
    }
}


//legs
leg(-(tower_internal_width/2+mat_t/2), 0);
leg(0, (tower_internal_width/2+mat_t/2));
leg((tower_internal_width/2+mat_t/2), 0);
leg(0, -(tower_internal_width/2+mat_t/2));

//supports
translate([0,0,support_h]){
    cube(size = [tower_internal_width, mat_t, mat_t], center = true);
    cube(size = [mat_t, tower_internal_width, mat_t], center = true);
}

translate([0,0,support_h+mat_t/2]){
//grey_palm_vase();
green_vase();
}

