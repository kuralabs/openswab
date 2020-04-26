use <library.scad>;


/**
 * Generate a hollow oval shape.
 */
module oval_hollow_bristle(extension=2.0, thickness=0.5, width=1, ratio=0.8) {
    render() {
        difference() {
            scale([extension, width, thickness])
                sphere(d=1);
            scale([extension * ratio, width * ratio, thickness])
                cylinder(h=1, d=1, center=true);
        }
    }
}

/**
 * Generate a oval shape.
 */
module oval_bristle(extension=2.0, thickness=0.5, width=1) {
    render() {
        scale([extension, width, thickness])
            sphere(d=1);
    }
}


module bristle_head(
    // Head height
    head_h=20.0,
    // Head external diameter
    head_external_d=3.9,
    // Internal head diameter
    head_internal_d=1.5,

    // Spiral configuration
    z_step=0.20,
    angle_step=25,
    scale_step=-0.065,
    step_correction=-1,
    scale_correction=-5,

    // Bristle configuration
    bristle_t=1.25,
    bristle_w=1.25,
) {
    tip_start = head_h - head_internal_d / 2;

    cylinder(h=tip_start, d=head_internal_d);
    translate([0, 0, tip_start])
        sphere(head_internal_d);

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
                width=bristle_w
            );
    };
}


bristle_head($fn=24);
