use <library.scad>;


module bristle_head(
    // Head height
    head_h=20.0,
    // Head external diameter
    head_external_d=2.0,
    // Internal head diameter
    head_internal_d=0.75,

    // Spiral configuration
    z_step=0.2,
    angle_step=83,
    scale_step=-0.065,
    step_correction=-2,
    scale_correction=-5,

    // Bristle configuration
    bristle_t=0.4,
    bristle_w=0.65,
    bristle_ratio=0.70
) {
    tip_start = head_h - head_internal_d / 2;

    cylinder(h=tip_start, d=head_internal_d);
    translate([0, 0, tip_start])
        sphere(head_internal_d / 2);

    spiral(
        step_max=head_h / z_step + step_correction,
        z_step=z_step,
        angle_step=angle_step,
        scale_step=scale_step,
        scale_start=tip_start / z_step + scale_correction
    ) {
        translate([0, 0, 0.25])
            oval_bristle(
                extension=head_external_d,
                thickness=bristle_t,
                width=bristle_w,
                ratio=bristle_ratio
            );
    };
}


bristle_head($fn=24);
