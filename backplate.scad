use <../common/utils.scad>
use <common.scad>

module back_plate() {
    baseplate_size = 67;
    inner_wall_size = 50.6;
    inner_wall_height = 3.0;
    difference() {
        union() {
            // base plate with a 1.6mm thick, 0.6mm high wall
            difference() {
                rounded_cube([baseplate_size , baseplate_size , 1.6], r=10, $fn=50);
                translate([(baseplate_size - 55)/2, (baseplate_size - 55) / 2, 1])
                rounded_cube([55, 55, 0.7], r=8, $fn=50);
            }
            // alignment protrusion top
            translate([(baseplate_size - inner_wall_size) / 2 - 2.4, (baseplate_size-9.5)/2, 1])
            cube([4,9.5,inner_wall_height]);
            // alignment protrusion bottom
            translate([baseplate_size - (baseplate_size - inner_wall_size) / 2 + 2.4 - 4, (baseplate_size-9.5)/2, 1])
            cube([4,9.5,inner_wall_height]);
            // alignment protrusion left
            translate([(baseplate_size-9.5)/2, (baseplate_size - inner_wall_size) / 2 - 2.4, 1])
            cube([9.5,6,inner_wall_height]);
            // alignment protrusion right
            translate([(baseplate_size-9.5)/2, baseplate_size - (baseplate_size - inner_wall_size) / 2 + 2.4 - 6, 1])
            cube([9.5,6,inner_wall_height]);
            // thick inner wall to hold the IKEA switch
            translate([(baseplate_size-inner_wall_size)/2, (baseplate_size-inner_wall_size)/2, 1])
            rounded_cube([inner_wall_size, inner_wall_size, inner_wall_height], r=9, $fn=50);            
        }
        // IKEA switch screw hole and counter hole
        translate([(baseplate_size-42)/2+8.3, baseplate_size/2, -0.1]) {
            cylinder(r=2.1/2, h=10, $fn=50);
            cylinder(r=2, h=0.8, $fn=50);
        }
        // front plate mounting screw holes and hexagonal
        // counter holes (for hex nuts)
        translate([(baseplate_size-40)/2,(baseplate_size-42)/2,-0.1]) {
            for (i = [0 : 1 : 3]) {
                pos = screw_holes()[i];
                translate([pos[0], pos[1], 0]) {
                    cylinder(r=1.6, h=10, $fn=50);
                    cylinder(h=2.0, r=3.4, $fn=6);
                }
            }
        }
        // cut-out for the IKEA switch
        // note: this leaves 1.3mm back plate behind the button,
        // while the rest of the plate is 1.6mm thick
        translate([(baseplate_size-42)/2, (baseplate_size-42)/2, 1.3])
        rounded_cube([42, 42, 3.3], r=9.5, $fn=100);
        // plate cut-out for accessing the switch battery
        // and pairing button from the back
        translate([(baseplate_size-22)/2+0.7, (baseplate_size-28)/2, -0.1])
        rounded_cube([22.5, 28, 2], r=2, $fn=50);
        // emboss version
        translate([baseplate_size-14, baseplate_size-35, 1.1])
        rotate([0,0,90])
        version_string();
    }
}

color("DimGray")
back_plate();
