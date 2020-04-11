/**
 * Generate shape that places children in a spiral.
 */
module spiral(step_max=100, z_step=0.1, angle_step=5, scale_step=-0.01, scale_start=50) {
    module _spiral(c_step=0, c_z=0, c_angle=0, c_scale=1) {

        c_scale = c_step < scale_start ? 1 : c_scale + scale_step;

        if (c_step < step_max) {
            translate([0, 0, c_z])
                rotate([0, 0, c_angle]) {
                    scale([c_scale, c_scale, c_scale])
                        children();
                }

            _spiral(
                c_step=c_step + 1,
                c_z=c_z + z_step,
                c_angle=c_angle + angle_step,
                c_scale=c_scale
            ) {
                children();
            };
        }
    }
    _spiral() {
        children();
    };
}

/**
 * Generate a hollow oval shape.
 */

module oval_bristle(extension=3.5, thickness=0.5, width=1, ratio=0.8) {
    difference() {
        resize(newsize=[extension, 0, thickness])
            sphere(d=width);
        resize(newsize=[extension * ratio, width * ratio, thickness])
            cylinder(h=1, d=1, center=true);
    }
}


/**
 * A coil or spring shape.
 */
module coil(
    r1=100,
    r2=10,
    h=100,
    clockwise=true,
    twists
) {
    rotation = clockwise ? 1 : -1;
    hr = h / (twists * 2);
    stepsize = 1 / 16;

    module segment(i1, i2) {

        alpha1 = i1 * 360 * r2 / hr;
        alpha2 = i2 * 360 * r2 / hr;
        len1 = sin(acos(i1 * 2 - 1)) * r2;
        len2 = sin(acos(i2 * 2 - 1)) * r2;

        if (len1 < 0.01)
            polygon([
                [cos(alpha1) * r1, sin(alpha1) * r1],
                [cos(alpha2) * (r1 - len2), sin(alpha2) * (r1 - len2)],
                [cos(alpha2) * (r1 + len2), sin(alpha2) * (r1 + len2)]
            ]);
        if (len2 < 0.01)
            polygon([
                [cos(alpha1) * (r1 + len1), sin(alpha1) * (r1 + len1)],
                [cos(alpha1) * (r1 - len1), sin(alpha1) * (r1 - len1)],
                [cos(alpha2) * r1, sin(alpha2) * r1],
            ]);
        if (len1 >= 0.01 && len2 >= 0.01)
            polygon([
                [cos(alpha1) * (r1 + len1), sin(alpha1) * (r1 + len1)],
                [cos(alpha1) * (r1 - len1), sin(alpha1) * (r1 - len1)],
                [cos(alpha2) * (r1 - len2), sin(alpha2) * (r1 - len2)],
                [cos(alpha2) * (r1 + len2), sin(alpha2) * (r1 + len2)]
            ]);
    }

    linear_extrude(
        height=h,
        twist=rotation * 180 * h / hr,
        convexity=5,
        $fn=(hr / r2) / stepsize
    ) {
        for (i = [stepsize : stepsize : 1 + stepsize / 2])
            segment(i - stepsize, min(i, 1));
    }
}

/**
 * A negative shape to create notches in cylindrical objects.
 */
module notch(external_d=3, internal_d=1, height=3) {
    difference() {
        cylinder(d=external_d * 1.0001, h=height * 0.9999, center=true);

        union() {
            cylinder(d1=internal_d, d2=external_d, h=height / 2);
                translate([0, 0, - height / 2])
            cylinder(d1=external_d, d2=internal_d, h=height / 2);

            cylinder(d=internal_d, h=height, center=true);
        }
    }
}


/**
 * A donnut. A torus.
 */
module torus(diameter=3, thickness=1) {
    rotate_extrude(convexity=10)
        translate([(diameter / 2) - (thickness / 2), 0, 0])
            circle(d=thickness);
}


/**
 * Smoother between two contiguous cylinders of different diameter.
 */
module smoother(external_d=3, internal_d=1) {

    torus_t = (external_d - internal_d) / 2;

    // Top smooth
    difference() {
        cylinder(h=torus_t, d=internal_d + torus_t);
        translate([0, 0, torus_t])
            torus(diameter=external_d, thickness=torus_t);
    }

    // Bottom smooth
    intersection() {
        torus(diameter=external_d, thickness=torus_t);
        cylinder(h=torus_t, r=external_d);
    }
}


// Testing
//smoother(external_d=5.0, internal_d=2.5, $fn=100);
//notch($fn=100);
//spiral() {
//    translate([0, 0, 0.25])
//        rotate([90, 0, 0])
//            cylinder(h=2, d=0.5);
//};