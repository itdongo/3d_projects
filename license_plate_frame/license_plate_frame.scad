$fn=96;

//Plate measurements
height = 8;
plate_width = 300;
plate_depth = 150;

//bolt holes
h_d_between = 170;
v_d_between = 120;
d_from_top = 15;
d_from_bot = 17;
d_from_side = 65;

//corners
corner_base = 20;
corner_radius = 90;

extension_width = 70;
width = 210-extension_width;
top_depth = 22;
bottom_depth = 30;
side_height = 154;
side_width = 28;
banner_width=plate_width-side_width*2-extension_width;

left_x = -112;
left_y = 0;
left_z = 0;
right_x=width/2+extension_width/2;

//Connectors
con_height = height/2;
con_width = 15;
con_depth = top_depth;

nut_height = 2.4;
nut_rad = 3.2;
nut_width = 5;
screw_height = 1.65;
screw_rad = 1.7;
screw_length = 2;
head_height = 1.86;
head_dia= 6.7;


font = "DejaVu Sans:style=Bold";
//letter_size = 18;
topstring = "Veteran";
bottomstring = "US Navy";

fillet = side_width/2;


module banner(side) {
  difference() {
    if(side=="top"){
      letter_size = 18;
      difference() {
        union() {
          translate([ 0, 0, 0 ])
          cube(size=[banner_width, top_depth, height], center = true );
        }
        translate([ 0, 0, height/2-.5])
        linear_extrude(.3) {
          text(topstring, size = letter_size, font = font, halign = "center", valign = "center", $fn = 64);
        }
      }
    }
    if(side=="bottom") {
      letter_size = 16;
      difference() {
        union() {
          translate([ 0, 0, 0 ])
          cube(size=[banner_width, top_depth, height], center = true );
        }
        translate([ 0, 0, height/2-1])
        linear_extrude(2) {
          text(bottomstring, size = letter_size, font = font, halign = "center", valign = "center", $fn = 64);
        }
      }
    }

    //connector_notch
    translate([-banner_width/2+con_width/2, 0, -con_height/2])
      cube([ con_width, con_depth, con_height ], center = true);

    mirror([ 1, 0, 0 ])
    translate([-banner_width/2+con_width/2, 0, -con_height/2])
      cube([ con_width, con_depth, con_height ], center = true);

    //nut holes
    translate([-banner_width/2+con_width/2, 0, con_height/2])
      cylinder( h = nut_height, r = nut_rad, $fn = 6, center = true );

    mirror([ 0, 1, 0 ]) {
      translate([banner_width/2-con_width/2, 0, con_height/2])
        cylinder( h = nut_height, r = nut_rad, $fn = 6, center = true );
    }
// screw holes
    translate([-banner_width/2+con_width/2, 0, con_height/2-screw_height/2-1]) {
      #cylinder( h = screw_length, r = screw_rad, center = true );
    }

mirror([ 0, 1, 0 ]) {
    translate([+banner_width/2-con_width/2, 0, con_height/2-screw_height/2-1]) {
      #cylinder( h = screw_length, r = screw_rad, center = true );
}
}

    
  }
/*
mirror([ 0, 1, 0 ])
      translate([ side_width/2+extension_width-con_width/2, plate_depth/2-con_depth/2, -con_height/2 ])
  cube([ con_width, con_depth, con_height ], center = true);
*/
}

