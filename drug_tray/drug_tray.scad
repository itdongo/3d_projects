$fn=96;

width = 220;
depth = 165;
height = 6;
border = 2;

dw = 188;
dd = 95;
dh = 25;
dx = 14;
dy = 11;
dz = 10;

t16rad = 18;
t40rad = 26;
tcylheight = 50;
t16caprad = 20.5;
t40caprad = 28;
space = 5;

px = t16rad;
py = 0;
ph = 45;

module base() 
{
  difference() 
  {
    union() 
    {
  
      cube([ width, depth, height ], center = true );
      
      //small cap holder
      translate([ width/2-t16caprad-space, space, ph/2 ]) { 
        cylinder(h = ph, r = t16caprad, center = true );
      translate([ 0, 0, -15 ])
        cylinder( h = 5, r1 = t16caprad+2, r2 = t16caprad, center=true );
      }
      
      //large cap holder

      translate([ width/2-t40caprad-space, -t40caprad*2+space, ph*.5 ]){
        cylinder(h = ph, r = t40caprad, center = true );
      translate([ 0, 0, -15 ])
        cylinder(h = 5, r1 = t40caprad+2, r2 = t40caprad, center = true );
      }
    }
  
    //small cap holder
      translate([ width/2-t16caprad-space, space, ph/2+height/2  ]) {
        cube([ 25, 43, ph ], center = true );
        cylinder(h = ph, r = t16caprad-1, center = true );
      }
    
      //large cap holder
      translate([ width/2-t40caprad-space, -t40caprad*2+space, ph*.5+height*.5 ])
      {
        cylinder(h = ph, r = t40caprad-1, center = true );
        cube([ 30, 60, ph ], center = true );
      }
 
      
      
            translate([ -width+width*.6, depth*.35, .5 ]) 
      {
        for(sb = [ 0 : width/5 : width-t16rad ]) 
          {
          translate([ sb, 0, 0 ])
          cylinder(h = height, r = t16rad, center = true );
        }
        for(sb = [ 0 : width/5 : width-t16rad*4 ]) 
          {
          translate([ sb, -depth*.3, 0 ])
          cylinder(h = height, r = t16rad, center = true );
          }
        }
        
      translate([ -width*.3, -depth*.3, .5 ]) 
      {
        for(lb = [ 0 : width/3 : width-t40rad*3 ]) 
          {
          translate([ lb, 0, 0 ])
          cylinder(h = height, r = t40rad, center = true );
        }
        
      }
    }
  }
        


module t16testcube() {
  difference(){
    union() {
      cube([ 65, 65, 1 ], center = true );
//    cylinder( h = 5, r = t16rad+1 );
    
    }
    translate([ 0, 0, 0 ]) {
    cylinder( h = 9 , r = t40caprad, center = true );
      
    cube ([ 60, 10, 9 ], center = true );
    }
    }
  }
    
  
module t16insert()

{
  difference()
  {
    union()
    {
      cylinder( h = tcylheight, r = t16rad );
    }
    translate([ 0, 0, 0 ])
    cylinder( h = tcylheight, r = t16rad-1 );
  }
}

module t40insert()
{
  difference()
  {
    union()
    {
      cylinder( h = tcylheight, r = t40rad );
    }
    translate([ 0,0,0 ])
    cylinder( h = tcylheight, r = t40rad-1 );
  }
}

 //   }


base();
//t16insert();
//t40insert();
//t16testcube();