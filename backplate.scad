use <../common/utils.scad>
use <common.scad>


difference() {
    union() {
        difference() {
            rounded_cube([59, 59, 1.6], r=10, $fn=50);
            translate([2, 2, 1])
            rounded_cube([55, 55, 0.7], r=8, $fn=50);
        }

        translate([1.8, (59-9.5)/2, 1])
        cube([4,9.5,3.2]);

        translate([59-5.8, (59-9.5)/2, 1])
        cube([4,9.5,3.2]);
        
        translate([(59-9.5)/2, 1.8, 1])
        cube([9.5,6,3.2]);
        
        translate([(59-9.5)/2, 59-7.8, 1])
        cube([9.5,6,3.2]);

        translate([(59-50.6)/2, (59-50.6)/2, 1])
        rounded_cube([50.6, 50.6, 3.2], r=9, $fn=50);
        
        translate([(59-40)/2,(59-42)/2,0]) {
            for (i = [0 : 1 : 3]) {
                pos = screw_holes()[i];
                translate([pos[0], pos[1], 0])
                cylinder(r=3.2, h=4.2, $fn=50);
            }
        }
        
        
    }

    translate([(59-42)/2+8.3, 59/2, -0.1]) {
        cylinder(r=2.1/2, h=10, $fn=50);
        cylinder(r=2, h=0.8, $fn=50);
    }
    
    translate([(59-22)/2+0.7, (59-28)/2, -0.1])
    rounded_cube([22.5, 28, 2], r=2, $fn=50);
    
    translate([(59-42)/2, (59-42)/2, 1.5])
    rounded_cube([42, 42, 3.3], r=9.5, $fn=100);
    
    translate([(59-40)/2,(59-42)/2,-0.1]) {
        for (i = [0 : 1 : 3]) {
            pos = screw_holes()[i];
            translate([pos[0], pos[1], 0]) {
                cylinder(r=1.6, h=10, $fn=50);
                cylinder(h=2.0, r=3.4, $fn=6);
            }
        }
    }
    
    // emboss version
    translate([47, 35, 1.3])
    rotate([0,0,90])
    version_string();
}

