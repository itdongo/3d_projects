$fn = 96;

include <nutsnbolts/cyl_head_bolt.scad>;
include <nutsnbolts/materials.scad>;

testvar=7;
clip_angle  = 20;
clip_radius = 154;
clip_size = 1;

phone_width=135;
phone_depth=68;
phone_height=3;
phone_edge_curve=11;
phone_edge_width=6;
phone_corner=phone_edge_curve-3;
camera_notch_width=39;
camera_notch_depth=39;
case_height=11.3;

distance_to_lens=24.8;

binoc_base_width=8;
binoc_base_height=2;
binoc_eyepiece_dia=34;
binoc_eyepiece_radius_inside=17.5;
binoc_width=71;
binoc_eyepiece_height=20.5-phone_height/2;

screw_width_max=2.85;
screw_width_min=1.6;
screw_head_height=1.67;
screw_height=phone_height;

orientaion="top";

// New vars


module base()
{
  difference()
  {
    union()
    {
      //the phone base          
      cube([ phone_width, phone_depth, phone_height ], center = true);

    //Round the corners
      translate([ -phone_width/2+phone_corner, -phone_depth/2+phone_corner, -case_height/2 ])
      {
        rotate([ 0, 0, 180 ])
        rotate_extrude( angle = 90, $fn = 96 )
        translate([ phone_edge_curve, 0 ]) //curve and z height      
          square([ phone_edge_width, phone_height+case_height], center = true );
      }

      mirror([1,0,0])
      { 
        translate([ -phone_width/2+phone_corner, -phone_depth/2+phone_corner, -case_height/2 ])
        {
          rotate([ 0, 0, 180 ])
          rotate_extrude( angle = 90, $fn = 96 )
          translate([ phone_edge_curve, 0 ]) //curve and z height      
            square([ phone_edge_width, phone_height+case_height], center = true );
        }
      }
      mirror([0,1,0])
      { 
        translate([ -phone_width/2+phone_corner, -phone_depth/2+phone_corner, -case_height/2 ])
        {
          rotate([ 0, 0, 180 ])
          rotate_extrude( angle = 90, $fn = 96 )
          translate([ phone_edge_curve, -phone_height/2 ]) //curve and z height      
            square([ phone_edge_width, phone_height*2+case_height], center = true );

          translate([ phone_height, phone_height, 0 ])
          rotate([ 0, 0, 195 ])
          rotate_extrude( angle = 60, $fn = 96 )
          translate([ phone_edge_curve, -case_height+2.65 ]) //curve and z height      
            square([ phone_edge_width*2, phone_height], center = true );
        }
      }

      mirror([1,1,0])
      { 
        translate([ -phone_depth/2+phone_corner, -phone_width/2+phone_corner, -case_height/2 ])
        {
          rotate([ 0, 0, 180 ])
          rotate_extrude( angle = 90, $fn = 96 )
          translate([ phone_edge_curve, -phone_height/2 ]) //curve and z height      
            square([ phone_edge_width, phone_height*2+case_height], center = true );
          
          color("red")
          translate([ phone_height, phone_height, 0 ])
          rotate([ 0, 0, 195 ])
          rotate_extrude( angle = 60, $fn = 96 )
          translate([ phone_edge_curve, -case_height+2.65 ]) //curve and z height      
            square([ phone_edge_width*2, phone_height], center = true );
        }
      }
    }
    
    //camera notch
    translate([ -phone_width/2+camera_notch_width/2, -phone_depth/2+camera_notch_depth/2, -phone_height/2 ])
      cube([ camera_notch_width, camera_notch_depth, 1 ], center = true );
   
    //remove the core
    translate([ -phone_width/2+distance_to_lens+screw_width_min, -phone_depth/2+distance_to_lens+screw_width_min, -phone_height/2 ])
    cylinder( h = phone_height*2, r = binoc_eyepiece_radius_inside-5, center = true );

    //Screw holes
    if (orientaion=="top") {
      translate([ -phone_width/2+screw_width_min, distance_to_lens/2+binoc_base_width/2+screw_width_min/2, 0 ]) 
      {
        rotate([ 180, 0, 0, ])
        {
          translate([ distance_to_lens, binoc_base_width/2-.2, .67 ])
          {
            rotate([ 180, 0, 0, ])
            {
              cylinder( h = screw_head_height, r1 = screw_width_max, r2 = screw_width_min, center = true );
              cylinder( h = screw_height*4, r = screw_width_min, center = true );
              translate([binoc_width, 0, 0]) {
                cylinder( h = screw_head_height, r1 = screw_width_max, r2 = screw_width_min, center = true );
                cylinder( h = screw_height*2, r = screw_width_min, center = true );
              }
            }
          }
          translate([ binoc_base_width/2+.3, distance_to_lens-4, 1.1 ])
          {
            rotate([ 180, 0, 0, ])
            {
              #cylinder( h = screw_head_height, r1 = screw_width_max, r2 = screw_width_min );
              cylinder( h = screw_height*2, r = screw_width_min );
              translate([binoc_width, 0, -.6]) {
                cylinder( h = screw_head_height, r1 = screw_width_max, r2 = screw_width_min );
                cylinder( h = screw_height*2, r = screw_width_min );
              }
            }
          }
          translate([ camera_notch_width+phone_edge_width+.3, distance_to_lens-4, 1.51 ])
          {
            rotate([ 180, 0, 0, ])
            {
              cylinder( h = screw_head_height, r1 = screw_width_max, r2 = screw_width_min );
              cylinder( h = screw_height*2, r = screw_width_min );
              translate([binoc_width, 0, 0 ]) {
                #cylinder( h = screw_head_height, r1 = screw_width_max, r2 = screw_width_min );
                cylinder( h = screw_height*2, r = screw_width_min );
              }
            }
          }
        }
      }

    }
    else {
      translate([ -phone_width/2+screw_width_min, -distance_to_lens/2-binoc_base_width/2+screw_width_min, 0 ]) 
      {
        rotate([ 180, 0, 0, ])
        {
          translate([ distance_to_lens, binoc_base_width+1.6, .7 ])
          {
            rotate([ 180, 0, 0, ])
            {
              #cylinder( h = screw_head_height, r1 = screw_width_max, r2 = screw_width_min, center = true );
              #cylinder( h = screw_height*2, r = screw_width_min, center = true );
              translate([binoc_width, 0, 0]) {
                #cylinder( h = screw_head_height, r1 = screw_width_max, r2 = screw_width_min, center = true );
                #cylinder( h = screw_height*2, r = screw_width_min, center = true );
              }
            }
          }
        }
      }
    }
  }
    //Round the corners
      translate([ -phone_width/2+phone_corner, -phone_depth/2+phone_corner, -case_height/2 ])
      {
        rotate([ 0, 0, 180 ])
        #rotate_extrude( angle = 90, $fn = 96 )
        translate([ phone_edge_curve, 0 ]) //curve and z height      
          square([ phone_edge_width, phone_height+case_height], center = true );
      }
}

