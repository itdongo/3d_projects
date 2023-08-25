//$fn=96;

//Plate measurements
height = 8;
plate_width = 300;
plate_depth = 150;

//bolt holes
h_d_between = 170;
v_d_between = 120;
d_from_top = 15.5;
d_from_bot = 17.5;
d_from_side = 65;



//corners
corner_base = 20;
corner_radius = 90;


extension_width = 70;
width = 210-extension_width;
depth = 29;
side_height = 154;
side_width = 28;

left_x = -112;
left_y = 0;
left_z = 0;
right_x=width/2+extension_width/2;

//Connectors
con_height = height/2;
con_width = 15;
con_depth = depth;

nut_height = 2.4;
nut_rad = 3.2;
nut_width = 5;
screw_height = 1.65;
screw_rad = 1.7;
screw_length = 2;


font = "DejaVu Sans:style=Bold";
letter_size = 18;
topstring = "Veteran";
bottomstring = "US Navy";

fillet = side_width/2;



module topbanner() {
    difference() {
        translate([ 0, 2, 0 ])
        cube(size=[width, depth+5, height], center = true );
        
// bolt holes
        translate ([ -88.9, depth/2-15.5, -5 ])
            cylinder( h = 10, r = 3 );
        translate ([ 88.9, depth/2-15.5, -5 ])
            cylinder( h = 10, r = 3 );

// inserts        
        translate([-83, -9, -1.5]) 
            cube(size=[extension_width/2+1, depth-10, height-3]);
        translate([59.5, -9, -1.5]) 
            cube(size=[extension_width/2+1, depth-10, height-3]);

//text and emblems
        translate([0, 0, 2])
            linear_extrude(1) {
                text(topstring, size = letter_size, font = font, halign = "center", valign = "center", $fn = 96);

        }
    }
}

module bottombanner() {
    translate([0, -side_height-depth-4.5, 0]) {
        difference() {
            cube(size=[width, depth, height], center = true);
            
//inserts
            translate([-83, -9, -1.5]) 
                cube(size=[extension_width/2+1, depth-10, height-3]);
            translate([59.5, -9, -1.5]) 
               cube(size=[extension_width/2+1, depth-10, height-3]);
            
// bolt holes
        translate ([ -88.9, depth/2-13, -5 ])
            cylinder( h = 10, r = 3 );
        translate ([ 88.9, depth/2-13, -5 ])
            cylinder( h = 10, r = 3 );

//text and emblems
        }            
            translate([0, 0, 3])
            linear_extrude(1) {
                    text(bottomstring, size = letter_size, font = font, halign = "center", valign = "center", $fn = 64);
        }
    }
}

