$fn=96;

width = 220;
depth = 165;
height = 10;

dw = 188;
dd = 95;
dh = 25;
dx = 14;
dy = 11;
dz = 10;

t16rad = 18;
t40rad = 26;
tcylheight = 50;
t16caprad = 19.5;
t40caprad = 27.5;

px = t16rad;
py = 0;
ph = 41;

module base() 
{
  difference() 
  {
    union() 
    {
      cube([ width, depth, height ] );
      translate([ width*.9, 75, height ]) 
        cylinder(h = ph, r = t16caprad );
        
            translate([ width*.8, t40rad*5, height ]) 
        cylinder(h = ph, r = t40caprad );
      
      
    } //end union
      translate([ width*.845, 55, height ]) 
        cube([ 25, 40, ph ]);
        translate([ width*.9, 75, height ])
        cylinder(h = ph, r = t16caprad-1 );
      
            translate([ width*.74, t40rad*3.9, height ]) 
        cube([ 30, 60, ph ]);
      translate([ width*.8, t40rad*5, height ]) 
        cylinder(h = ph, r = t40caprad-1 );
            
            translate([ width*.10, width*.15, height-9 ]) 
      {
        for(sb = [ 0 : width/5 : width-t16rad ]) 
          {
          translate([ sb, 0, 0 ])
          cylinder(h = height, r = t16rad );
        }
      }

    
      translate([ width*.1, width*.35, height-9 ]) 
    {
        for(sb = [ 0 : width/5 : width-t16rad*4 ]) 
          {
          translate([ sb, 0, 0 ])
          cylinder(h = height, r = t16rad );
        }
      }

      translate([ width/6, t40rad*5, height-9 ]) 
      {
        for(lb = [ 0 : width/3 : width-t40rad*3 ]) 
          {
          translate([ lb, 0, 0 ])
          cylinder(h = height, r = t40rad );
        }
      }
 /*
      translate([ width*.9, 33, height/2 ]) 
        cylinder(h = height/2, r = t16caprad );
        
            translate([ width*.8, t40rad*5, height/2 ]) 
        cylinder(h = height/2, r = t40caprad );
      */
    }
        
// new union
/*        translate([ width*.10, width*.15, height/2 ]) 
      {
        for(sb = [ 0 : width/5 : width-t16rad*3 ]) 
          {
          translate([ sb, 0, 0 ])
          cylinder(h = height/2, r = t16rad-1 );
        }
      }
      
      translate([ width*.1, width*.35, height/2 ]) 
      {
        for(sb = [ 0 : width/5 : width-t16rad ]) 
          {
          translate([ sb, 0, 0 ])
          cylinder(h = height/2, r = t16rad-1 );
        }
      }

      translate([ width/6, t40rad*5, height/2 ]) 
      {
        for(lb = [ 0 : width/3 : width-t40rad*3 ]) 
          {
          translate([ lb, 0, 0 ])
          cylinder(h = height/2, r = t40rad-1 );
        }
      }
      translate([ width*.9, 33, height/2 ]) 
        cylinder(h = height/2, r = t16caprad-1 );
      
      translate([ width*.8, t40rad*5, height/2 ]) 
        cylinder(h = height/2, r = t40caprad-1 );
              
  */    
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
      cylinder( h = 10, r = t40rad );
    }
    translate([ 0,0,0 ])
    cylinder( h = 10, r = t40rad-1 );
  }
}

 //   }


base();
//t16insert();
//t40insert();
//t16testcube();