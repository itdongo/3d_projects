$fn=196;

difference(){
  union(){
    cylinder(1, 50);
    rotate_extrude(convexity = 10)
translate([42.5, 0, 0])
square( 2, $fn = 4);
  }
  cylinder(h = 2, r = 4);
  
holes(10,4);
holes(20,8);
holes(30,12);
holes(40,16);
}

module holes(pathRadius,num){
//  pathRadius=pathRadius;
//num=num;
for (i=[1:num])  {
	translate([pathRadius*cos(i*(360/num)),pathRadius*sin(i*(360/num)),0]) #cylinder(r=4,h=2, $fn=20);
}
}