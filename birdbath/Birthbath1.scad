//BIRD BATH WITH DIFFERENT LEVELS
//By Coat 2019

//use <text_on_OpenSCAD/text_on.scad>  //used library

//---------
//parameters
//smoothness
  $fn=192;               
//radius outside 
  rad0=100;              
//total height 
  h0 = 70;               
//radius innercircles  
  rad1=60;               
  rad2=60;
  rad3=60;

//distance innercylinders from bottom
  tz1=25;                
  tz2=40;
  tz3=55; 
//offset innercircle from middle
  ty1=25;               
  ty2=25;
  ty3=25;
//rotation innercircle around middle
  rot1=0;             
  rot2=120;
  rot3=240;
//width/height mitered edge
  mit=4;               
//text on side
  text="I tawt I taw a puddy tat!****";
  //text="Customizable text!****";
  //text="*****************************";
  //text=":::::::::::::::::::::::::::::";
  
//darryl's variables
extension_height = 20;
spool_mount_x = 0;
spool_mount_y = 8;
spool_mount_z = 0;

//mount
//rail size
rail_size = 114.3;
clamp_width = 80;
clamp_depth = 80; //80
clamp_height = 30; //30
clamp_x = -clamp_width/2;
clamp_y = -clamp_depth/2;
clamp_z = clamp_height/2;
clamp_space = 8;

//bolt holes
bolt_length = 50;
bolt_size = 6 ;
nut_size = 10.2;
nut_height = 4;

//bolt heads
head_dia = 8.8;
head_length = 5;

screw_rad = 1.7;
screw_head = 3;

nut_rad = 3.2;
m3_nut_height = 2.4;

//twist_lock
arch_base   = 4;
arch_angle  = 160;
arch_radius = 15;
tw_base = head_length+2;

//The bath
module the_bath() {
  translate([ 0, 0, 0 ]) {
difference()
{
    union()
    {
      

  //body with text  
  mitercyl(rad0,h0,mit,mit);
    
    }
  
  translate([ 0, 0, +20 ])  
  cylinder( h = 51, r = 90 );
  //text_on_cylinder(t=text,r1=rad0, r2=rad0, h=25, font="impact", direction="ttb", size=27, extrusion_height = 2);

    
  translate([ 0, 0, -5 ])  
    cylinder( h = 20, r = 16 );
    
    
    }
          translate ([ 0, 0, +3 ])
          rotate([ 180, 0, 0 ])
        base_lock();  
    
}
}


// base lock
module base_lock(){
    
rotate([ 90, 0, 0 ]) {
difference() {    
            union() {
              
/*              
                translate([ 0, -extension_height/2-2, 0 ])
                rotate([ 270, 0, 0 ])
                mitercyl(rad0,extension_height,0,mit);
*/                
              //cylinder( h = 20, r = 25, center = false);
//            translate([arm_x, arm_y, arm_z]) cube([20, 20, arm_length]);
            translate([spool_mount_x, spool_mount_y-5, spool_mount_z]) 
                rotate([90, 0, 0]) 
                cylinder(h = 15, d = 36.6 );
            translate([spool_mount_x+16, spool_mount_y-17.2, spool_mount_z+2.2]) 
                rotate([90, 78, 180]) 
                linear_extrude(height = 4) {
                polygon(points = [[0, 1], [4, 0], [3.5, 2], [3, 4]]);
            }
            translate([spool_mount_x-16.1, spool_mount_y-13, spool_mount_z+2.2]) 
            rotate([90, 78, 0]) 
            linear_extrude(height = 4) {
                polygon(points = [[0, 1], [4, 0], [3.5, 2], [3, 4]]);
            }
        }

        translate([spool_mount_x, spool_mount_y+1, spool_mount_z]) 
        rotate([90, 0, 0]) 
        cylinder(h = 22, d = 30.3);
        }
 
//add spool stops
difference() {
    union() {
      /*
        translate([spool_mount_x+16, spool_mount_y-17.2, spool_mount_z+2.2]) 
        rotate([90, 78, 180]) 
        linear_extrude(height = 4) {
            polygon(points = [[0, 1], [4, 0], [3.5, 2], [3, 4]]);
        }
        translate([spool_mount_x-16.1, spool_mount_y-13, spool_mount_z+2.2]) 
        rotate([90, 78, 0]) 
        linear_extrude(height = 4) {
            polygon(points = [[0, 1], [4, 0], [3.5, 2], [3, 4]]);
        }
        */
        translate([0, -1.5, 14]) 
        rotate([90, 90, 0])
        cylinder( h = 4, r = 2.5, center = true, $fn = 3 );

        mirror([ 0, 0, 1 ])
translate([0, -1.5, 14]) 
        rotate([90, 90, 0])
        cylinder( h = 4, r = 2.5, center = true, $fn = 3 );

    
       
       /* 
        linear_extrude(height = 4) {
            polygon(points = [[0, 1], [4, 0], [3.5, 2], [3, 4]]);
        }
        
        translate([spool_mount_x-16.1, spool_mount_y-13, spool_mount_z+2.2]) 
        rotate([90, 78, 0]) 
        linear_extrude(height = 4) {
            polygon(points = [[0, 1], [4, 0], [3.5, 2], [3, 4]]);
        }
        */
    }
    /*
    translate([spool_mount_x+11.8, spool_mount_y-12.9, spool_mount_z+.2]) 
    rotate([90, 0, 0]) 
    cylinder(h = 5, r = 2.5);
    
    translate([spool_mount_x-11.8, spool_mount_y-12.9, spool_mount_z+.2]) 
    rotate([90, 0, 0]) 
    cylinder(h = 5, r = 2.5);
    */
translate([ 0, -1.5, 11.5 ]) 
    rotate([90, 0, 0]) 
    cylinder(h = 5, r = 2.5, center = true );

mirror([ 0, 0, 1 ])
translate([ 0, -1.5, 11.5 ]) 
    rotate([90, 0, 0]) 
    cylinder(h = 5, r = 2.5, center = true );
    
    
        }
    }
}

