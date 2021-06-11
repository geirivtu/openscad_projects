



mat_t=18;


support_w=250;
support_h=600;

drawer_inside_h=150;
drawer_w=450;
drawer_d=300;

translate([0,0,support_h+drawer_inside_h/2]){
difference(){
    cube([drawer_w+2*mat_t, drawer_d, drawer_inside_h+2*mat_t], center=true);
    translate([0,2,0]){
    cube([drawer_w, drawer_d, drawer_inside_h], center=true);
    }
}
}

//Support
translate([0,0,support_h/2]){
rotate([0,0,+25]) cube([support_w, mat_t, support_h],center=true);
rotate([0,0,-25]) cube([support_w, mat_t, support_h],center=true);
}

//Floor stand
cylinder(h=mat_t, d=support_w*1.4);