include <shapes.scad>;

module head(
    // Head height
    head_h=20.0,
    // Head external diameter
    head_external_d=3.5,
    // Internal head diameter
    head_internal_d=2.0,

    // Spiral configuration
    z_step=0.1,
    angle_step=35,
    scale_step=-0.05,
    tip_correction=-5
) {
    tip_start = head_h - head_internal_d / 2;

    union() {
        cylinder(h=tip_start, d=head_internal_d);
        translate([0, 0, tip_start])
            sphere(head_internal_d / 2);

        spiral(
            step_max=head_h / z_step + tip_correction,
            z_step=z_step,
            angle_step=angle_step,
            scale_step=scale_step,
            scale_start=tip_start / z_step
        ) {
            children();
        };
    }
}



// Testing
$fn=50;

module bristle_head(
    // Head height
    head_h=20.0,
    // Head external diameter
    head_external_d=3.5,
    // Internal head diameter
    head_internal_d=2.0
) {
    head(
        head_h=head_h,
        head_external_d=head_external_d,
        head_internal_d=head_internal_d,

        // Spiral configuration
        z_step=0.1,
        angle_step=42,
        scale_step=-0.06,
        tip_correction=-5
    ) {
        translate([0, 0, 0.25])
            oval_bristle(
                extension=head_external_d,
                thickness=0.5,
                width=1,
                ratio=0.8
            );
    };
}

bristle_head();