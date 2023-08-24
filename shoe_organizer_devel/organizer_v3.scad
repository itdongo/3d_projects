$fn=96;

// Overall dimensions
max_height = 152.4;
max_depth = 381;
number_of_sections = 3;

// Table Top dimensions
width = 215;
depth = 132.5;
height = 7;
notch_height = 10;
top_depth = max_depth/number_of_sections+notch_height/number_of_sections/2;


nut_height = 2.4;
nut_rad = 3.2;
nut_width = 5;
screw_height = 1.65;
screw_rad = 1.7;
screw_length = 2;

spacing = 38;

leg_width = 30;
leg_depth = 10;
filet = 20;
side_depth = max_depth/3+notch_height/2;

module table_top() {
    difference() {
        union() {
            cube ([ width, top_depth, height ]);
        }
        translate([ notch_height, notch_height, 0 ])
        cube ([ width-notch_height*2, top_depth-notch_height*2, height*2 ]);
// notch to join sections
          translate([ 0, 0, height/2+.5 ])
            cube([ width, notch_height, height/2 ]);           
          translate([ 0, top_depth-notch_height, height/2 ])
            cube([ width, notch_height, height/2 ]);

// leg screw holes
        translate([ leg_width/4, notch_height/2, 0 ]) {
            cylinder( h = height*2, r = screw_rad );
            cylinder( h = screw_height, r1 = 3, r2 = screw_rad );
          translate([ leg_width/2, 0, 0 ]) {
            cylinder( h = height*2, r = screw_rad );
            cylinder( h = screw_height, r1 = 3, r2 = screw_rad );
          }
        }
        translate([ width-leg_width*.75, notch_height/2, 0 ]) {
            cylinder( h = height*2, r = screw_rad );
            cylinder( h = screw_height, r1 = 3, r2 = screw_rad );
          translate([ leg_width/2, 0, 0 ]) {
            cylinder( h = height*2, r = screw_rad );
            cylinder( h = screw_height, r1 = 3, r2 = screw_rad );
          }
        }
        translate([ leg_width/4, top_depth-notch_height/2, 0 ]) {
            cylinder( h = height*2, r = screw_rad );
              cylinder( h = screw_height, r1 = 3, r2 = screw_rad );
            
          translate([ leg_width/2, 0, 0 ]) {
            cylinder( h = height*2, r = screw_rad );
              cylinder( h = screw_height, r1 = 3, r2 = screw_rad );
            
          }
        }
        translate([ width-leg_width*.75, top_depth-notch_height/2, 0 ]) {
            cylinder( h = height*2, r = screw_rad );
              cylinder( h = screw_height, r1 = 3, r2 = screw_rad );
            
          translate([ leg_width/2, 0, 0 ]) {
            cylinder( h = height*2, r = screw_rad );
              cylinder( h = screw_height, r1 = 3, r2 = screw_rad );
            
          }
        }
//         translate([ notch_height, notch_height, 0 ])
  //         cube ([ width-notch_height*2, top_depth-notch_height*2, height ]);
      }
      

// lighten up
base_y=20;
t_length = 20;
//infill_size = infill_rad*1.95;
t_space = 2;
      
      
translate([ notch_height-1, notch_height, height ]) {
rotate([ 90, 90, 29.1 ]) {
  cube([ height, 225, 1 ]);
}
//}
translate([ 10, top_depth, height ])
rotate([ 180, 90, 55 ]) 
  cube([ height, 225, 1 ]);

 
/*  
linear_extrude(7) {
//for(i = [ 0 : t_length+t_space : 300 ]) {
triangle_points =[[0,0],[30,0],[15,30],[1,1],[28,1],[15,28]];
 triangle_paths =[[0,1,2],[3,4,5]];
 polygon(triangle_points,triangle_paths,20);
}
linear_extrude(7) {

triangle_points =[[50,50],[80,50],[65,80],[51,51],[78,51],[65,78]];
 triangle_paths =[[0,1,2],[3,4,5]];
 polygon(triangle_points,triangle_paths,20);
 
//}
}
*/

/*
      translate([ notch_height/2, 20, -2 ]) {
        for(i = [ infill_rad : infill_size : 300 ])
        {
          translate ([ i,  , 0 ])
          color( "blue" )
          rotate ([ 0, 0, 90 ])
            cylinder( h = height, r = infill_rad, $fn = 3 );
        }

        for(i = [ 1 : infill_size : 230])
        {
          
          translate ([ i, infill_rad/2, 0 ])
          color( "blue" )
          rotate ([ 180, 180, 90 ])
            cylinder( h = height, r = infill_rad, $fn = 3 );
      }
 
        for(i = [ 1 : infill_size : 230 ])
        {
          translate ([ i, infill_rad*1.5+infill_space, 0 ])
          color( "blue" )
          rotate ([ 0, 0, 90 ])
            cylinder( h = height, r = infill_rad, $fn = 3 );
        }     

        for(i = [ infill_rad : infill_size : 224])
        {         
          translate ([ i, infill_rad*2+infill_space, 0 ])
          color( "blue" )
          rotate ([ 180, 180, 90 ])
            cylinder( h = height, r = infill_rad, $fn = 3 );
        }        
*/
/* 
        for(i = [ infill_rad : infill_size : 224 ])
        {
          translate ([ i, infill_rad*3+infill_space*2, 0 ])
          color( "blue" )
          rotate ([ 0, 0, 90 ])
            cylinder( h = height, r = infill_rad, $fn = 3 );
        }
       
        for(i = [ 1 : infill_size : 230])
        {
          
          translate ([ i, infill_rad*3.5+infill_space*2, 0 ])
          color( "blue" )
          rotate ([ 180, 180, 90 ])
            cylinder( h = height, r = infill_rad, $fn = 3 );
        }

        
//          }    
        } 


  union() {
    translate([ 0, 10, 0 ])
    cube([ width, 1, height ]);
    translate([ 0, 49, 0 ])
    cube([ width, 1, height ]);
    translate([ 0, 87, 0 ])
    cube([ width, 1, height ]);
    translate([ 0, notch_height, 0 ])
    cube([ 10, side_depth-notch_height*1.5, height ]);
    translate([ width-notch_height, notch_height, 0 ])
    cube([ 10, side_depth-notch_height*1.5, height ]);
*/  
  }

}


