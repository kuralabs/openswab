use <head-bristle.scad>;
use <head-pyramid.scad>;
use <body.scad>;


// All parameters are in millimeters
// Total height is given by head_h + flex_h + body_h + base_h
module swab(
    // Head height
    head_h=20.0,
    // Head external diameter
    head_external_d=2.0,
    // Internal head diameter
    head_internal_d=0.75,
    // Head type. Available "bristle" and "pyramid"
    head_type="bristle",

    // Flex height, will be placed after the head, thus incrementing the total height
    flex_h=30.0,
    // Flex diameter
    flex_d=1.25,

    // Notch distance from the tip of the swab
    notch_d=95.0,
    // Notch break percent (100% -> 1.0), amount of material to remove at the notch
    notch_b=0.4,
    // Notch height
    notch_h=3.0,

    // Body height, will be added to the flex, thus incrementing the total height
    body_h=92.0,
    // Body diameter
    body_d=2.5,

    // Base height, will be added to the body, thus incrementing the total height
    base_h=3.0,
    // Base diameter
    base_d=4.0,
) {

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

    // Body
    body(
        head_h=head_h,
        head_d=head_internal_d,
        flex_h=flex_h,
        flex_d=flex_d,
        notch_d=notch_d,
        notch_b=notch_b,
        notch_h=notch_h,
        body_h=body_h,
        body_d=body_d,
        base_h=base_h,
        base_d=base_d
    );
}


swab($fn=40, head_type="bristle");
