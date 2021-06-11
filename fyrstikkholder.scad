

l_fyrstikkeske = 58;
h_fyrstikkeske = 17;
d_fyrstikkeske = 36;

diameter_telys = 40;
h_telys = 23;

l_holder = l_fyrstikkeske;
h_holder = 3*h_fyrstikkeske;
d_holder = 3*d_fyrstikkeske;

module fyrstikkeske(){
    
    cube([l_fyrstikkeske,d_fyrstikkeske,h_fyrstikkeske]);
}

module telys(){
    cylinder(h_telys, d=diameter_telys);
}

module telys_plassering(y){
    
    translate([l_holder/2,diameter_telys/2+y, h_holder-h_telys+1]){
        telys();
    }
}

fyrstikkeske();


avstand_mellom_telys_senter = diameter_telys+10;

difference(){
    cube([l_fyrstikkeske, d_holder, h_holder]);
    translate([0,-1,h_fyrstikkeske]) fyrstikkeske();
    telys_plassering(avstand_mellom_telys_senter+5);
    //telys_plassering(avstand_mellom_telys_senter*2+5);
    //telys_plassering(avstand_mellom_telys_senter*3+5);
}