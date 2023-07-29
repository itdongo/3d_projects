$fn=96;


max_height = 159;
max_depth = 380;
dovetail_rad = 9.7;
width = 220;
depth = 132.5;
side_depth = max_depth/3+6.85/2;
height = 7;

leg_width = 30;
leg_depth = 5;
filet = 20;
center_depth = 127-7;

module base() {
    difference() {
        union() {
            cube ([ width, center_depth, height ]);
        translate([ 0, 0, height/2 ])
        rotate([ 90, 0, 90 ])
            cylinder( h = width, r = 1.8, $fn =3 );           
        
        translate([ width, center_depth, height/2 ])
        rotate([ 90, 0, 270 ])
            cylinder( h = width, r = 1.8, $fn =3 );           
        
        }
    }
}


module legs() {
  
    difference() {
        union() {
            
            translate ([ 0, 0, 0 ])
                cube ([ leg_width, leg_depth, max_height-height ]);
            translate ([ width-leg_width, 0, height ])
                cube ([ leg_width, leg_depth, max_height-height ]);
            
                cube ([ width, leg_depth, height ]);
        }
        
        translate([ width, 0, height/2 ])
        rotate([ 90, 0, 270 ])
        cylinder( h = width, r = 2.2, $fn =3 );
        
        translate([ 0, leg_depth, height/2 ])
        rotate([ 90, 0, 90 ])
        cylinder( h = width, r = 2.2, $fn =3 );
        
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
//translate([ 0, -5, 0 ])
//notch_test();
//*
translate([ 0, -leg_depth, 0 ])
  legs();
//*/
base();
/*
mirror([ 0, 1, 0 ])
translate([ 0, leg_depth, 0 ])
  center();
translate([ 0, center_depth, 0 ])
  legs();
translate([ 0, -center_depth-leg_depth*2, 0 ])
  legs();
translate([ 0, -center_depth*2-leg_depth*2, 0 ])
  center();
translate([ 0, -center_depth*2-leg_depth*3, 0 ])
  legs();
*/
/*
translate([ 0, depth-dovetail_rad/2-.5, 0 ])
side();
// */
/*
translate ([ 0, +dovetail_rad/2+1.5, 0 ])
mirror([0,1,0 ])
    side();
// */