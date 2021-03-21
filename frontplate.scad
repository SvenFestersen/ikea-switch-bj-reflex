use <../common/utils.scad>
use <common.scad>

module front_plate() {
    w = 46;
    h = 54;
    d = 1;
    difference() {
        union() {
            // base plate
            rounded_cube([w, h, d], r=3, $fn=50);
            // ikea switch alignment wall
            translate([(w-44)/2, (h-44)/2, 0])
            rounded_cube([44, 44, 4], r=11, $fn=50);
            // hinge base rigth
            translate([(w-8)/2, 0, 0])
            cube([8, 2.2, 4]);
            // hinge base left
            translate([(w-8)/2, h-2.2, 0])
            cube([8, 2.2, 4]);
        }
        // IKEA switch cut-out
        translate([(w-42)/2, (h-42)/2, -0.1])
        rounded_cube([42, 42, 4.2], r=9.5, $fn=100);
        // hinge cut-out right
        translate([(w-4.0)/2, -2.6, -0.1])
        rounded_cube([4.0, 7.1, 2.6], r=0.5);
        // hinge cut-out left
        translate([(w-4.0)/2, h-7.1+2.6, -0.1])
        rounded_cube([4.0, 7.1, 2.6], r=0.5);
        // cut-out in IKEA switch alignment wall to allow easy
        // insertion of the switch cover
        translate([(w-5)/2, h-2.4, 1.6])
        rotate([90, 0 ,0])
        rounded_cube([5, 5, h-2*2.4], r=1, $fn=50);
        // screw holes
        translate([(w-40)/2, (h-42)/2, 0])
        for (i = [0 : 1 : 3]) {
            pos = screw_holes()[i];
            translate([pos[0], pos[1], 1])
            cylinder(r=2.8, h=10, $fn=50);
            translate([pos[0], pos[1], -0.1])
            cylinder(r=1.6, h=10, $fn=50);
        }
        // emboss version string
        translate([5, 1.0, 0.6])
        version_string();
    }
}

color("DimGray")
front_plate();