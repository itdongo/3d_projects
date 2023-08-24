$fn=96;
height=2;
extension_width=27;
width=30;
depth=27;
side_width=101.5;


left_x=-width/2-extension_width/2;
left_y=0;
left_z=0;

font = "DejaVu Sans:style=Bold";
letter_size = 18;
topstring = "S";
bottomstring = "Veteran";

module topbanner() {
    difference() {
      union() {
        cube(size=[width, depth, .4], center = true);
        //translate([-105, -10, -1.5]) cube(size=[width/5, depth-7, height-3]);
        //translate([63.5, -10, -1.5]) cube(size=[width/5, depth-7, height-3]);
      translate([0, 0, .2 ])  
      linear_extrude(.4) {
             
          text(topstring, size = letter_size, font = font, halign = "center", valign = "center", $fn = 64);
        }
      
      translate([0, 0, .7 ])
      
        cube(size=[width, depth, .2], center = true);
    }
  }
}

topbanner();