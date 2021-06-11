

//material stats : t=36,w=385,l=1430

mat_w = 300;
mat_t = 36; //material thickness

//mid_section_l = 700;
h = 500;

a= 60;
//h = sin(a)*mid_section_l;
mid_section_l = h/sin(a);
bottom_l = cos(a)*mid_section_l;

echo("bottom/tom l =", bottom_l);
echo("heigth =", h);
echo("mid_section_l =", mid_section_l);
echo("total_l =", bottom_l + bottom_l + mid_section_l);
//echo("heigth =", h);

//bottom
cube(size = [bottom_l, mat_w, mat_t], center = false);

//midshelf
translate([0,0,(3*h)/6]){
    cube(size = [bottom_l/2, mat_w, mat_t], center = false);
}

rotate([0,-a,0]) {
    cube(size = [mid_section_l, mat_w, mat_t], center = false);
}

//top
translate([0,0,h]){
    cube(size = [bottom_l, mat_w, mat_t], center = false);
}