$fn=96;

//Top vars
top_dia = 120;
top_height_min = 2.2;
top_height_max = 15.8;
top_height_center = 4.6-top_height_min;

top_center_hole_dia = 31.6;
top_center_indent_dia = 57-18;
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

difference()
{
  union()
  {
    cylinder( h = top_height_max, d = top_dia);
  }
    
  #rotate_extrude(convexity = 10)
  translate([top_center_indent_dia, top_height_max])
    circle(d = top_center_indent_dia, $fn = 3);
  
}


/*  
      //Sip holes
    translate([0, 0, -top_height_min/2+sip_hole_height/2-.2])
      make_ring_of(radius = 97.6/2, count = 8)
    cylinder( h = sip_hole_height, d = sip_hole_inner_dia, center = true, $fn=92);
}

*/


module make_ring_of(radius, count)
{
    for (a = [0 : count - 1]) {
        angle = a * 360 / count;
        translate(radius * [sin(angle), -cos(angle), 0])
            rotate([0, 0, angle])
                children();
    }
}