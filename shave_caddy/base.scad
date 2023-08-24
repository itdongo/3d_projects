width = 220;
depth = 220;
height = 5;

// razor stand
rz_stand_width = 5;
rz_stand_depth = 5;
rz_stand_height = 100;
rz_cross_bar_width = 30;
rz_cross_bar_depth = 5;
rz_cross_bar_height = 5;
rz_arm_width = 5;
rz_arm_depth = 30;
rz_arm_height = 5;
rz_arm_notch_width = 5;
rz_arm_notch_depth = 20;
rz_arm_notch_height = rz_arm_height/2;

brush_stand_base_width = 40;
brush_stand_base_depth = 5;
brush_stand_base_height = 100;
brush_stand_width = 40;
brush_stand_depth = 33*1.5;
brush_stand_height = 5;

module base()
{
  difference()
  {
    union() 
    {
      cube([ width, depth, height ], center = true );
    }
  }
}

module razor_stand()
{
  difference()
  {
    union ()
    {
      cube([ rz_stand_width, rz_stand_depth, rz_stand_height ], center= true );
      translate([ 0, 0, rz_stand_height/2 ])
        cube([ rz_cross_bar_width, rz_cross_bar_depth, rz_cross_bar_height ], center= true );
      translate([ rz_cross_bar_width/2, rz_arm_depth/2-rz_cross_bar_depth/2, rz_stand_height/2 ])
      {
        cube([ rz_arm_width, rz_arm_depth, rz_arm_height ], center= true );
        translate([ -rz_cross_bar_width, 0, 0 ])
          cube([ rz_arm_width, rz_arm_depth, rz_arm_height ], center= true );
      }
    }  
    translate([ rz_cross_bar_width/2-rz_arm_notch_width/2, rz_cross_bar_height, rz_stand_height/2 ])
      cube([ rz_arm_notch_width, rz_arm_notch_depth, rz_arm_notch_height ]);

mirror([ 1, 0, 0 ])
    translate([ rz_cross_bar_width/2-rz_arm_notch_width/2, rz_cross_bar_height, rz_stand_height/2 ])
      cube([ rz_arm_notch_width, rz_arm_notch_depth, rz_arm_notch_height ]);
  
  }
}
      
 module brush_stand()
{
  difference()
  {
    union()
    {
      cube([ brush_stand_base_width, brush_stand_base_depth, brush_stand_base_height ], center=true );
      translate([ 0, brush_stand_depth/2-height/2, brush_stand_base_height/2 ])
      cube([ brush_stand_width, brush_stand_depth, brush_stand_height ], center=true );
      }

      translate([ 0, brush_stand_depth/2-height/2, brush_stand_base_height/2 ])      
      cube([ brush_stand_width-brush_stand_height/2, brush_stand_depth*.75, brush_stand_height ]);
  }
}
//base();
//razor_stand();
brush_stand();