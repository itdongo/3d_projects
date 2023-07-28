$fn=96;
//use <roundedcube/roundedcube.scad>;

arm_length=181.2;
bar_depth=27;
base_width=110;
base_depth=27;
base_height=32.8;
base_x=0;
base_y=0;
base_z=0;
mount_hole_short_depth=14;
mount_hole_long_depth=17;
arm_x=0;
arm_y=10;
arm_z=35.8;
spool_mount_x=arm_x+9.3;    // =18.3
spool_mount_y=arm_y+20;     // =10
spool_mount_z=arm_z+165.3;  // =205.3

module base() {
    difference() {
        union() {
            //translate([base_x, base_y-3, base_z])
              cube([ base_width, base_depth+4, base_height+4 ]);
        }
        translate([base_x, base_y, base_z-1])
        cube([base_width, base_depth, base_height]);
        translate([base_width-8, base_depth-mount_hole_short_depth, base_height-1]) cylinder(h = 5, r = 2.5);
        translate([base_width-38.5, base_depth-mount_hole_short_depth, base_height-1]) cylinder(h = 5, r = 2.5);
        
    }
}
/*
module Trapaziod3D(height, topWidth, topLength, bottomWidth, bottomLength)
{
hull()
{
cube([bottomWidth, bottomLength, .1], center = true);
translate([0,0,height])
{
cube([topWidth, topLength, .1], center = true);
}
}
}
*/

module arm() {
    difference() {
        union() {
            translate([arm_x, arm_y+11, arm_z+1]) 
             cube([ 19, 10, arm_length-1 ]);
            translate([spool_mount_x, spool_mount_y, spool_mount_z]) 
            rotate([90, 0, 0]) 
              cylinder(h = 10, d = 36.6 );
            translate([0, 0, 37]) 
              cube([ 19, 21, 21 ]);
        }  
          translate([0, 0, 58]) 
          rotate([90, 0, 90]) 
          cylinder(h=40, r = 21);
            //translate([spool_mount_x+16, spool_mount_y-17.2, spool_mount_z+2.2]) rotate([90, 78, 180]) linear_extrude(height = 4) {
                //polygon(points = [[0, 1], [4, 0], [3.5, 2], [3, 4]]);
            //}
            //translate([spool_mount_x-16.1, spool_mount_y-13, spool_mount_z+2.2]) rotate([90, 78, 0]) linear_extrude(height = 4) {
              //  polygon(points = [[0, 1], [4, 0], [3.5, 2], [3, 4]]);
            //}
        
        
        //Add notches to arm

        translate([spool_mount_x, spool_mount_y+1, spool_mount_z]) rotate([90, 0, 0]) cylinder(h = 22, d = 30.3);
                
 }
 
 
//add spool stops
difference() {
    union() {
        translate([spool_mount_x+16, spool_mount_y-7.2, spool_mount_z+2.2]) rotate([90, 78, 180]) linear_extrude(height = 4) {
            polygon(points = [[0, 1], [4, 0], [3.5, 2], [3, 4]]);
        }
        translate([spool_mount_x-16.1, spool_mount_y-3, spool_mount_z+2.2]) rotate([90, 78, 0]) linear_extrude(height = 4) {
            polygon(points = [[0, 1], [4, 0], [3.5, 2], [3, 4]]);
        }
    }
    translate([spool_mount_x+10.9, spool_mount_y-2.9, spool_mount_z+.2]) rotate([90, 0, 0]) cylinder(h = 5, r = 2.5);
    translate([spool_mount_x-11, spool_mount_y-2.9, spool_mount_z+.2]) rotate([90, 0, 0]) cylinder(h = 5, r = 2.5);
}
}

//polygon(points = [[0, 0], [10/2, 15], [10, 0]]);




// Twist Lock Cylinder

/*
$fn = 100; // Number of facets for a smooth cylinder

arch_base   = 4;
arch_angle  = 160;
arch_radius = 15;

difference() {
    union() {
        cylinder(h = 10, d = 29.8, center = true);
    }
    translate([0, 0, 0]) cylinder(10.2, r = 6, center = true);
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
    rotate( [180, 180, 0])
    rotate_extrude( angle = 20, $fn = 100 )
    translate( [-arch_radius, 0] )
    difference()
    translate( [0, -arch_base / 2.2] )
    square( [4, 7] );
    rotate( [180, 180, 0])
    rotate_extrude( angle = 20, $fn = 100 )
    translate( [-arch_radius, 0] )
    difference()
    translate( [0 + 26.1, -arch_base / 2.2] )
    square( [4, 7] );
}    

    

//Add a bump
    union()
        translate ([9, -6, 0]) 
        cylinder(4, r = 1, center =true);
        translate ([-9, 6, 0]) 
        cylinder(4, r = 1, center =true);
*/






base();
//Trapaziod3D(4, 7, 10, 7, 15);
arm();