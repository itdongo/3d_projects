$fn=96;
top_z=138;
basin=350;
outer_lip_diameter=230;
outer_diameter=216;
inner_diameter=208;
bottom_diameter=201;
bowl_length=38.1;
difference(){
  union(){
    //translate([ 0, 0, 0 ])
    
    sphere(d = outer_diameter);
    
  
  cylinder(h=5,d=outer_lip_diameter);
   //cylinder(h = bowl_length, r1 = outer_diameter/2, r2 = bottom_diameter/2 );
  }
  sphere(d = inner_diameter);
  
  translate([0, 0, 5])
  cylinder(h=bowl_length*3, r = outer_diameter/2);
  
  //translate([ 0, 0, 0 ])
    
    
  
  translate([ 0, 0, -bowl_length*3 ])
    cylinder(h = bowl_length*2, d = outer_diameter );
    
}


difference(){
  
    
  //translate([ 0, 0, 0 ])
    
    //sphere(d = inner_diameter-5);

}

translate([ 0, 0, -bowl_length ])
    cylinder(h = 5, r1 = bottom_diameter/2, r2 = bottom_diameter/2+2.2 );