module side() {
  difference() {
    union() {
      cube(size=[side_width, side_height, height], center = true );
translate([ extension_width/2+side_width/2, side_height/2-depth/2, 0 ])
extension();

mirror([ 0, 1, 0 ])
translate([ extension_width/2+side_width/2, side_height/2-depth/2, 0 ])
extension();
      }
      // camfer the edges
      translate([ -side_width/2+fillet/2, -side_height/2+fillet/2, 0 ]) 
        cube(size=[fillet, fillet, height], center = true );
      
      mirror([0, 1, 0 ])
      translate([ -side_width/2+fillet/2, -side_height/2+fillet/2, 0 ]) 
        cube(size=[fillet, fillet, height], center = true );

//bolt_hole();
translate([ d_from_side, side_height/2-d_from_top, 0 ]){
bolt_hole();

translate([ 0, -v_d_between, 0 ])
#bolt_hole();
}
//connector notch
translate([ side_width/2+extension_width-con_width/2, side_height/2-con_depth/2, -con_height/2 ])
  cube([ con_width, con_depth, con_height ], center = true);

mirror([ 0, 1, 0 ])
      translate([ side_width/2+extension_width-con_width/2, side_height/2-con_depth/2, -con_height/2 ])
  cube([ con_width, con_depth, con_height ], center = true);

// nuts
  translate([ side_width/2+extension_width-con_width/2, side_height/2-con_depth/4, height/2-con_height+2 ])
    cylinder( h = nut_height, r = nut_rad, $fn = 6, center = true );
  translate([ side_width/2+extension_width-con_width/2, side_height/2-con_depth*.75, height/2-con_height+2 ])
    cylinder( h = nut_height, r = nut_rad, $fn = 6, center = true );

mirror([ 0, 1, 0 ]) {
  translate([ side_width/2+extension_width-con_width/2, side_height/2-con_depth/4, height/2-con_height+2 ])
    cylinder( h = nut_height, r = nut_rad, $fn = 6, center = true );
  translate([ side_width/2+extension_width-con_width/2, side_height/2-con_depth*.75, height/2-con_height+2 ])
    cylinder( h = nut_height, r = nut_rad, $fn = 6, center = true );
}
         // screw holes
  translate([ side_width/2+extension_width-con_width/2, side_height/2-con_depth/4, 0 ])
            #cylinder( h = screw_height, r = screw_length, center = true );
  translate([ side_width/2+extension_width-con_width/2, side_height/2-con_depth*.75, 0 ])
            #cylinder( h = screw_height, r = screw_length, center = true );

mirror([ 0, 1, 0 ]) {
  translate([ side_width/2+extension_width-con_width/2, side_height/2-con_depth/4, 0 ])
            #cylinder( h = screw_height, r = screw_length, center = true );
  translate([ side_width/2+extension_width-con_width/2, side_height/2-con_depth*.75, 0 ])
            #cylinder( h = screw_height, r = screw_length, center = true );
}

  }
  union() {
    translate([ -side_width/2+fillet, -side_height/2+fillet, 0 ]) 
    cylinder( h = height, r = fillet, center = true );

    mirror([0, 1, 0])
      translate([ -side_width/2+fillet, -side_height/2+fillet, 0 ]) 
      cylinder( h = height, r = fillet, center = true );

}

}


module extension(){
  cube([extension_width, depth, height ], center = true );
}

module bolt_hole(){              
  difference()
    cylinder( h = 10, r = 3, center = true );
}

                
module connector(){
  cube([ con_width, con_depth, con_height ], center = true);
}