module eye_piece()
{
  difference()
  {
    union()
    {
      //Eye piece reference
      //Create the eye piece   
      rotate_extrude( angle = 360, $fn = 96 )
      translate( [binoc_eyepiece_radius_inside, binoc_base_width ] )       
      translate( [0, -binoc_base_width] )
        square([ binoc_base_width, binoc_eyepiece_height ] );
    
      //Add the eye piece clip
      translate([ 0, 0, binoc_eyepiece_height ])
      rotate_extrude( angle = 380, $fn = 96 )
      translate( [binoc_eyepiece_radius_inside, -clip_size] )
      rotate([ 0, 0, 90 ])
        circle( r = clip_size, $fn = 3);
      
    }
    //bolt holes
  translate([ 0, binoc_eyepiece_radius_inside+binoc_base_width/2, 1 ])
    {
	   rotate([180,0,90])
      { 
        nutcatch_parallel("M3", clh=0.1);
        translate([ 0, 0, 5 ])
        #hole_through(name="M3", l=binoc_eyepiece_height/2, cld=0.1, h=0, hcld=0.4);
      }
    }
  translate([ binoc_eyepiece_radius_inside+binoc_base_width/2-.5, binoc_base_width/2, 1 ])
    {
	   rotate([180,0,90])
      { 
        nutcatch_parallel("M3", clh=0.1);
        translate([ 0, 0, 5 ])
        #hole_through(name="M3", l=binoc_eyepiece_height/2, cld=0.1, h=0, hcld=0.4);
      }
    }
  translate([ -binoc_eyepiece_radius_inside-binoc_base_width/2+.5, binoc_base_width/2, 1 ])
    {
	   rotate([180,0,90])
      { 
        #nutcatch_parallel("M3", clh=0.1);
        translate([ 0, 0, 5 ])
        #hole_through(name="M3", l=binoc_eyepiece_height/2, cld=0.1, h=0, hcld=0.4);
      //#nutcatch_sidecut("M3", l=100, clk=0.1, clh=0.1, clsl=0.1);
      }
    }
  }
}

