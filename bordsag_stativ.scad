
// 700 x 700

//Stender dim
s_b = 36;
s_h = 48;
s_l = 700;


frame_2_frame_h = 370;

//Finer plate topp og bunn tykkelse
top_mat_t=12;

wheel_h=110;

module dewalt_7492(){
    
    h=330;
    b=680;
    d=650;
   
    cube([b,d,h]);
}


module frame(){
    color("BurlyWood") {
    difference([]){
        cube([s_l, s_l, s_h]);
        translate([s_b, s_b, -1]){
            cube([s_l-2*s_b, s_l-2*s_b, s_h+2]);
        }
    }
}
}

module support(){
    cube([s_b, s_h, frame_2_frame_h]);
}


module box(){

    //top frame
    translate([0,0,frame_2_frame_h-s_h]){
        frame();
    }

    //bottom frame
    frame();


    //Supports
    translate([s_b, s_b,0]) support();
    translate([s_b, s_l-s_b-s_h,0]) support();
    translate([s_l-2*s_b, s_b,0]) support();
    translate([s_l-2*s_b, s_l-s_b-s_h,0]) support();

    //Finer tables
    //Top
    color("Gold", 0.3){
    translate([0,0, frame_2_frame_h]){
        cube([s_l, s_l, top_mat_t]);
    }
    //bottom
    translate([0,0, -top_mat_t]){
    cube([s_l, s_l, top_mat_t]);
    }
    }
}


module wheel(){
translate([50,80/2,80/2]) rotate([0,90,0]) cylinder(h=25,d=80, center=true);
    
    
translate([s_l-50,80/2,80/2]) rotate([0,90,0]) cylinder(h=25,d=80, center=true);
}

wheel();

translate([0,0,wheel_h]){
    box();
}

translate([0,0,frame_2_frame_h+top_mat_t+2]) dewalt_7492();