//used modules
module mitercyl(rad,hei,mtop, mbot)
{
  cylinder(r1=rad-mbot, r2 = rad, h=abs(mbot));
  translate([0,0,abs(mbot)])
    cylinder(r=rad, h=hei-abs(mtop)-abs(mbot));
  translate([0,0,hei-abs(mtop)])
    cylinder(r1=rad, r2=rad-mtop, h=abs(mtop));
}
module mount_top()
{
    difference() {
        union()
        {
            //rail clamps
            //translate([ clamp_x+90, clamp_y+20, -30 ])
                //cube([ clamp_width, clamp_depth, clamp_height ], center = true);
                cylinder( h = clamp_height, r = rad0-6 );
            //translate([ -clamp_x-clamp_width/2, clamp_y+15, clamp_height+5 ])
          translate([ -clamp_x-clamp_width/2, clamp_y+clamp_depth/2, clamp_height+5 ])
            twist_lock();
        
        }
        
      /*  //for testing only
        translate([ -80, 0, 10 ])
        cube([ 100, 200, 40 ], center = true );
        
        mirror([ 1, 0, 0 ])
        translate([ -80, 0, 10 ])
        cube([ 100, 200, 40 ], center = true );
        
        //mirror([ 1, 0, 0 ])
        translate([ 0, 80, 10 ])
        cube([ 200, 100, 40 ], center = true );
        
        mirror([ 1, 0, 0 ])
        translate([ 0, -80, 10 ])
        cube([ 200, 100, 40 ], center = true );
        
        //end test
        */
        //rail hole
        translate([ 0, clamp_y, -clamp_height+clamp_height ])
        rotate([ 270, 0, 0 ])
            cylinder( h = 400, r = 44.45/2, center = true );
        
        //bolt holes
        translate([ -clamp_width/2+14, 0, -clamp_height+clamp_height+10 ])
        cylinder( h = bolt_length, r = bolt_size/2, center = true );
        translate([ clamp_width/2-14, 0, -clamp_height+clamp_height+10 ])
        cylinder( h = bolt_length, r = bolt_size/2, center = true );
        
        //sunken heads
        translate([ -clamp_width/2+14, 0, clamp_height-2 ])
        cylinder( h = head_length, r = head_dia/2, center = true );
        translate([ clamp_width/2-14, 0, clamp_height-2 ])
        cylinder( h = head_length, r = head_dia/2, center = true );
        
        //nuts
        /*
        translate([ -clamp_width/2+14, 0, clamp_z+clamp_height-6 ])
        cylinder( h = 10, r = 11.1, $fn = 6, center = true );
        translate([ clamp_width/2-14, 0, clamp_z+clamp_height-6 ])
        cylinder( h = 10, r = 11.1, $fn =6, center = true );
    */
        }
        
}

module mount(type) {
      difference() {
        union() {
    //      cube([ clamp_width, clamp_depth, clamp_height ], center = true);
          cube([ clamp_width, clamp_depth, clamp_height ], center = true);
        }
        
        //rail hole
        translate([ 0, clamp_y, clamp_z ])
        rotate([ 270, 0, 0 ])
            cylinder( h = 480, r = 44.45/2, center = true );
        
        //bolt holes
        translate([ -clamp_width/2+clamp_space, 0, 0 ])
        cylinder( h = clamp_height, r = bolt_size/2, center = true );
        
        mirror([ 1, 0, 0 ])
        translate([ -clamp_width/2+clamp_space, 0, 0 ])
        cylinder( h = clamp_height, r = bolt_size/2, center = true );
        
        if(type == "bottom" ){
        //nuts
        
        translate([ -clamp_width/2+clamp_space, 0, clamp_height/2-nut_height ])
        cylinder( h = nut_height, r = nut_size/2, center = true, $fn=6 );
          
        mirror([ 1, 0, 0 ])
          translate([ -clamp_width/2+clamp_space, 0, clamp_height/2-nut_height ])
        cylinder( h = nut_height, r = nut_size/2, center = true, $fn=6 );
          
    }
  }
}

