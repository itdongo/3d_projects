
width = 220;
depth = 220;
height = 10;

dw = 188;
dd = 95;
dh = 25;
dx = 14;
dy = 11;
dz = 10;

px = 30;
py = 130;
ph = 60;
sprad = 18;

cutout_points = [
[14,12], //0
[14,103], //1
[25,103], //2
[25,110], //3
[190,110], //4
[190,103], //5
[200,103], //6
[200,12], //7
[190,12], //8
[190,10], //9
[25,10], //10
[25,12] //11
];
cutout_paths = [[
0,
1,
2,
3,
4,
5,
6,
7,
8,
9,
10,
11
]];





module base() {
    difference() {
        union() {
            cube([ width, depth, height ], center = false );
            translate([ px, py, dz ]){
            cylinder(h = ph, r = sprad);
            translate([ sprad*2+4, 0, 0 ])
                cylinder(h = ph, r = sprad);
            translate([ sprad*4+8, 0, 0 ])
                cylinder(h = ph, r = sprad);
            translate([ sprad*6+12, 0, 0 ])
                cylinder(h = ph, r = sprad);
            translate([ sprad*8+16, 0, 0 ])
                cylinder(h = ph, r = sprad);
            
                }
            
//dispenser
            translate([ dx, dy, dz ])
            cube([ dw, dd, dh ]);
            }
            translate([ dx-13, dy-10, dz ])
            linear_extrude(dh+20)
polygon(points = cutout_points, paths = cutout_paths);
        translate([ px, py, dz ]){
            cylinder(h = ph, r = sprad-1);
            translate([ sprad*2+4, 0, 0 ])
                cylinder(h = ph, r = sprad-1);
            translate([ sprad*4+8, 0, 0 ])
                cylinder(h = ph, r = sprad-1);
            translate([ sprad*6+12, 0, 0 ])
                cylinder(h = ph, r = sprad-1);
            translate([ sprad*8+16, 0, 0 ])
                cylinder(h = ph, r = sprad-1);
            
                }
    }
}

base();