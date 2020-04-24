use <library.scad>;


module vitellus(scaling) {
    render()
        translate([0, 0, 0.65])
            rotate([-90, 0, 0])
                scale([scaling, scaling, scaling])
                    rotate_extrude()
                        import("vitellus.svg");
}


module vitellus_head(
    // Head height
    head_h=20.0,
    // Head external diameter
    head_external_d=4.0,
    // Internal head diameter
    head_internal_d=1.5,

    // Spiral configuration
    z_step=0.17,
    angle_step=62, // 47 or 62 or 64
    scale_step=-0.065,
    step_correction=0,
    scale_correction=0,
    tip_start_correction=0.4,
    tip_diameter_correction=-0.2,

    // Vitellus configuration
    vitellus_scaling=0.0045,
) {
    tip_start = head_h - head_internal_d / 2;

    cylinder(h=tip_start, d=head_internal_d);
    translate([0, 0, tip_start + tip_start_correction])
        sphere(head_internal_d + tip_diameter_correction);

    spiral(
        step_max=head_h / z_step + step_correction,
        z_step=z_step,
        angle_step=angle_step,
        scale_step=scale_step,
        scale_start=tip_start / z_step + scale_correction
    ) {
        vitellus(vitellus_scaling);
    };
}


vitellus_head($fn=40);