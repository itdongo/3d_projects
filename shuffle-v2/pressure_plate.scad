$fn=200;
short_plate_depth=39.5;
long_plate_depth=43;
plate_height=3;
plate_width=92.4;
module plate() {
    difference() {
    union() {
        cube([ plate_width, long_plate_depth+4, 6 ] );
        translate([ -3, 0, 0 ]) cube([ 3, long_plate_depth-9, 3 ]);
        translate([ plate_width, 0, 0 ]) cube([ 3, long_plate_depth-9, 3 ]);
        }
        translate([ 2, 2, 2 ]) cube([ plate_width-4, long_plate_depth, 2 ]);
    }
    
    
    /*
    union() {
        cube([ plate_width, short_plate_depth-8, plate_height ]);
        translate([ 6, short_plate_depth-8, 0 ]) cube([plate_width-12, 8, 3]);
    }
        translate([-4, 3.5, 1.5]) rotate([0, 90, 0]) cylinder(h = 4, d = 3);
        translate([92.4, 3.5, 1.5]) rotate([0, 90, 0]) cylinder(h = 4, d = 3);
        translate([-4, 35.5, 1.5]) rotate([0, 90, 0]) cylinder(h = 10, d = 3);
        translate([86.4, 35.5, 1.5]) rotate([0, 90, 0]) cylinder(h = 10, d = 3);
 
/*     
    union() {
        translate([ 0, -50, 0 ]) cube([plate_width, long_plate_depth, plate_height]);
        translate([ 4, -56, 0 ]) cube([plate_width-8, 6, 3]);

        translate([-4.5, -53, 1.5]) rotate([0, 90, 0]) cylinder(h = 8.5, d = 3);
        translate([86.4, -53, 1.5]) rotate([0, 90, 0]) cylinder(h = 8.5, d = 3);
        translate([-4.5, -12, 1.5]) rotate([0, 90, 0]) cylinder(h = 4.5, d = 3);
        translate([90.4, -12, 1.5]) rotate([0, 90, 0]) cylinder(h = 4.5, d = 3);
    }
*/
}

guide_x1=0;
guide_y1=0;
guide_z1=0;
module spring_guide() {
    difference() {
        union() {
            translate([ guide_x1, guide_y1, guide_z1 ]) rotate([ 0, 0, 0 ]) cylinder( h = 3, r = 3.5, center=true );
 
            translate([ guide_x1+3, guide_y1, guide_z1 ]) rotate([ 0, 90, 0 ]) cylinder( h = 45, r = 1.5 );
        }
        translate([ guide_x1, guide_y1, guide_z1 ]) rotate([ 0, 0, 0 ]) cylinder( h = 3.1, r = 2, center = true );
    }
}

module spacer() {
        difference() {
        union() {
            translate([ 0, 0, 0 ]) rotate([ 0, 90, 180 ]) cylinder( h = 3, r = 3.5, center=true );
        }
        translate([ 1.5, 0, 0 ]) rotate([ 0, 90, 180 ]) cylinder( h = 3, r = 2 );
    }
}

module newplate() {
    polygon([ [0,1], [1,1] ]);
}

//newplate();
plate();
//spring_guide();
//spacer();