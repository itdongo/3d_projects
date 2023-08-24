$fn = 96;

//bolt holes
bolt_length = 50;
bolt_size = 4.3 ;
nut_size = 10.2;
nut_height = 6.5;

cube_size = 13;

difference(){
  cube ([ cube_size, cube_size, 4 ]);
  
  translate([ cube_size/2, cube_size/2, 0 ]){
  cylinder ( h = nut_height/2, r = nut_size/2, $fn = 6 );
  cylinder ( h = bolt_length/2, r = bolt_size/2 );
  }
}