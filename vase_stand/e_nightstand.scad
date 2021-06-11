

//material stats : t=36,w=385,l=1430

mat_w = 300;
mat_t = 36; //material thickness

//mid_section_l = 700;
h = 500;


mid_section_h = h;
bottom_l = 350;

echo("bottom/tom l =", bottom_l);
echo("mid_section_h =", mid_section_h);
echo("total_l =", bottom_l + bottom_l + mid_section_h);
//echo("heigth =", h);

module mod(x, y, z, a) {
    difference(){
        //bottom
        cube(size = [x, y, z], center = false);

        //bottom
        rotate([0, a,0]) {
            translate([0,-1,0]){
                cube(size = [x, y+2, z], center = false);
            }
        }
    }
}

color("BurlyWood") {
    
//top
translate([0,0,mid_section_h]){

        mod(bottom_l, mat_w, mat_t, 45);
    
}

//bottom
mod(bottom_l, mat_w, mat_t, -45);

/*



//bottom
cube(size = [bottom_l, mat_w, mat_t], center = false);

//midshelf
translate([0,0,(3*h)/6]){
    cube(size = [bottom_l/2, mat_w, mat_t], center = false);
}

//back
cube(size = [mat_t, mat_w, mid_section_h], center = false);
*/
}






