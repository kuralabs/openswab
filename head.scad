include <shapes.scad>;


module head(
    // Head height
    head_h=20.0,
    // Head external diameter
    head_external_d=3.5,
    // Internal head diameter
    head_internal_d=2.0,

    // Spiral configuration
    z_step=1,
    angle_step=90,
    scale_step=-0.1,
    tip_correction=0,
    scale_correction=0
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
            scale_start=tip_start / z_step + scale_correction
        ) {
            children();
        };
    }
}


module pyramid_head(
    // Head height
    head_h=20.0,
    // Head external diameter
    head_external_d=3.5,
    // Internal head diameter
    head_internal_d=2.0,

    // Tip tunning
    tip_groove_h=0.6,
    tip_scale=0.9,

    // Pyramid tunning
    pyramid_start=0.7,
    piramid_top_ratio=0.5,
    piramid_botton_ratio=0.8,
    piramid_angular_rotation=20,

    // Spiral tunning
    z_step=0.18,
    step_correction=-8,
    angle_step=66,
    scale_step=-0.1,
    scale_correction=-11
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
        translate([0, 0, tip_start + tip_ratio / 2 + .01]) rotate([0, 180, 0])
            starburst(r1=head_r, r2=stem_r, n=6, height=tip_groove_h);
    }
}


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


// Testing
//$fn=50;
//translate([0, 0, -19]) pyramid_head();
