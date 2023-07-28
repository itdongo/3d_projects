$fn=96;

//use <cube/cube.scad>
max_height = 159;
max_depth = 380;
dovetail_rad = 9.7;
width = 220;
depth = 132.5;
center_depth = max_depth/3+6.85;
side_depth = max_depth/3+6.85/2;
height = 5;

leg_width = 30;
leg_depth = 5;
filet = 20;

module center() {
    difference() {
        union() {
            cube ([ width, center_depth, height ]);
                    
          //legs
            translate ([ 0, 0, height ])
                cube ([ leg_width, leg_depth, max_height-height ]);
            
          translate ([ 0, center_depth-leg_depth, height ])
                cube ([ leg_width, leg_depth, max_height-height ]);
              
          translate ([ width-leg_width, 0, height ])
                cube ([ leg_width, leg_depth, max_height-height ]);
            
            translate ([ width-leg_width, center_depth-leg_depth, height ])
                cube ([ leg_width, leg_depth, max_height-height ]);
            
            //dovetail support
            translate ([ leg_width/2, 0, leg_depth ])
                cube ([ width-leg_width, leg_depth*2, 1 ]);
            translate ([ leg_width/2, center_depth-leg_depth*2, leg_depth ])
                cube ([ width-leg_width, leg_depth*2, 1 ]);
            
            //fillets
          
            translate ([ 1, leg_depth, height ])
                cube ([ leg_width-2, 20, 20 ]);
            translate ([ width-leg_width+1, leg_depth, height ])
                cube ([ leg_width-2, 20, 20 ]);
            translate ([ width-leg_width+1, center_depth-filet-leg_depth, height ])
                cube ([ leg_width-2, 20, 20 ]);
            translate ([ 1, center_depth-filet-leg_depth, height ])
                cube ([ leg_width-2, 20, 20 ]);
            
        }
        //filet smooth
            translate ([ 0, filet+leg_depth, height+filet ])
            rotate([ 0, 90, 0 ])
                cylinder ( h = leg_width, r = 20 );
            translate ([ width-leg_width, filet+leg_depth, height+filet ])
            rotate([ 0, 90, 0 ])
                cylinder ( h = leg_width, r = 20 );
            translate ([ width-leg_width, center_depth-filet-leg_depth, height+filet ])
            rotate([ 0, 90, 0 ])
                cylinder ( h = leg_width, r = 20 );
            translate ([ 0, center_depth-filet-leg_depth, height+filet ])
            rotate([ 0, 90, 0 ])
                cylinder ( h = leg_width, r = 20 );
          //}
        
        //Add the dovetails
        for(i = [ 12.2 : width/9 : 224])
        {
          
          translate ([ i, 2, 0 ])
          color( "blue" )
          rotate ([ 180, 180, 90 ])
            cylinder( h = height, r = dovetail_rad, $fn = 3 );
        }
 
        for(i = [ 12.2 : width/9 : 224 ])
        {
          translate ([ i, center_depth-2, 0 ])
          color( "blue" )
          rotate ([ 0, 0, 90 ])
            cylinder( h = height, r = dovetail_rad, $fn = 3 );
        }     
    }
}

module side() {
    difference() {
        union() {
            //translate([ 0, depth, 0 ])
    
                cube ([ width, side_depth, height ]);
            //legs
            
            translate ([ width-leg_width, side_depth-leg_depth, height ])
                cube ([ leg_width, leg_depth, max_height-height ]);
            translate ([ 0, side_depth-leg_depth, height ])
                cube ([ leg_width, leg_depth, max_height-height ]);
            
            //dovetail support
            //translate ([ leg_width, 0, leg_depth ])
              //  cube ([ width-leg_width*2, leg_depth*1.5, leg_depth ]);
            
            //fillets
          
            //translate ([ 0, leg_depth, height ])
              //  cube ([ leg_width, 20, 20 ]);
            //translate ([ width-leg_width, leg_depth, height ])
              //  cube ([ leg_width, 20, 20 ]);
            translate ([ width-leg_width+1, side_depth-filet-leg_depth, height ])
                cube ([ leg_width-2, 20, 20 ]);
            translate ([ 1, side_depth-filet-leg_depth, height ])
                cube ([ leg_width-2, 20, 20 ]);
            
        }
        //filet smooth
            //translate ([ 0, filet+leg_depth, height+filet ])
            //rotate([ 0, 90, 0 ])
              //  cylinder ( h = leg_width, r = 20 );
            //translate ([ width-leg_width, filet+leg_depth, height+filet ])
            //rotate([ 0, 90, 0 ])
              //  cylinder ( h = leg_width, r = 20 );
            translate ([ width-leg_width, side_depth-filet-leg_depth, height+filet ])
            rotate([ 0, 90, 0 ])
                cylinder ( h = leg_width, r = 20 );
            translate ([ 0, side_depth-filet-leg_depth, height+filet ])
            rotate([ 0, 90, 0 ])
                cylinder ( h = leg_width, r = 20 );
        //Add the dovetails
        for(i = [ 0 : width/9 : 224])
        {
          
          translate ([ i, 2, 0 ])
          color( "blue" )
          rotate ([ 180, 180, 90 ])
            cylinder( h = height, r = dovetail_rad, $fn = 3 );
        }
        
        
      
        
        }
        
    }


//center();
//*
translate([ 0, depth-dovetail_rad/2-.5, 0 ])
side();
// */
/*
translate ([ 0, +dovetail_rad/2+1.5, 0 ])
mirror([0,1,0 ])
    side();
// */