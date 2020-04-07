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


module torus(thickness, radius)
{
    rotate_extrude(convexity=10, $fn=100)
        translate([radius, 0, 0])
            circle(r=thickness, $fn=100);
}


module brush(
    radius=8,
    thickness=1.25,
    height=50,
    twists=2
) {
    union() {
        for (clockwise = [true, false])
            for (angle = [0, 90, 180, 270])
                rotate([0, 0, angle]) coil(
                     r1=radius,
                     r2=thickness,
                     h=height,
                     clockwise=clockwise,
                     twists=twists
                );
        torus(thickness, radius);
        translate([0, 0, height])
            torus(thickness, radius);
    }
}


module spindle(
    radius=8,
    thickness=1.25,
    height=50,
) {
    translate([0, 0, -height])
        cylinder(r=radius + thickness / 2, h=height, $fn=100);
}


module base(
    height=50,
    radius=12
) {
    cylinder(r=radius, h=height, $fn=100);
}


module swab(length=160, diameter=5, bheight=15) {

    // The coil thickness represents the 16% of the brush diameter
    brush_outline = 0.16;
    // The base will overextend 16%
    base_outline = 1.16;

    thickness = diameter * brush_outline;

    union() {
        brush(
            radius=diameter / 2,
            thickness=thickness,
            height=bheight,
            twists=(bheight * (thickness / 10))
        );
        spindle(
            radius=diameter / 2,
            thickness=thickness,
            height=length - bheight
        );
        translate([0, 0, - length + bheight])
            base(
                height=bheight,
                radius=diameter * base_outline
            );
    }
}


swab();