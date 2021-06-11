h=180;
l=600;
d=300;

t_mat=18;

module lid2(lip, open){
    translate([0,0,h/2+t_mat/2+2]){
    
    translate([-(d+lip)/2,-(l+lip)/2,-t_mat/2]){
        rotate([0,-10,0]){
        cube([d+lip,l+lip,t_mat],center=false);
        }
    }
    
    translate([-(d+lip)/2,l,-t_mat/2]){
    rotate([0,-10,180]){
    cube([d+lip,l+lip,t_mat],center=false);
    }
    }
    
    }
}

lid2(10, 0);