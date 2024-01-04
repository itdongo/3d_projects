
//////////////////////////////////////////////////////
// Holder Measurements
//

hook_width = 12.8;
hook_to_hook = 37.9 - hook_width;  // 38.2
hook_gap = 2.5;
hook_length = 5.6 + hook_gap;
hook_notch = 5.6 - 2.6;
hook_arm = 6.5;

hook_thick = 2.6;


//////////////////////////////////////////////////////
// Render!
//

// THE BASE CUBICLE HOOK
linear_extrude(height = hook_thick) three_hooks();


// EXTRA STUFF ATTACHED TO THE HOOK
translate([0,-hook_thick,0])
linear_extrude(height = 5) union()
{
    square([hook_to_hook*3, hook_thick]);

    translate([hook_to_hook*3 - hook_thick*4, 0])
        polygon(points = [ [0, 0],
                           [0, -50],
                           [hook_thick, -50],
                           [hook_thick*4, 0] ],
                path = [ [0:3] ]);

    translate([hook_to_hook*3 - hook_thick*3, -50])
        rotate(135) square([hook_thick, 10]);

    // add cable hook
    translate([hook_to_hook*3+1, -10]) difference()
    {
        circle(6, $fn=18);
        circle(4, $fn=18);
        translate([-2.1,0]) square([3.6,7]);

    }
    translate([hook_to_hook*3+1 - 0.22,-10 + 3.29]) rotate(-35) square([1.5,3]);
}



//////////////////////////////////////////////////////
// The Modules
//

module three_hooks()
{
    base = 5;

    for(i=[0:2])
        translate([hook_to_hook*i, base]) hook();
    square([hook_to_hook*3, base]);
}




module hook()
{
    polygon(points = [ [0, 0],
                       [0, hook_length - hook_notch],
                       [hook_notch, hook_length],
                       [hook_width - hook_notch, hook_length],
                       [hook_width, hook_length - hook_notch],
                       [hook_width, hook_gap],
                       [hook_arm, hook_gap],
                       [hook_arm, 0],
                     ],
             path = [ [0:7] ]);
}
