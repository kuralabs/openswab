use <library.scad>;


module helicoid(
    radius=8,
    thickness=1.25,
    height=50,
    twists=2
) {
    for (clockwise = [true, false])
        for (angle = [0, 90, 180, 270])
            rotate([0, 0, angle]) coil(
                 r1=radius - (thickness / 2),
                 r2=thickness / 2,
                 h=height,
                 clockwise=clockwise,
                 twists=twists
            );
}



module albumen_head(
    // Head height
    head_h=20.0,
    // Head external diameter
    head_external_d=3.9,
    // Internal head diameter
    head_internal_d=1.5,

    // Albumen configuration
    albumen_head_fn=13,
    albumen_twists=1.249,
) {
    half_tip = head_external_d / 2;
    tip_start = head_h - half_tip;

    cylinder(h=tip_start, d=head_internal_d);
    translate([0, 0, tip_start])
        sphere(d=head_external_d, $fn=albumen_head_fn);

    translate([0, 0, half_tip])
        sphere(d=head_external_d, $fn=albumen_head_fn);

    translate([0, 0, half_tip])
    helicoid(
        radius=half_tip,
        thickness=head_external_d - head_internal_d,
        height=tip_start - half_tip,
        twists=albumen_twists
    );
}


albumen_head($fn=40);