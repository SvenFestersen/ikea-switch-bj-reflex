use <../common/utils.scad>
use <common.scad>


difference() {
    union() {
        rounded_cube([54, 46, 1], r=3, $fn=50);
        
        translate([(54-44)/2, (46-44)/2, 0])
        rounded_cube([44, 44, 4], r=11, $fn=50);
        
        translate([0, (46-8)/2, 0])
        cube([2.2, 8, 4]);
        
        translate([54-2.2, (46-8)/2, 0])
        cube([2.2, 8, 4]);
        
    }
    translate([(54-42)/2, (46-42)/2, -0.1])
    rounded_cube([42, 42, 4.2], r=9.5, $fn=100);
    
    translate([-2.6, (46-4.0)/2, -0.1])
    rounded_cube([7.1, 4.0, 2.6], r=0.5);
    
    translate([54-4.5, (46-4.0)/2, -0.1])
    rounded_cube([7.1, 4.0, 2.6], r=0.5);
    
    translate([2.4, (46-5)/2, 6.6])
    rotate([0, 90 ,0])
    rounded_cube([5, 5, 54-2*2.4], r=1, $fn=50);
    
    translate([(54-42)/2, (46-40)/2, 0])
    for (i = [0 : 1 : 3]) {
        pos_d = screw_holes()[i];
        pos = [pos_d[1], pos_d[0]];
        translate([pos[0], pos[1], 1])
        cylinder(r=2.8, h=10, $fn=50);
        translate([pos[0], pos[1], -0.1])
        cylinder(r=1.6, h=10, $fn=50);
    }
    
    // emboss version
    translate([1, 15, 0.8])
    rotate([0,0,-90])
    version_string();
}