module side() {
  difference() {
    union() {
        cube(size=[side_width, plate_depth, height], center = true );
      translate([ extension_width/2+side_width/2, plate_depth/2-top_depth/2, 0 ])
        extension("top");

    mirror([ 0, 1, 0 ])
      translate([ extension_width/2+side_width/2, plate_depth/2-bottom_depth/2, 0 ])
        extension("bottom");
      }
      // camfer the edges
    translate([ -side_width/2+fillet/2, -plate_depth/2+fillet/2, 0 ]) 
      #cube(size=[fillet, fillet, height], center = true );
      
    mirror([0, 1, 0 ])
      translate([ -side_width/2+fillet/2, -plate_depth/2+fillet/2, 0 ]) 
        #cube(size=[fillet, fillet, height], center = true );

//Add bolt_hole
    translate([ d_from_side, plate_depth/2-d_from_top, 0 ]){
      bolt_hole();

    translate([ 0, -v_d_between, 0 ])
      #bolt_hole();
}
//connector notch
translate([ side_width/2+extension_width-con_width/2, plate_depth/2-con_depth/2, -con_height/2 ])
  cube([ con_width, con_depth, con_height ], center = true);

mirror([ 0, 1, 0 ])
      translate([ side_width/2+extension_width-con_width/2, plate_depth/2-bottom_depth/2, -con_height/2 ])
  cube([ con_width, bottom_depth, con_height ], center = true);

// nuts
  translate([ side_width/2+extension_width-con_width/2, plate_depth/2-top_depth/2, height/2-con_height+2 ])
    cylinder( h = nut_height, r = nut_rad, $fn = 6, center = true );

mirror([ 0, 1, 0 ]) {
  translate([ side_width/2+extension_width-con_width/2, plate_depth/2-bottom_depth/2, height/2-con_height+2 ])
    cylinder( h = nut_height, r = nut_rad, $fn = 6, center = true );
}
// screw holes
  translate([ side_width/2+extension_width-con_width/2, plate_depth/2-top_depth/2, 0 ])
            #cylinder( h = screw_height, r = screw_length, center = true );
  
mirror([ 0, 1, 0 ]) {
  translate([ side_width/2+extension_width-con_width/2, plate_depth/2-bottom_depth/2, 0 ])
     #cylinder( h = screw_height, r = screw_length, center = true );
  }

  }
  union() {
    translate([ -side_width/2+fillet, -plate_depth/2+fillet, 0 ]) 
    cylinder( h = height, r = fillet, center = true );

    mirror([0, 1, 0])
      translate([ -side_width/2+fillet, -plate_depth/2+fillet, 0 ]) 
      cylinder( h = height, r = fillet, center = true );

  }

}


module extension(side){
  if (side == "top") {
  cube([extension_width, top_depth, height ], center = true );
  }
  if (side == "bottom"){
  cube([extension_width, bottom_depth, height ], center = true );
  }
}

module bolt_hole(){              
  difference()
    cylinder( h = 10, r = 3, center = true );
}

                
module connector(){
  difference() {
  union(){
    cube([ con_width, con_depth, con_height ], center = true);
  }
  translate([ 0, -con_depth/3, 0 ]) {
    cylinder( h = 10, r = screw_rad, center = true );
    translate([ 0, 0, 1.1 ])
    cylinder( h = head_height, r1 = screw_rad, r2 = head_dia/2, center = true );
  }

  mirror([ 0, 1, 0 ]) {
  translate([ 0, -con_depth/3, 0 ]) {
    cylinder( h = 10, r = screw_rad, center = true );
    translate([ 0, 0, 1.1 ])
    cylinder( h = head_height, r1 = screw_rad, r2 = head_dia/2, center = true );
  }
  }
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

module leftside() {
  side();
  rotate([ 180, 0, 0 ])
  translate([ side_width/4.69, -corner_base/2-corner_radius/2+6.5, height*3-1 ]) 
  corner(corner_base, corner_radius, height);
  
  
  translate([ side_width/4.69, -corner_base/2-corner_radius/2+6.5, height*3-1 ]) 
  rotate([ 0, 0, 0 ])
  corner(corner_base, corner_radius, height);
  
  translate([ side_width+corner_base/2, plate_depth/2+3, 0, ])
  extension();
}

//}
//insignia();
//translate([side_width+extension_width+width/2, side_height/2-top_depth/2 , 0 ])
banner("top");
//bottombanner();
//extension();

//connector();
//side();
//mirror([ 1, 0, 0 ])
//translate([ -plate_width, 0, 0 ])
//side();
//rightside();
//inserts();
//border();