module new_adapter()
{
  difference()
  {
    union()
    {
      //the phone base          
      cube([ phone_width, phone_depth, phone_height ], center = true);
    }
    translate([distance_to_lens, -distance_to_lens, 0 ])
    cylinder(phone_height, d=binoc_eyepiece_dia);
  }
} 

module new_eye_piece()
{
  difference()
  {
    union()
    {
      //Eye piece reference
      //Create the eye piece   
      rotate_extrude( angle = 360, $fn = 96 )
      translate( [binoc_eyepiece_radius_inside, binoc_base_width ] )       
      translate( [0, -binoc_base_width] )
        square([ binoc_base_width, binoc_eyepiece_height ] );
    
      //Add the eye piece clip
      translate([ 0, 0, binoc_eyepiece_height ])
      rotate_extrude( angle = 380, $fn = 96 )
      translate( [binoc_eyepiece_radius_inside, -clip_size] )
      rotate([ 0, 0, 90 ])
        circle( r = clip_size, $fn = 3);
      
    }
    //bolt holes
  translate([ 0, binoc_eyepiece_radius_inside+binoc_base_width/2, 1 ])
    {
	   rotate([180,0,90])
      { 
        nutcatch_parallel("M3", clh=0.1);
        translate([ 0, 0, 5 ])
        #hole_through(name="M3", l=binoc_eyepiece_height/2, cld=0.1, h=0, hcld=0.4);
      }
    }
  translate([ binoc_eyepiece_radius_inside+binoc_base_width/2-.5, binoc_base_width/2, 1 ])
    {
	   rotate([180,0,90])
      { 
        nutcatch_parallel("M3", clh=0.1);
        translate([ 0, 0, 5 ])
        #hole_through(name="M3", l=binoc_eyepiece_height/2, cld=0.1, h=0, hcld=0.4);
      }
    }
  translate([ -binoc_eyepiece_radius_inside-binoc_base_width/2+.5, binoc_base_width/2, 1 ])
    {
	   rotate([180,0,90])
      { 
        #nutcatch_parallel("M3", clh=0.1);
        translate([ 0, 0, 5 ])
        #hole_through(name="M3", l=binoc_eyepiece_height/2, cld=0.1, h=0, hcld=0.4);
      //#nutcatch_sidecut("M3", l=100, clk=0.1, clh=0.1, clsl=0.1);
      }
    }
  }
}
  
new_adapter();  
//base();
/*
rotate([ 0, 0, 0 ])
    translate([ -phone_width/2+distance_to_lens+1.6, -phone_depth/2+distance_to_lens+1.6, phone_height/2 ])
eye_piece();
//*/