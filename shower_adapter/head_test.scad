$fn = 96;

head_radius = 159/2;
head_radius_inside = 154/2;
head_height = 19.2;
head_angle = 160;
head_base = 3;
head_z = -3.2;

wall_thickness = 3;

hose_radius = 22/2;
hose_height = 12;

reducer_height = 40;

clip_base   = 14;
clip_angle  = 15;
clip_radius = 154;
clip_height = 3;

module arc_mirror() {
    rotate_extrude( angle = head_angle, $fn = 96 )
                translate( [-head_radius-1, head_z ] )
                    union(){
                        translate( [0, -head_base / 2] )
                        rotate([ 0, 0, 0 ])
                        square([ head_base, head_height+6 ]);
                    }
             mirror([ 32, 180, 0 ])
                    rotate_extrude( angle = head_angle, $fn = 96 )
                translate( [-head_radius-1, head_z ] )
                    union(){
                        translate( [0, -head_base / 2] )
                        rotate([ 0, 0, 0 ])
                        square([ head_base, head_height+6 ]);
                    }
                    
    rotate_extrude( angle = 360, $fn = 96 )
        translate( [-head_radius-1, head_z+22 ] )
        union(){
            translate( [0, -head_base / 2] )
            rotate([ 0, 0, 0 ])
            square([ head_base, 3 ]);
                    }
                }

module head() {
    difference() {
        union() {
            //cylinder( h = head_height, r = head_radius, center = false );
            //translate([ 0, 0, wall_thickness ])
/*            rotate_extrude( angle = head_angle, $fn = 96 )
                translate( [-head_radius, head_z ] )
                    union(){
                        translate( [4, -head_base / 2] )
                        rotate([ 0, 0, 180 ])
                        square([ head_base, head_height+6 ]);
                    }
             mirror([ 32, 180, 0 ])
                    rotate_extrude( angle = head_angle, $fn = 96 )
                translate( [-head_radius, head_z ] )
                    union(){
                        translate( [4, -head_base / 2] )
                        rotate([ 0, 0, 180 ])
                        square([ head_base, head_height+6 ]);
                    }
*/
            translate([ 0, 0, 0 ])
            arc_mirror();            
                }
        cylinder( h = head_height, r = head_radius_inside, center = false );
 
   /* //clip cutouts
    translate([ head_radius-wall_thickness-5.5, 26, -1 ])
        rotate([ 0, 0, 20 ])
        cube([ wall_thickness+1, wall_thickness, head_height ]);
    
    translate([ head_radius-wall_thickness-16, 46, -1 ])
        rotate([ 0, 0, 40 ])
        cube([ wall_thickness+1, wall_thickness, head_height ]);
    
    translate([ -head_radius+19.5, -46.5, -1 ])
        rotate([ 0, 0, 220 ])
        cube([ wall_thickness+1, wall_thickness, head_height ]);
    
    translate([ -head_radius+wall_thickness+3, -30.5, -1 ])
        rotate([ 0, 0, wall_thickness*7 ])
        cube([ wall_thickness+1, wall_thickness, head_height ]);
   */ }

 }
 
 module reducer() {
     difference() {
         union() {
            translate([ 0, 0, head_height ])
                cylinder( reducer_height, head_radius+2, hose_radius, center = false );
             
         }
        translate([ 0, 0, head_height ])
        cylinder( reducer_height, head_radius-wall_thickness, hose_radius-wall_thickness, center = false );

     }
}
 
module hose() {
    difference() {
        union() {
        translate([ 0, 0, head_height+reducer_height ])
            rotate([ 0, 0, 0 ])
            cylinder( h = hose_height, r = hose_radius, center = false );     
        }
            translate([ 0, 0, head_height+reducer_height ])
            rotate([ 0, 0, 0 ])
            cylinder( h = hose_height, r = hose_radius-wall_thickness, center = false ); 

    }
}
 
 module clips() {

union() {
    translate([ -13.7, 3, 11 ]) { 
        rotate( [-.1, 1.5, -17.5])
        rotate_extrude( angle = clip_angle+1, $fn = 100 )
            translate( [-clip_radius/2, 0] )
            union(){
                translate( [0, -clip_base] )
                translate( [clip_base, 0] )
                rotate([ 0, 0, 30 ])
                circle( d = clip_base * 3 / 7, $fn = 3);
        }
        translate([ 13.7, -4.3, -18 ])
        rotate([ 0, 0, -17.5 ])
        rotate_extrude( angle = 13, $fn = 96 )
                translate( [-head_radius-1, head_z+5 ] )
                    union(){
                        translate( [0, -head_base+6 / 2] )
                        rotate([ 0, 0, 0 ])
                        square([ head_base, head_height+5.5 ]);
                    
            }
        }
    
    
    }
mirror([ 80, -15, 0 ])
    union() {
    translate([ -13.7, 4.3, 11 ]) 
        rotate( [-.1, 1, -17.5])
        rotate_extrude( angle = clip_angle+1, $fn = 100 )
            translate( [-clip_radius/2, 0] )
            union(){
                translate( [0, -clip_base] )
                translate( [clip_base, 0] )
                rotate([ 0, 0, 30 ])
                circle( d = clip_base * 3 / 7, $fn = 3);
        }
        translate([ 0, 0, -6.2 ])
        rotate([ 0, 0, -17.5 ])
        rotate_extrude( angle = 13, $fn = 96 )
                translate( [-head_radius-1, head_z+5 ] )
                    union(){
                        translate( [0, -head_base+6 / 2] )
                        rotate([ 0, 0, 0 ])
                        square([ head_base, head_height+5.5 ]);
                    
            }
    
    
    }


}

head();
hose();
reducer();
clips();
