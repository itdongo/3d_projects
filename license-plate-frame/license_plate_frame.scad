$fn=96;
//use <banner_text/banner_text.scad>;
//Plate measurements
height = 6;
plate_width = 300;
plate_depth = 158;




//corners
corner_base = 20;
corner_radius = 90;

extension_width = 63;
//width = 210-extension_width;
top_depth = 25;
bottom_depth = 25;
side_depth = plate_depth;
side_width = 10;
banner_width=plate_width-side_width*2-extension_width*2+38;

edge_height = 4;
edge_width = 1;

left_x = -112;
left_y = 0;
left_z = 0;
//right_x=width/2+extension_width/2;

//bolt holes
h_d_between = 170;
top_distance_from_edge = 15.748;
bottom_distance_from_edge = 16.748;

d_from_bot = 17;
d_from_side = 63.5;
vd_from_center = 60.452;
v_d_between = vd_from_center*2;


//Connectors
con_height = height/2;
con_width = 15;
con_depth = top_depth-edge_width;

mag_height = 4;
mag_rad = 3;

nut_height = 2.4;
nut_rad = 3.2;
nut_width = 5;
screw_height = 1.65;
screw_rad = 1.7;
screw_length = 2;
head_height = 1.86;
head_dia= 6.7;


font = "DejaVu Sans:style=Bold";
letter_size = 18;
topstring = "NAVY";
bottomstring = "VETERAN";
text_height = .8;
text_box_height = .4;
insignia_height = .4;
banner_box = len(topstring);

fillet = 14;

sw = .2;
sd = .2;
sh = .08;


module banner(side) {
  difference() {
    if(side=="top"){
      letter_size = letter_size;
      difference() {
        union() {
          translate([ 0, 0, 0 ])
          cube(size=[banner_width, top_depth, height+edge_height], center = true );
          }
        translate([ 0, 0, height/2+edge_height/2-text_height ])
                #linear_extrude(text_height){
          
            text(topstring, size = letter_size, font = font, halign = "center", valign = "center");
                }
            translate([ -banner_width/2+d_from_side/1.8, 0, height/2+edge_height/2-text_height ])          
              #insignia(sw, sd, sh);
          
            translate([ +banner_width/2-d_from_side/1.8, 0, height/2+edge_height/2-text_height ])          
              #insignia(sw, sd, sh);
          //banner_text( banner_width, top_depth, topstring );

          }
      }
    if(side=="bottom"){
      letter_size = letter_size;
      difference() {
        union() {
          translate([ 0, 0, 0 ])
          cube(size=[banner_width, top_depth, height+edge_height], center = true );
          }
          rotate([ 0, 0, 180 ])
        translate([ 0, 0, height/2+edge_height/2-text_height ])
                #linear_extrude(text_height){
          
            text(bottomstring, size = letter_size, font = font, halign = "center", valign = "center", $fn=196);
                }
          }
      }
      
 
 
      //create raised edge
      translate([ 0, -edge_width/2, -height/2 ])
          cube(size=[banner_width, top_depth-edge_width, edge_height], center = true );
   
    //connector_notch
    translate([-banner_width/2+con_width/2, -edge_width/2, edge_height/2-con_height/2])    
      cube([ con_width, con_depth, height-con_height ], center = true);
  
  translate([-banner_width/2+con_width/2, +top_depth/2-top_distance_from_edge-edge_width, edge_height/2-con_height/2])
      
    bolt_hole();

    mirror([ 1, 0, 0 ])
    {
      translate([-banner_width/2+con_width/2, -edge_width/2, edge_height/2-con_height/2])
      
        cube([ con_width, con_depth, height-con_height ], center = true);      
      translate([-banner_width/2+con_width/2, top_depth/2-bottom_distance_from_edge-edge_width, edge_height/2-con_height/2])
       
        bolt_hole();
      
    }
    
  }

}


module emboss() 
{
  translate([ 0, 0, 0 ])
  linear_extrude(text_height)
  {
    text(bottomstring, size = letter_size, font = font, halign = "center", valign = "center");
  }
}

