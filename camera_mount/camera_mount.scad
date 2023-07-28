$fn=96;

width = 145;
depth = 30;
height = 18;

mwidth = 7;
mdepth = 7;
mheight = height;
mrad = height/2;

hrad = 3;
mhrad = 1.9;

difference() {
  union() {
    cube([ width, depth, height ]);
    mirror([ 0, 0, 1 ])
    translate([ 0, -depth/2, 0 ])
    rotate([ 0, 90, 0 ])
    cube([ 56, depth*2, 1 ]);
    translate([ width, 0, 0 ])
      cube([ mwidth, mdepth, mheight ]);
    translate([ width+mwidth, mdepth, mheight/2 ])
    rotate([ 90, 0, 0 ])
      cylinder( h = mwidth, r = mrad );
    translate([ width, depth-mdepth, 0 ])
      cube([ mwidth, mdepth, mheight ]);
    translate([ width+mwidth, depth, mheight/2 ])
    rotate([ 90, 0, 0 ])
      cylinder( h = mwidth, r = mrad );
  }
  translate([ width+mwidth, depth, height/2 ])
    rotate([ 90, 0, 0])
    cylinder( h = depth, r = mhrad );
  translate([ width+mwidth, depth, height/2 ])
    rotate([ 90, 0, 0 ])
    cylinder( h = 2, r = 2.8 );
  translate([ width+mwidth, 1.5, height/2 ])
    rotate([ 90, 0, 0 ])
    cylinder( h = 2, r = 3.15, $fn=6 );
  translate([ 8, 7, 0 ])
  cube([ width-12, 16, 26 ]);
  /*
  translate([ 8.1, 44, 10 ])
  rotate([ 90, 0, 0 ])
  cylinder( h = depth*2+1, r = 8.1 );
  
*/
}