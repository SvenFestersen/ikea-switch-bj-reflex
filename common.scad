version = "v1.0";

module version_string() {
    linear_extrude(0.4)
    text(version, font = "Liberation Sans", size=3);
}


screw_hole_positions = [
    [0, 0],
    [40, 0],
    [0, 42],
    [40, 42]
];

function screw_holes() = screw_hole_positions;