module table_side() {
    difference() {
        union() {
            cube ([ width, side_depth, height ]);
        }
//                translate([ notch_height, notch_height, 0 ])
//        cube ([ width-notch_height*2, side_depth-notch_height*2, height ]);
      
// notch to join sections
          translate([ 0, 0, 0 ]) {
            cube([ width, notch_height, height/2 ]);           
//          translate([ 0, side_depth-notch_height, 0 ])
//            cube([ width, notch_height, height/2 ]);
          }

// screw holes
          translate([ width/2, notch_height/2, 0 ]) {
            cylinder( h = height*2, r = screw_rad );
            translate([ 0, 0, 5 ])
            cylinder( h = nut_height, r = nut_rad, $fn = 6 );

            }

// leg screw holes
        translate([ leg_width/4, notch_height/2, 0 ]) {
            cylinder( h = height*2, r = screw_rad );
          translate([ leg_width/2, 0, 0 ]) {
            cylinder( h = height*2, r = screw_rad );
          }
        }
        translate([ width-leg_width*.75, notch_height/2, 0 ]) {
            cylinder( h = height*2, r = screw_rad );

          translate([ leg_width/2, 0, 0 ]) {
            cylinder( h = height*2, r = screw_rad );

          }
        }
        translate([ leg_width/4, side_depth-notch_height/2-1, 0 ]) {
            cylinder( h = height*2, r = screw_rad );
              cylinder( h = screw_height, r1 = 3, r2 = screw_rad );
            
          translate([ leg_width/2, 0, 0 ]) {
            cylinder( h = height*2, r = screw_rad );
              cylinder( h = screw_height, r1 = 3, r2 = screw_rad );
            
          }
        }
        translate([ width-leg_width*.75, side_depth-notch_height/2-1, 0 ]) {
            cylinder( h = height*2, r = screw_rad );
              cylinder( h = screw_height, r1 = 3, r2 = screw_rad );
            
          translate([ leg_width/2, 0, 0 ]) {
            cylinder( h = height*2, r = screw_rad );
              cylinder( h = screw_height, r1 = 3, r2 = screw_rad );
            
          }
        }
//        translate([ notch_height, notch_height, 0 ])
//        cube ([ width-notch_height*2, side_depth-notch_height*2, height ]);
    }
/*    
    union() {
      translate([ 0, notch_height+3, 0 ])
        cube([ notch_height, side_depth-notch_height*2+1, height ]);
      
      translate([ width-notch_height, notch_height+3, 0 ])
        cube([ notch_height, side_depth-notch_height*2+1, height ]);
      
    }
*/
/*            union() {
          translate([ width/2, side_depth/2, 0 ])
          cube([ width, 1, 1 ]);
              
          translate([ notch_height, notch_height+4, 0 ])
          rotate([ 0, 0, 60 ])
          cube([ side_depth-notch_height+3, 1, height ]);
        
          translate([ side_depth+notch_height-5, notch_height, 0 ])
          rotate([ 0, 0, 120 ])
          cube([ side_depth-notch_height+8, 1, height ]);
        
          translate([ side_depth+notch_height-5, notch_height, 0 ])
          rotate([ 0, 0, 60 ])
          cube([ side_depth-notch_height+2, 1, height ]);
        
          
          translate([ width, notch_height, 0 ])
          rotate([ 0, 0, 120 ])
          cube([ side_depth-notch_height, 1, height ]);
        
          translate([ width-side_depth-notch_height+5, notch_height, 0 ])
          rotate([ 0, 0, 60 ])
          cube([ side_depth-notch_height+8, 1, height ]);
        
          translate([ side_depth+notch_height-5, notch_height, 0 ])
          rotate([ 0, 0, 120 ])
          cube([ side_depth-notch_height+8, 1, height ]);
          
              }
*/
}

