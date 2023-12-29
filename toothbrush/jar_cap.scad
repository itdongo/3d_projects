$fn=96;

cap_radius=31;
cap_height=5;
indent=25;
brush_hole=7.5;

difference()
{
    union()
    {
        cylinder(r=cap_radius+5, h=4, center=true);
        translate([0, 0, cap_height/2+2]) {
        cylinder(r=cap_radius, h=cap_height, center=true);
        translate([ 0, 0, cap_height])
        cylinder(r=cap_radius-.5, h=cap_height, center=true);
        }
    }
        #cylinder(r=brush_hole, h=cap_height, center=true);
        translate([ 0, 0, cap_height*2])
        cylinder(r=indent, h=cap_height*3, center=true);
}