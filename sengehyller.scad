l_ramme = 2000; //målt
b_ramme = 1400; //målt
h_ramme = 70; //målt

finer_t = 9;
eik_t = 18;

h_over_bakke_idag = 200;
h_over_bakken = h_over_bakke_idag + 150;

module seng() {
  //Madrass
  h_madrass = 140; //målt
  h_overmadrass = 60; //målt
  
  translate([0,0,h_ramme/2]){
      translate([0,0,h_ramme/2+h_madrass/2]){
        color("DarkGray", 0.2){ 
          cube([l_ramme, b_ramme, h_madrass], center=true);
          }
          translate([0,0,h_ramme/2+h_overmadrass]){
            color("Brown", 0.2) {
              cube([l_ramme, b_ramme, h_overmadrass], center=true);
              }
          }
      }
    
    
    difference(){
      cube([l_ramme, b_ramme, h_ramme], center=true);
      cube([l_ramme-2*12, b_ramme-2*12, h_ramme+2], center=true);
    }
    
    //Vegg
      translate([-l_ramme/2-70,0,0]){
      cube([40, b_ramme*1.5, 100], center=true);
      }
    
    //Midt stender lang
    cube([l_ramme-2*12, 40, h_ramme], center=true);
    
    //Riller
    b_riller = 48;
    for(i = [-l_ramme/2 : b_riller*2.0 : l_ramme/2]){
      translate([i, 0, h_ramme/2-10]){
        cube([b_riller, b_ramme-20, 10], center=true);
      }
    }
  }
}

module skuff(l,b,h) {
  //17 mm bygghøyde hjul under skuff
  // lag skuff av tynn finer, forsterk med feks hylleplate 15mm
  translate([0,0,h/2]){
    difference(){
      cube([b, l, h], center=true);
      
      translate([0,0,5]) cube([b-2*5, l+2, h], center=true);
    }
  }
}

module skuff2(l,b,h) {
  //17 mm bygghøyde hjul under skuff
  // lag skuff av tynn finer, forsterk med feks hylleplate 15mm
  
  color("DarkGray", 0.5){ 
  
  h=250;
  
  h_vegg=280;
  
  h_hjul = 35-3; //bygghøyde 35, så må hjulene stikke ute noen mm
  //bunn
  translate([0,0,finer_t/2+h_hjul]) cube([b, l, finer_t], center=true);
  
  //vegger 
  translate([b/2+finer_t/2,0,h_vegg/2]) cube([finer_t, l, h_vegg], center=true);
  translate([-(b/2+finer_t/2),0,h_vegg/2]) cube([finer_t, l, h_vegg], center=true);
    
  //bak 
  translate([0,-(l/2+finer_t/2-50),h_vegg/2]) cube([b, finer_t, h_vegg], center=true);
  
  //front
    front_bredde = b*1.1;
  translate([0,l/2+finer_t/2,h_over_bakken/2]) cube([front_bredde, eik_t, h_over_bakken], center=true);
  }
}





/********** SENG ramme + madrass ***************/
translate([0,0,h_over_bakken]){
  seng();
}

/********** STØTTE BEN ***************/
x=190; //avstanden fra kortsiden til der beina starter
b_t = 3*eik_t;//65;
b_b = 70;
b_i = b_t/2+15; //15: hvor langt inn beina er satt i forhold til rammen

module bein(x,y) {
  color("Brown", 0.6) {
  translate([x,y,h_over_bakken/2]){
    translate([0,0,65/2]) cube([b_b, b_t/3, h_over_bakken+65], center=true);
     cube([b_b, b_t, h_over_bakken], center=true);
  }
}
}

bein(l_ramme/2-x-b_t/2, b_ramme/2-b_i);
bein(l_ramme/2-x-b_t/2, -(b_ramme/2-b_i));
bein(-(l_ramme/2-x-b_t/2), b_ramme/2-b_i);
bein(-(l_ramme/2-x-b_t/2), -(b_ramme/2-b_i));

bein(0, b_ramme/2-b_i);
bein(0, 0);

b_skuff = 660;
d_skuff = b_skuff; //600;

/********** SKUFFER ***************/
h_hjul = 17;

translate([(l_ramme/2-x-b_t/2)/2,(d_skuff+eik_t)/2+25,0]){ //700/2+b_t/2, b_ramme/4+40,0
  skuff2(d_skuff, b_skuff, h_over_bakken-50);
  //skuff(d_skuff, b_skuff, h_over_bakken-50);
}

/*
translate([-(700/2+b_t/2), b_ramme/4+40]){
  skuff2(d_skuff, b_skuff, h_over_bakken-50);
}
*/

