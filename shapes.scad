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
// smoother(external_d=5.0, internal_d=2.5, $fn=100);
// notch($fn=100);