$fn=96;

dovetail_rad = 9.7;
width = 220;
depth = 129;
height = 5;
max_height = 160;
max_depth = 381;

leg_width = 30;
leg_depth = 5;
filet = 20;

module center() {
    difference() {
        union() {
            cube ([ width, depth+6.85, height ]);
        }
        
        //Add the dovetails
        for(i = [ 0 : width/9 : 224])
        {
          
          translate ([ i, 2, 0 ])
          color( "blue" )
          rotate ([ 180, 180, 90 ])
            cylinder( h = height, r = dovetail_rad, $fn = 3 );
        }
 
        for(i = [ 0 : width/9 : 224 ])
        {
          translate ([ i, depth+6.85-2, 0 ])
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
    
                cube ([ width, depth, height ]);
            //legs
            translate ([ 0, 0, height ])
                cube ([ leg_width, leg_depth, max_height-height ]);
            translate ([ width-leg_width, 0, height ])
                cube ([ leg_width, leg_depth, max_height-height ]);
            translate ([ width-leg_width, depth-leg_depth, height ])
                cube ([ leg_width, leg_depth, max_height-height ]);
            translate ([ 0, depth-leg_depth, height ])
                cube ([ leg_width, leg_depth, max_height-height ]);
            
            //dovetail support
            translate ([ leg_width, 0, leg_depth ])
                cube ([ width-leg_width*2, leg_depth*1.5, leg_depth ]);
            
            //fillets
          
            translate ([ 0, leg_depth, height ])
                cube ([ leg_width, 20, 20 ]);
            translate ([ width-leg_width, leg_depth, height ])
                cube ([ leg_width, 20, 20 ]);
            translate ([ width-leg_width, depth-filet-leg_depth, height ])
                cube ([ leg_width, 20, 20 ]);
            translate ([ 0, depth-filet-leg_depth, height ])
                cube ([ leg_width, 20, 20 ]);
            
        }
        //filet smooth
            translate ([ 0, filet+leg_depth, height+filet ])
            rotate([ 0, 90, 0 ])
                cylinder ( h = leg_width, r = 20 );
            translate ([ width-leg_width, filet+leg_depth, height+filet ])
            rotate([ 0, 90, 0 ])
                cylinder ( h = leg_width, r = 20 );
            translate ([ width-leg_width, depth-filet-leg_depth, height+filet ])
            rotate([ 0, 90, 0 ])
                cylinder ( h = leg_width, r = 20 );
            translate ([ 0, depth-filet-leg_depth, height+filet ])
            rotate([ 0, 90, 0 ])
                cylinder ( h = leg_width, r = 20 );
        
        
      
        
        }
        
    }


//center();
// /*
translate([ 0, depth-dovetail_rad/2-1.5, 0 ])
side();
// */
 /*
translate ([ 0, +dovetail_rad/2+1.5, 0 ])
mirror([0,1,0 ])
    side();
// */