/**
 * Shape of a 3D star.
 */
module starburst(r1=10, r2=5, n=6, height=5) {
    a = 180 / n;

    p0 = [0, 0, 0];
    p1 = [r2 * cos(a), r2 * sin(a), 0];
    p2 = [r1, 0, 0];
    p3 = [0, 0, height];

    module half_burst() {
        polyhedron(points = [p0, p1, p2, p3],
            faces = [
                [0, 2, 1],
                [0, 1, 3],
                [0, 3, 2],
                [2, 1, 3]
            ]
        );
    }

    module burst() {
        hull() {
            half_burst();
            mirror([0, 1,0]) half_burst();
        }
    }

    for(i = [0 : n - 1]) {
        rotate(2 * a * i) burst();
    }
}


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
module oval_bristle(extension=2.0, thickness=0.5, width=1, ratio=0.8) {
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
