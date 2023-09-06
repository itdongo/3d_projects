$fn=96;
use </Users/darrylestes/3D_Stuff/OpenSCAD/libraries/twist_lock/twist_lock.scad>;
//use <roundedcube/roundedcube.scad>;

arm_length=135;
bar_depth=27;
base_width=180;
base_depth=27;
base_height=8;
base_x=0;
base_y=0;
base_z=0;
mount_hole_short_depth=10;
mount_hole_long_depth=16;
arm_x=0;
arm_y=10;
arm_z=35.8;
spool_mount_x=arm_x+9.3;    // =18.3
spool_mount_y=arm_y+20;     // =10
spool_mount_z=arm_z+165.3;  // =205.3
spool_hole_offset=0;

screw_hole_left_to_end=143;
screw_hole_right_to_left=30;

//base_width=80;
//base_height=1;
//screw_hole_left_to_end=45;
//screw_hole_right_to_left=30.5;

module base() {
    difference() {
        union() {
            //translate([base_x, base_y-3, base_z])
              cube([ base_width, base_depth, base_height ]);
          
          translate([ -.7, 0, 0 ])
          mirror([ 0, 0, 1 ])
        cube([ base_width/2-20, base_depth, 3 ]); 
        }
        //translate([base_x, base_y, base_z-1])
        //cube([base_width, base_depth, base_height]);
        translate([screw_hole_left_to_end, base_depth-mount_hole_short_depth, base_height-8]) 
          cylinder(h = 10, r = 2.5);
        translate([screw_hole_left_to_end+screw_hole_right_to_left, base_depth-mount_hole_short_depth, base_height-8]) 
          cylinder(h = 10, r = 2.5);
        
        
        
    }
}


module arm() {
    difference() {
        union() {
            //translate([arm_x, arm_y+11, arm_z+1]) 
             cube([ base_depth, 11.5, arm_length ], center = true);
          translate([0, -16, -arm_length/2+17]) 
              cube([ base_depth, 21, 19 ], center = true);
 
 
                
        }  
        translate([0, -41*.65, -arm_length/2+21+base_height]) 
          //translate([-1, 0, 58]) 
          rotate([90, 0, 90]) 
          cylinder(h=41, r = 21, center = true);
        
          translate([ 0, 10, arm_length/2-spool_hole_offset ])
          rotate([ 90, 0, 0 ])
            cylinder( h = 40, r = 17 ); 
         

 
 }
 
 translate([ 0, 0, arm_length/2-spool_hole_offset ])
          rotate([ 90, 90, 0 ])
          twistlock_ring();

} 

module spool_adapter() {
  difference() {
    union() {
      cube([ 46, 30, 12 ], center = true);
    }
    translate([ -12.25/2, 0, 0 ]){
    #cylinder( h = 4, r = 12, center = true );
      translate([ 46/2-20/2, 0, 0 ])
    #cube([ 26, 24, 4 ], center = true );
      translate([ 20, 0, 4 ])
      #cube([ 24, 20.5, 4 ], center = true );
    }
  }

}

spool_adapter();
//base();
//translate([ 10/2, base_depth/2, arm_length/2 ])
//rotate([ 0, 0, 90 ])
//arm();