module mount_bottom() {
    difference() {
        union()
        {
            //rail clamps
            translate([ clamp_x+90, clamp_y+20, clamp_z-clamp_height-clamp_space ])
                //cube([ clamp_width, clamp_depth, clamp_height ], center = false);
            cylinder( h = clamp_height, r = rad0-6 );
        }
        
     /*    //for testing only
        translate([ -80, 0, -60 ])
        cube([ 100, 200, 40 ], center = true );
        
        mirror([ 1, 0, 0 ])
        translate([ -80, 0, -60 ])
        cube([ 100, 200, 40 ], center = true );
        
        //mirror([ 1, 0, 0 ])
        translate([ 0, 80, -60 ])
        cube([ 200, 100, 40 ], center = true );
        
        mirror([ 1, 0, 0 ])
        translate([ 0, -80, -60 ])
        cube([ 200, 100, 40 ], center = true );
        
        //end test
       */ 
        //rail hole
        translate([ 0, clamp_y, clamp_z-clamp_space/2 ])
        rotate([ 270, 0, 0 ])
            cylinder( h = 480, r = 44.45/2, center = true );
        
        //bolt holes
        translate([ -clamp_width/2+14, 0, clamp_z-10 ])
        cylinder( h = bolt_length, r = bolt_size/2, center = true );
        translate([ clamp_width/2-14, 0, clamp_z-10 ])
        cylinder( h = bolt_length, r = bolt_size/2, center = true );
        
        //nuts
        
        translate([ -clamp_width/2+14, 0, clamp_z-25 ])
        cylinder( h = nut_height, r = nut_size/2, center = true, $fn=6 );
        translate([ clamp_width/2-14, 0, clamp_z-25 ])
        cylinder( h = nut_height, r = nut_size/2, center = true, $fn=6 );
        
        
        //bolt head inset
        /*
        translate([ -clamp_width/2+14, 0, clamp_z-clamp_height-clamp_space-2 ])
        cylinder( h = head_height, r = head_rad, center = false );
        translate([ clamp_width/2-14, 0, clamp_z-clamp_height-clamp_space-2 ])
        cylinder( h = head_height, r = head_rad, center = false );
        */
    }
}

module twist_lock() 
{
  difference() {
    union() {
        cylinder(h = 10, d = 29.5, center = true);
      translate([ 0, 0, -7 ])
        cube([ clamp_width, clamp_depth, tw_base ], center = true );
    }

//bolt holes
        translate([ -clamp_width/2+clamp_space, 0, 0 ])
        cylinder( h = clamp_height, r = bolt_size/2, center = true );
        
        mirror([ 1, 0, 0 ])
        translate([ -clamp_width/2+clamp_space, 0, 0 ])
        cylinder( h = clamp_height, r = bolt_size/2, center = true );
    
//sunken heads
        translate([ -clamp_width/2+clamp_space, 0, -head_length ])
        cylinder( h = head_length, r = head_dia/2, center = true );
        
          mirror([ 1, 0, 0 ])
        translate([ -clamp_width/2+clamp_space, 0, -head_length ])
        cylinder( h = head_length, r = head_dia/2, center = true );
        
// guides
    rotate( [0, 0, 0])
        rotate_extrude( angle = arch_angle, $fn = 100 )
        translate( [-arch_radius, 1] )
        difference()
        translate( [0, -arch_base / 2] )
            square( arch_base );
    
    rotate( [180, 180, 0])
        rotate_extrude( angle = arch_angle, $fn = 100 )
        translate( [-arch_radius, 1] )
        difference()
        translate( [0, -arch_base / 2] )
            square( arch_base );

    //Add entrance notches
    mirror([ 10, 60, 0 ])
    rotate( [180, 180, 0])
        rotate_extrude( angle = 20, $fn = 100 )
        translate( [-arch_radius, 1] )
        difference()
        translate( [0, -arch_base / 2.2] )
        square( [4, 7] );
    mirror([ 10, 60, 0 ])
    rotate( [180, 180, 0])
        rotate_extrude( angle = 20, $fn = 100 )
        translate( [-arch_radius, 1] )
        difference()
        translate( [0 + 26.1, -arch_base / 2.2] )
            square( [4, 7] );
}    

//Add a bump
    union()
        mirror([ 200, -30, 0 ])
        translate ([9, -6, 1]) 
            cylinder(4, r = 1.8, center =true);
        mirror([ 200, -25, 0 ])        
        translate ([-9, 6, 1]) 
            cylinder(4, r = 1.8, center =true);
}

//Twist bar
module twist_bar() {
    translate([ 0, 0, -7 ])
cube([ 40, 30, 2 ], center = true);
}

//}
//the_bath();
//base_lock();
//translate([ 0, 5, -45 ])
//rotate([ 0, 0, 180 ])
//mount("top");
//mount("bottom");
twist_lock();
//twist_bar();