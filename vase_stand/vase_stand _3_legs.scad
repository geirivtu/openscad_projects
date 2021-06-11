

base_t = 18;
base_d = 290;

legs_h = 500;
legs_w = 120;
legs_d = 40; 

legs_a = 20;
legs_l = legs_h/cos(legs_a);
legs_bottom_w = tan(legs_a)*legs_h;
echo(legs_a);
echo(legs_l);
echo(legs_bottom_w);

cylinder_rad = legs_w/2-15;
top_rad = 200;

module leg(x,y, a) {
    rotate([0, 0, a]) {
        translate([x,y,0]){
            rotate([0, -legs_a, 0]) {
                cylinder(h=legs_l, d=legs_d);
            }
        }
    }
}

module arm(a) {
    arm_l = 350;
    arm_d = 30;
    arm_a = 10;
    
    d_base_joint_vertical = 200;
    d_center_leg_joint_horizontal = sin(legs_a)*d_base_joint_vertical;
    echo(d_center_leg_joint_horizontal);
    
    rotate([0, 0, a]) {
        translate([base_d/2-50,0,legs_h-arm_l/2-30]){
            rotate([0, arm_a, 0]) {
                cylinder(h=arm_l, d=arm_d);
            }
        }
    }
}

arm(0);
arm(360/3);
arm(360*(2/3));

//base
translate([0,0, legs_h]){
    cylinder(h=base_t, d=base_d);
}


e=10;
leg(legs_bottom_w+e, 0, 0);
leg(legs_bottom_w+e, 0, 360/3);
leg(legs_bottom_w+e, 0, 360*(2/3));





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

translate([0,0,legs_h+base_t+0]){
grey_palm_vase();
}


