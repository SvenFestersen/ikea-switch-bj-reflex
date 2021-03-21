use <../common/utils.scad>
use <common.scad>


module mini_cross(h) {
    d = 0.8;
    s = 3;
    union() {
        translate([-s/2, -d/2, 0])
        cube([s, d, h]);
        translate([-d/2, -s/2, 0])
        cube([d, s, h]);
    }
}

union() {
    w = 49.5;
    h = 48.0;
    difference() {
        rounded_cube([w, h, 0.8], r=9, $fn=50);

        translate([(w-23)/2, -1, -0.1])
        rounded_cube([23, 6, 1], r=1, $fn=50);

        translate([(w-23)/2, h-5, -0.1])
        rounded_cube([23, 6, 1], r=1, $fn=50);

        translate([-1, (h-23)/2, -0.1])
        rounded_cube([6, 23, 1], r=1, $fn=50);

        translate([w-5, (h-23)/2, -0.1])
        rounded_cube([6, 23, 1], r=1, $fn=50);
        
        translate([(w-28)/2, (h-16)/2, -0.1])
        rounded_cube([28, 16, 1]);
        
        // emboss version
        translate([7, 12, 0.6])
        rotate([0,0,-90])
        version_string();
    }
    
    translate([w/2, (h-24.5)/2, 0]){
        mini_cross(3);
        translate([0, 24.5, 0])
        mini_cross(3);
    }
}