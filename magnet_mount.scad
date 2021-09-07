use <../common/utils.scad>
use <common.scad>

module magnet_mount() {
    gaps = 0.3;
    w = 28  - 2 * gaps;
    h = 22.5 - 2 * gaps;
    d_wall_inner = 0.8;
    d_wall_outer = 4.5;
    baseplate_size = 59;
    w1 = baseplate_size + 2 * d_wall_outer + 2 * gaps;
    h1 = baseplate_size + 2 * d_wall_outer + 2 * gaps;
    magnet_d = 12.5;
    magnet_r = magnet_d / 2;
    magnet_h = 1.4;
    offset_y = 0.7;
    hole_r = 1.6;
    hole_dist = hole_r + 2.8;
    
    mount_hole_positions = [
        [hole_dist, hole_dist],
        [w1 - hole_dist, hole_dist],
        [hole_dist, h1 - hole_dist],
        [w1 - hole_dist, h1 - hole_dist]
    ];
    
    union() {
        // base
        difference() {
            rounded_cube([w1,  h1, 1.5], r=4, $fn=50);
            translate([d_wall_outer, d_wall_outer, 0.2])
            rounded_cube([w1 - 2 * d_wall_outer,  h1 - 2 * d_wall_outer, 15], r=9.5, $fn=50);
            // screw holes
            for (i = [0 : 1 : 3]) {
                pos = mount_hole_positions[i];
                translate([pos[0], pos[1], -0.1]) {
                    cylinder(r=hole_r, h=20, $fn=50);
                }
            }
            // cutout for switch screw
            translate([w1/2, (baseplate_size-42)/2 + d_wall_outer + gaps + 8.3, -0.1])
            cylinder(r=2.25, h=10, $fn=50);
        }
        // window fitting
        translate([0, offset_y, 0])
        difference() {
            translate([(w1 - w) / 2, (h1 - h) / 2, 0])
            rounded_cube([w,  h, 1.5], r=2.5, $fn=50);
            translate([(w1 - w) / 2 + d_wall_inner, (h1 - h) / 2 + d_wall_inner, 0.4])
            rounded_cube([w - 2 * d_wall_inner,  h - 2 * d_wall_inner, 1.5], r=2.5, $fn=50);
            translate([0, (h1-10)/2, 0.4])
            cube([w1, 10, 2]);
        }
        // magnet sleeve
        translate([w1 / 2, h1 / 2 + offset_y, 0.4])
        difference() {
            cylinder(r=magnet_r + 0.6, h=0.4 + magnet_h - 0.2, $fn=100);
            cylinder(r=magnet_r, h=0.4 + magnet_h, $fn=100);
        }
    }
}

magnet_mount();