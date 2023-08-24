//arm_length=181.2;
//bar_depth=27;
//base_width=110;
//base_depth=27;
//base_height=32.8;
//base_x=0;
//base_y=0;
//base_z=0;
//mount_hole_short_depth=14;
//mount_hole_long_depth=17;
arm_x=0;
arm_y=10;
arm_z=35.8;
//spool_mount_x=arm_x+9.3;    // =18.3
//spool_mount_y=arm_y+20;     // =10
//spool_mount_z=arm_z+165.3;  // =205.3

$fn = 96;

module twistlock_ring() {
  difference() {
    union() {
      cylinder(h = 12, r = 18.3, center = true );
    }  
// The center hole
    cylinder(h = 12, r = 15.15, center = true);              
 }
 
// add spool stops
  difference() {
    union() {
        translate([ 14, 0, -2]) 
        rotate([ 0, 0, 60 ])
          cylinder( h = 4, r = 3, center = false, $fn = 3 );
        
        mirror([ 1, 0, 0 ])
        translate([ 14, 0, -2])
        rotate([ 0, 0, 60 ])
          cylinder( h = 4, r = 3, center = false, $fn = 3 );     
    }
    translate([ 10, 0, 1]) 
      cylinder(h = 10, r = 2.5, center = true );
    
    mirror([ 1, 0, 0 ])
    translate([ 10, 0, 1]) 
      cylinder(h = 10, r = 2.5, center = true );
  }
}


// Twist Lock Cylinder

//*
//$fn = 100; // Number of facets for a smooth cylinder

module twistlock() {
arch_base   = 4;
arch_angle  = 160;
arch_radius = 15.5;

difference() {
    union() {
        cylinder(h = 13, d = 30, center = true);
    }
    //center hole
    translate([0, 0, 0]) 
      cylinder(13.2, r = 6, center = true);
    
    //channel guides
    rotate( [0, 0, 0])
    rotate_extrude( angle = arch_angle, $fn = 100 )
    translate( [-arch_radius, 0] )
    difference()
    translate( [0, -arch_base / 2] )
      square( arch_base );
    
    rotate( [180, 180, 0])
    rotate_extrude( angle = arch_angle, $fn = 100 )
    translate( [-arch_radius, 0] )
    difference()
    translate( [0, -arch_base / 2] )
      square( arch_base );
        
    //Add entrance notches
    rotate( [180, 180, -40])
    rotate_extrude( angle = 20, $fn = 100 )
    translate( [-arch_radius, 0] )
    difference()
    translate( [0, -arch_base / 2.2] )
      square( [4, 9] );
    
    rotate( [180, 180, -40])
    rotate_extrude( angle = 20, $fn = 100 )
    translate( [-arch_radius, 00] )
    difference()
    translate( [0 + 27, -arch_base / 2.2] )
      square( [4, 9] );

}    

    

//Add a bump
    union()
        translate ([11.5, 3, 0]) 
        cylinder( h = 4, r = 1, center =true);
        mirror([ 1, 0, 0 ])
        translate ([11.5, -3, 0]) 
        cylinder( h = 4, r = 1, center =true);
}

module test_base() {
  cube([ 35, 35, 2.5 ], center = true );
}

//*/
rotate([ 0, 0, 145 ])
//translate([ 20, 20, 20 ])
twistlock_ring();
//twistlock();
//translate([ 0, 0, -7.7 ])
//rotate ([ 0, 0, 40 ])
//test_base();