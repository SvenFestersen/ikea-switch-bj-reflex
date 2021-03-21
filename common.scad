version = "v1.1";

module version_string() {
    linear_extrude(0.6)
    text(version, font = "Liberation Sans", size=4);
}


screw_hole_positions = [
    [0, 0],
    [40, 0],
    [0, 42],
    [40, 42]
];

function screw_holes() = screw_hole_positions;
