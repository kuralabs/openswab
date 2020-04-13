use <library.scad>;


module pyramid_head(
    // Head height
    head_h=20.0,
    // Head external diameter
    head_external_d=2.0,
    // Internal head diameter
    head_internal_d=0.75,

    // Tip tunning
    tip_groove_h=0.4,
    tip_scale=0.5999,

    // Pyramid tunning
    pyramid_start=0.4,
    piramid_top_ratio=0.5,
    piramid_botton_ratio=0.9,
    piramid_angular_rotation=20,

    // Spiral tunning
    z_step=0.13,
    step_correction=-6,
    angle_step=66,
    scale_step=-0.1,
    scale_correction=-10.5
) {

    head_r = head_external_d / 2;
    stem_r = head_internal_d / 2;

    tip_ratio = (head_external_d - head_internal_d) * tip_scale;
    tip_start = head_h - tip_ratio / 2;

    difference() {
        union() {
            cylinder(h=head_h, d=head_internal_d);
            translate([0, 0, tip_start])
                torus(
                    diameter=head_internal_d + tip_ratio,
                    thickness=tip_ratio
                );
            spiral(
                step_max=head_h / z_step + step_correction,
                z_step=z_step,
                angle_step=angle_step,
                scale_step=scale_step,
                scale_start=head_h / z_step + scale_correction
            ) {
                translate([0, 0, pyramid_start])
                    rotate([90, piramid_angular_rotation, 0])
                        cylinder(
                            h=head_r,
                            r1=stem_r * piramid_botton_ratio,
                            r2=stem_r * piramid_top_ratio,
                            $fn=4
                        );
            };
        }
        translate([0, 0, tip_start + tip_ratio / 2 + 0.01]) rotate([0, 180, 0])
            starburst(r1=head_r, r2=stem_r, n=6, height=tip_groove_h);
    }
}


pyramid_head($fn=40);
