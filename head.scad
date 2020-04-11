include <shapes.scad>;

module head(
    // Head height
    head_h=20.0,
    // Head external diameter
    head_external_d=3.5,
    // Internal head diameter
    head_internal_d=2.0
) {
    z_step = 0.04;
    tip_start = head_h - head_internal_d / 2;

    union() {
        cylinder(h=tip_start, d=head_internal_d);
        translate([0, 0, tip_start])
            sphere(head_internal_d / 2);

        spiral(
            step_max=head_h / z_step,
            z_step=z_step,
            scale_start=tip_start / z_step,
            angle_step=15
        ) {
            children();
        };
    }
}



// Testing
//translate([0, 0, -19]) {
//    head() {
//        translate([0, 0, 0.25])
//            rotate([90, 0, 0])
//                cylinder(h=2, d=0.5);
//    };
//}