/*            
         // nuts
            translate([ extension_width, side_height/2+25, 5 ])
            cylinder( h = nut_height, r = nut_rad, $fn = 6, center = true );
            translate([ con_depth+con_width/2+2, 10, 1.75 ])
            cylinder( h = nut_height, r = nut_rad, $fn = 6, center = true );
      
         // screw holes
            translate([ con_depth+con_width/2+2, 10, 0 ])
            cylinder( h = screw_height, r = screw_length, center = true );
            translate([ con_depth+con_width/2+2, 10, 0 ])
            cylinder( h = screw_height, r = screw_length, center = true );

        // bottom
           mirror([ 0, 1, 0 ]) {
             // bolt hole
            translate ([ extension_width-15, side_height/2+16.5, 0 ])
                cylinder( h = 10, r = 3, center = true );
                
         // connector

            translate([ extension_width-2, side_height/2+17, -con_height*.25 ])
            cube([ con_width, con_depth, con_height ], center = true);
            
         // nuts
            translate([ con_depth+con_width/2+2, 10, 1.75 ])
            cylinder( h = nut_height, r = nut_rad, $fn = 6, center = true );
      
         // screw holes
            translate([ con_depth+con_width/2+2, 10, 0 ])
            cylinder( h = screw_height, r = screw_length, center = true );
           }
          

            translate([ -13, -4, 1 ])
                  rotate([ 0, 0, 45 ])
            scale([ .20, .20, .25 ])
            insignia();
         
         // bolt holes
            translate ([ 33, depth/2-15.5, -5 ])
                cylinder( h = 10, r = 3 );
            translate ([ 33, -124.5, -5 ])
                cylinder( h = 10, r = 3 );   
        
       
         mirror([ 1, 0, 0 ]) {
           
            translate([ con_depth*1.35, 2, -con_height*.25 ])
            cube([ con_width, con_depth, con_height ], center = true);
            
         // nuts
            translate([ con_depth+con_width/2+2, 10, 1.75 ])
            cylinder( h = nut_height, r = nut_rad, $fn = 6, center = true );
      
         // screw holes
            translate([ con_depth+con_width/2+2, 10, 0 ])
            cylinder( h = screw_height, r = screw_length, center = true );
         //}

            }
    }
}

module rightside() {
    translate([ right_x, left_y, left_z]) {
        mirror([ 1, 0, 0 ]) {
            difference() {
                union() {
                //top extension
                    translate([ 0, 0+2, 0 ])
                    cube([extension_width, depth+5, height ], center = true );

                //top corner                
                    translate([ -extension_width/2, left_y-depth/2, -depth ]) 
                    rotate([ 270, 0, 0 ]) 
                        corner( depth, 90, height ); //top corner
                
               //side
                    translate([ -38, -side_height/2-depth/2, 0 ]) 
                        cube(size=[side_width, side_height, height], center = true );

                //bottom corner
                    translate([-extension_width/2, -side_height-depth/2, depth]) 
                        rotate([ 90, 0, 0 ]) 
                            corner( depth, 90, height ); //bottom corner
                //bottom extension
                    translate([-depth/2+depth/2, -side_height-depth, ]) 
                        cube([ extension_width, depth, 6 ], center = true); //bottom extension
                //top insert
                    translate([ 33, 0.5, 0 ])    
                        cube([extension_width/2, depth-10.5, height-4 ], center = true );
                //bottom insert
                    translate([ 33, -side_height-depth+.5, 0 ]) 
                        cube([ extension_width/2, depth-10.5, height-4 ], center = true); //bottom inset
            }
            // bolt holes
                translate ([ 15, depth/2-15.5, -5 ])
                    cylinder( h = 10, r = 3 );
                translate ([ 15, -124.5, -5 ])
                    cylinder( h = 10, r = 3 );
           
            }
        }
    }
}
*/
module inserts() {
    //translate([left_x, left_y, left_z]) {
            union() {
              //  translate([depth/2, -side_height/2-depth+2, -.5]) 
                //    cube(size=[width/5-1, depth-4, height-4]); //bottom insert
                translate([depth/2+49.5, side_height/2-58.7, -1.5]) 
                    cube(size=[width/5+9, depth-8.5, 2.8]); //top insert
            }
        }
    //}

module corner(corner_base = 10, corner_angle = 45, corner_height = 20) {
corner_radius = corner_base;
rotate_extrude( angle = corner_angle, $fn = 100 )
translate( [-corner_radius/2, 0] )
    union(){
        translate( [0, -corner_base] )
            square([ corner_base, corner_height ], center = true);
    }
}

module insignia() {
    //union() {
       // cube([ 35, 20, 4 ]);
                //linear_extrude(2) {
                   
                    //translate([ 17, 10, 0 ])
                      //  import(file = "/Users/darrylestes/Downloads/senior_driver/sonar_tech1.svg", center = true, dpi = 90);
                  
                  //"/Users/darrylestes/Documents/3d_projects/sonar_tech/Navy_Sonar_Technician_Emblem_4116858/images/featured_preview_83311.png", center = true, dpi = 90);
            
      //          }
                //scale([ .25, .25, .25 ])
                import(file ="/Users/darrylestes/Documents/3d_projects/sonar_tech/Navy_Sonar_Technician_Emblem_4116858/files/Sonar_Tech.stl" );
      //      }
        }

module border() {
  //  difference() {
        translate([ -150, -138, -6 ])
        cube([ 300, 150, 4 ]);
    }

module leftside() {
  side();
  rotate([ 180, 0, 0 ])
  translate([ side_width/4.69, -corner_base/2-corner_radius/2+6.5, height*3-1 ]) 
  corner(corner_base, corner_radius, height);
  
  
  translate([ side_width/4.69, -corner_base/2-corner_radius/2+6.5, height*3-1 ]) 
  rotate([ 0, 0, 0 ])
  corner(corner_base, corner_radius, height);
  
  translate([ side_width+corner_base/2, side_height/2+3, 0, ])
  extension();
} 

//}
//insignia();
//topbanner();
//bottombanner();
//extension();
side();
//rightside();
//inserts();
//border();