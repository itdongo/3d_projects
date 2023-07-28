$fn = 192;
module extension() {
difference() {
  union() {
    cube([ 194, 12, 12 ], center = false );
    
    translate([ 194, 6, 0 ])
    cylinder( h = 60, r = 8, center = false );
    
    }
  translate([ 0, 2.35, 2.35 ])
  cube([ 200, 7.3, 7.3 ], center = false );
    
  }
difference() {
  union() {
    translate([ 170, 0, 12 ])
    cube([ 21, 12, 12 ]);
  }
  translate([ 168, 12, 36 ])
    rotate([ 90, 0, 0 ])
    cylinder( h = 12, r = 24 );
}
}

module test() {
  difference() {
  union() {
    cube([ 30, 12, 12 ], center = false );
    
    }
  translate([ 0, 2.35, 2.35 ])
  cube([ 200, 7.3, 7.3 ], center = false );
    
  }
}
  extension();
  //test();