module legs() {
  
    difference() {
        union() {
            
            translate ([ 0, 0, 0 ])
                cube ([ leg_width, leg_depth, max_height-height ]);
            //translate ([ width-leg_width, 0, height ])
              //  cube ([ leg_width, leg_depth, max_height-height ]);
            
                //cube ([ width, leg_depth, height ]);
        }
        translate([ leg_width/4, leg_depth/2, 0 ]) {
            cylinder( h = height*2, r = screw_rad );
          // nut notch
          translate([ -nut_width*.6, -nut_width/2, screw_length ])
          cube([ nut_width+1.5, 17, nut_height ]);
            
          translate([ leg_width/2, 0, 0 ]) {
            cylinder( h = height*2, r = screw_rad );
          translate([ -nut_width*.6, -nut_width/2, screw_length ])  
            cube([ nut_width+1, 17, nut_height ]);
            
          }
        }
    }

  }
  
  module notch_test(){
    union(){
        mirror([0, 1, 0 ])
             cube ([ width-leg_width*3, leg_depth*1.5, leg_depth ]);
          translate([ depth-5, 1, 2.5 ])
        rotate([ 90, 0, 270 ])
        cylinder( h = depth-5, r = 1.8, $fn =3 );
    }
    
  }
  
//*
translate([ 0, top_depth-leg_depth, +height ])
  legs();
//*/
//translate([ 0, -notch_height, 0 ])
table_top();
/*
mirror([ 0, 1, 0 ])
  rotate([ 0, 180, 0 ])
  translate([ -width, -notch_height, -height ])
table_top();

mirror([ 0, 1, 0 ])
  rotate([ 0, 180, 0 ])
  translate([ -width, -top_depth*2+notch_height, -height ])
table_top();

//translate([ 0, top_depth-notch_height*2, 0 ])
//  table_side();
/*

//*/
/*
translate([ 0, depth-infill_rad/2-.5, 0 ])
side();
// */
/*
translate ([ 0, +infill_rad/2+1.5, 0 ])
mirror([0,1,0 ])
    side();
// */