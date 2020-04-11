include <head.scad>;


// All parameters are in millimeters
// Total height is given by head_h + flex_h + body_h + base_h
module swab(
    // Head height
    head_h=20.0,
    // Head external diameter
    head_external_d=3.5,
    // Internal head diameter
    head_internal_d=2.0,
    // Head type. Available "bristle" and "pyramid"
    head_type="bristle",

    // Flex height, will be placed after the head, thus incrementing the total height
    flex_h=30.0,
    // Flex diameter
    flex_d=2.5,

    // Notch distance from the tip of the swab
    notch_d=80.0,
    // Notch break percent (100% -> 1.0), amount of material to remove at the notch
    notch_b=0.4,
    // Notch height
    notch_h=3.0,

    // Body height, will be added to the flex, thus incrementing the total height
    body_h=97.0,
    // Body diameter
    body_d=5.0,

    // Base height, will be added to the body, thus incrementing the total height
    base_h=3.0,
    // Base diameter
    base_d=8.0,
) {

    total_height = head_h + flex_h + body_h + base_h;

    // Punch a notch
    difference() {
        union() {
            // Head
            translate([0, 0, base_h + body_h + flex_h])
                if (head_type == "bristle") {
                    bristle_head(
                        head_h=head_h,
                        head_external_d=head_external_d,
                        head_internal_d=head_internal_d
                    );
                } else if (head_type == "pyramid") {
                    pyramid_head(
                        head_h=head_h,
                        head_external_d=head_external_d,
                        head_internal_d=head_internal_d
                    );
                } else {
                    cylinder(h=head_h, d=head_external_d);
                }
            // Flex
            translate([0, 0, base_h + body_h])
                cylinder(h=flex_h, d=flex_d);
            translate([0, 0, base_h + body_h])
                smoother(external_d=body_d, internal_d=flex_d);
            // Body
            translate([0, 0, base_h])
                cylinder(h=body_h, d=body_d);
            // Base
            cylinder(h=base_h, d=base_d);
        }

        // The notch
        translate([0, 0, total_height - notch_d])
            notch(
                external_d=body_d,
                internal_d=body_d - body_d * notch_b,
                height=notch_h
            );
    }
}



// Final rendering
module swabs(grid=5, translation=-150) {
    translate([grid, grid, translation])
        swab(head_type="pyramid", notch_d=80.0);

    translate([-grid, grid, translation])
        swab(head_type="bristle", notch_d=80.0);

    translate([grid, -grid, translation])
        swab(head_type="pyramid", notch_d=95.0);

    translate([-grid, -grid, translation])
        swab(head_type="bristle", notch_d=95.0);
}

$fn=100;
swabs(translation=0);