module side() 
{
  difference() 
  {
    union() 
    {
      cube(size=[side_width, side_depth, height+edge_height], center = true );
      translate([ extension_width/2+side_width/2, side_depth/2-top_depth/2, 0 ])
        extension("top");

    mirror([ 0, 1, 0 ])
    translate([ extension_width/2+side_width/2, side_depth/2-bottom_depth/2, 0 ])
      extension("bottom");
    }
// Raised edge
      translate([ edge_width+.1, 0, height/2 ]) {
      cube(size=[side_width, side_depth-side_width*2-edge_width*2, edge_height], center = true );
      }

      translate([ extension_width/2+side_width/2+3, side_depth/2-top_depth/2-.5, height/2 ])
      cube([extension_width+side_width/2, top_depth-edge_width, edge_height ], center = true );

      translate([extension_width/2+side_width/2+con_width+edge_width*1.5, side_depth/2-edge_width, -edge_height/2 ])
      
      #cube([ con_width, edge_width, edge_height ]);
      
    mirror([0, 1, 0]) 
      
      translate([ extension_width/2+side_width/2+3, side_depth/2-top_depth/2-.5, height/2 ])
      
      cube([extension_width+side_width/2, top_depth-edge_width, edge_height ], center = true );

      translate([extension_width/2+side_width/2+con_width+edge_width*1.5, -side_depth/2, -edge_height/2 ])
      
      #cube([ con_width, edge_width, edge_height ]);
      
 
// camfer the edges
    translate ([ -side_width/2+fillet-2, side_depth/2-fillet+2, 0 ])
      rotate([ 0, 0, 90 ])
        rotate_extrude( angle = corner_radius, $fn = 96 )
        translate([ fillet+1, 0 ]) //curve and z height      
          square([ 6, height+edge_height], center = true );

    translate ([ side_width/2+edge_width+.9, extension_width+side_width/2-.8, height/2 ])
          cylinder(h = edge_height, r = fillet*.77, center = true );

    mirror([ 0, 1, 0 ])
    {
    translate ([ -side_width/2+fillet-2, side_depth/2-fillet+2, 0 ])
      rotate([ 0, 0, 90 ])
        rotate_extrude( angle = 90, $fn = 96 )
        translate([ fillet+1, 0 ]) //curve and z height      
          square([ 6, height+edge_height], center = true );

    translate ([ side_width/2+edge_width+.9, extension_width+side_width/2-.8, height/2 ])
          cylinder(h = edge_height, r = fillet*.77, center = true );

    }

//Add bolt_hole
    translate([ d_from_side-side_width/2+edge_width*2, vd_from_center, 0 ])
    {
      bolt_hole();

    translate([ 0, -v_d_between, 0 ])
      bolt_hole();
    }
//connector notch
    translate([ side_width/2+extension_width-con_width, side_depth/2-bottom_depth, -edge_height*2 ])
      cube([ con_width, con_depth+edge_width, con_height*2 ], center = false);
    translate([ side_width/2+extension_width-con_width, side_depth/2-con_depth, +con_height/2 ])
      cube([ con_width, con_depth, con_height+edge_height ], center = false);

    mirror([ 0, 1, 0 ])
    {
    translate([ side_width/2+extension_width-con_width, side_depth/2-bottom_depth, -height*2+height/2 ])
      cube([ con_width, con_depth+2, con_height+edge_height ], center = false);
    translate([ side_width/2+extension_width-con_width, side_depth/2-bottom_depth, height/2-edge_height/2 ])
      cube([ con_width, bottom_depth+2, con_height+edge_height ], center = false);
    
    }

  }
}



module mag_test(){
  difference(){
    union(){
      cube([ con_width, con_depth, 4 ], center = true);
    }
//magnet holes
    //translate([ side_width/2+extension_width-con_width/2, side_depth/2-top_depth/2, -con_height ]){
      cylinder( h = mag_height*2, r = mag_rad, $fn = 96, center = true );
    translate([ 0, 0, mag_height/2])
      cylinder( h = mag_height+.12, r = mag_rad+1.1, $fn = 96, center = true );
    }
  }


module extension(side){
  if (side == "top") {
    cube([extension_width, top_depth, height+edge_height ], center = true );
  }
  if (side == "bottom"){
    cube([extension_width, bottom_depth, height+edge_height ], center = true );
  }
}

module bolt_hole(){              
  difference()
    cylinder( h = 10, r = 4, center = true );
}

                
module connector(){
  difference() {
    union(){
      cube([ con_width, con_depth, con_height ], center = true);
    }
    translate([ 0, -con_depth/3, 0 ]) {
      cylinder( h = nut_height, r = nut_rad, center = true, $fn=6 );
     
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


module insignia(scale_width, scale_depth, scale_height) {
                scale([ scale_width, scale_depth, scale_height ])
                import(file ="/Users/darrylestes/3d_projects/sonar_tech/Navy_Sonar_Technician_Emblem_4116858/files/Sonar_Tech.stl" );
      //      }
        }



//translate([ 0, 0, height+5 ])
//  rotate([ 0, 0, 45 ])
//insignia(sw, sd, sh+0);  

//connector();    
//banner("top");
banner("bottom");
//side();
//emboss();