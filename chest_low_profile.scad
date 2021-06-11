
/* 

d=400
l=735

høyre del hylle
h=245

venstre hylle
h=300

*/

d=380;
l=700;

h=295;

t_mat=18;

module lid(lip, open){
    translate([0,0,h/2+t_mat/2+2]){
    
    translate([-(d+lip)/2,-(l+lip)/2,-t_mat/2]){
        rotate([0,-open,0]){
        cube([d+lip,l+lip,t_mat],center=false);
        }
    }
    }
}

module body(){
    //color("BurlyWood") {
    difference([]){
    cube([d,l,h],center=true);

    cube([d-2*t_mat,l-2*t_mat,h+2],center=true);
    
    }
    
    // bottom
    translate([0,0,-h/2+1.5*t_mat]){
    cube([d-2*t_mat,l-2*t_mat,t_mat],center=true);    
    }
    //}
}

module lip(width, depth)
{
    cyl_faces=6;
    cyl_r = 30/2;
    
    translate([(d-t_mat/2)/2,0,0]){
    cube([depth,width,30], center=true);
        
    translate([0,-width/2,0]){
    rotate([0,90,0]){
    cylinder($fn = cyl_faces, h = depth, r = cyl_r, center = true);
    }
    }
    
    translate([0,width/2,0]){
    rotate([0,90,0]){
    cylinder($fn = cyl_faces, h = depth, r = cyl_r, center = true);
    }
    }
    
    }
}

lid_angle=25;
lid(10, lid_angle);

difference(){
body();

// handle
translate([0,0,h/2]){
    lip(l/2, t_mat*2);
}

// lower legs long side
translate([0,0,-h/2]){
    lip(l*8/10, 2*d);
}

//lower legs short side
rotate([0,0,90]){
translate([0,0,-h/2]){
    lip(d*6/10, 3*l);
}
}

}



