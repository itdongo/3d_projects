$fn=4;
inside_diameter=50;
outside_diameter=inside_diameter+4;

end_diameter=110;
end_diameter_inside=end_diameter-4;
basket_width=230-end_diameter;
basket_depth=110;
basket_depth_inside=basket_depth-4;
basket_height=200;
basket_height_inside=basket_height+1;

lid_height = 20;


module lid()
{
  difference()
  {
    union()
    {
      cylinder( h = 185, d1 = 135, d2 = 165 );
    }
    translate([ 0, 0, 1.2 ])
    cylinder( h = 183.8, d1 = 131, d2 = 161 );
  }
}


lid();