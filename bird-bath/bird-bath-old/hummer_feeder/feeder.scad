$fn=96;
use <threads.scad>;

//Top vars
top_dia = 120;
top_height_min = 2.2;
top_height_max = 15.8;
top_height_center = 4.1;

top_center_hole_dia = 31.6;
top_center_indent_dia = 51.4;
top_center_indent_height = 13.2;

top_inside_lip_height = 5.5-3.1;
top_inside_lip_width = 2.4;
top_inside_lip_outer_dia = 32.4;
top_inside_lip_inner_dia = 27.6;

top_center_cone_height = 13.3;
top_center_cone_max_dia = 74.5;
top_center_cone_min_dia = 51.1;

top_outside_lip_height = 5.3;
top_outside_lip_outer_dia = 108.4;
top_outside_lip_width = 2.2;
top_outside_lip_inner_dia = top_outside_lip_outer_dia-2.5;

sip_hole_outer_dia = 6;
sip_hole_height = 5.3;
sip_hole_inner_dia = 3.8;


//Bottom vars
bottom_base_height=30;
bottom_base_radius=57;
bottom_base_thickness=3;
bottle_base_radius=18;
perch_slots=3.05;
inside_perch_radius=134.5/2;
outside_perch_radius=155.2/2;
perch_width=4;
perch_max_height=9;
perch_min_height=3;
perch_mount_length=23;

module perch()
{
  difference()
  {
    union()
    {
      rotate([0, 0, 0 ]){
      rotate_extrude($fn=96){
        translate([inside_perch_radius, 1])
          circle(r=1);
        translate([outside_perch_radius, 1])
          circle(r=1);
      }
      }
    translate([0, 0, bottom_base_height/2-perch_slots*4])
      rotate([0,0,0])
      make_ring_of(radius = outside_perch_radius*2-perch_mount_length+3, count = 8)
      translate([ 0, 0, 2 ])
      rotate([90,0,90])
      linear_extrude(2, center=true, convexity = 10, 0, slices= 1, scale = 1.0)
      polygon(points=[[bottom_base_radius,0],[outside_perch_radius,0],[outside_perch_radius,6],[bottom_base_radius,2]], paths=[[0,1,2,3]]);
      //cylinder(h=16, r1 = 2, r2= 4, center=true, $fn=4);
        //cylinder(h=perch_width, r1 = perch_min_height, r2= perch_max_height, center=true, $fn=4);

    }
  }
}

module bottom()
{
  difference()
  {
    union()
    {
      cylinder(h=bottom_base_height, r=bottom_base_radius, center=true);
    }
    translate([0,0,bottom_base_thickness])
      cylinder(r=bottom_base_radius-bottom_base_thickness, h=bottom_base_height-bottom_base_thickness, center=true);
    //Perch mounts
    translate([0, 0, bottom_base_height/2-perch_max_height])
      make_ring_of(radius = bottom_base_radius, count = 8)
        #cube(size=[perch_slots, bottom_base_thickness/2, perch_max_height], center=false);
        

  }
  difference()
  {
    union()
    {
      translate([0,0,bottom_base_thickness])
        cylinder(r=bottle_base_radius, h=bottom_base_height, center=true);
    }
    translate([0,0,-5]){
      cube(size=[bottle_base_radius*2, 4, bottom_base_height/2], center=true);
      cube(size=[4, bottle_base_radius*2, bottom_base_height/2], center=true);
    }
    translate([0, 0, 2])
    { 
      #cylinder(r=27.5/2, h=bottom_base_height, center=true);
      //#metric_thread(diameter=29.5, pitch=3, length=bottom_base_height/2, internal=true);
    }
  }
}

module top()
{
  difference()
  {
    union()
    {
      cylinder( h = top_height_center, d = top_dia, center = true);
      
//outer lip
      color("red")
      rotate_extrude()
        translate([top_outside_lip_outer_dia/2, 2])
          square(top_outside_lip_width);
      
//Center cone
      color("blue")
      rotate_extrude()
        translate([top_center_cone_min_dia/2, -top_center_cone_height/2])
          circle(top_center_cone_min_dia/2, $fn=3);

    //Sip holes color("teal")
    translate([0, 0, -top_height_min/2+sip_hole_height/2-.2])
      make_ring_of(radius = 97.6/2, count = 8)
    cylinder( h = sip_hole_height, d = sip_hole_outer_dia, center = true);
        } 
        
    translate([0, 0, -top_height_min/2+sip_hole_height/2-.2])
      make_ring_of(radius = 97.6/2, count = 8)
    cylinder( h = sip_hole_height, d = sip_hole_inner_dia, center = true);

//Center remove
    translate([ 0, 0, top_height_min+1 ])
      cylinder( h = top_center_indent_height, d = top_center_indent_dia );

//top side flatten
      rotate_extrude()
        translate([top_center_cone_min_dia/2, -top_center_cone_height*3+2])
          square(top_center_cone_max_dia/2);
        
     translate([0, 0, -top_center_cone_height*2.5])
        #cylinder(h = top_center_cone_height*2, d = top_center_cone_min_dia+1);

  }
}

module make_ring_of(radius, count)
{
    for (a = [0 : count - 1]) {
        angle = a * 360 / count;
        translate(radius * [sin(angle), -cos(angle), 0])
            rotate([0, 0, angle])
                children();
    }
}

module center_piece()
{
  difference()
  {
    union()
    {
      translate([0,0,bottom_base_thickness])
        cylinder(r=bottle_base_radius, h=bottom_base_height, center=true);
    }
    translate([0,0,-5]){
      cube(size=[bottle_base_radius*2, 4, bottom_base_height/2], center=true);
      cube(size=[4, bottle_base_radius*2, bottom_base_height/2], center=true);
    }
    translate([0, 0, 3])
    { 
      #cylinder(r=27.5/2, h=bottom_base_height, center=true);
      metric_thread(diameter=29.5, pitch=3, length=bottom_base_height/2, internal=true);
    }
  }
}

//top();
//bottom();
//perch();
//sip_hole();
center_piece();