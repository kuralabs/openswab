use <library.scad>;


module body(
    // Head height
    head_h=20.0,
    // Head diameter
    head_d=1.5,

    // Flex height, will be placed after the head, thus incrementing the total height
    flex_h=30.0,
    // Flex diameter
    flex_d=1.5,

    // Notch distance from the tip of the swab
    notch_d=80.0,
    // Notch break percent (100% -> 1.0), amount of material to remove at the notch
    notch_b=0.50,
    // Notch height
    notch_h=3.0,

    // Body height, will be added to the flex, thus incrementing the total height
    body_h=92.0,
    // Body diameter
    body_d=3.0,

    // Base height, will be added to the body, thus incrementing the total height
    base_h=3.0,
    // Base diameter
    base_d=4.5,
) {
    total_height = head_h + flex_h + body_h + base_h;

    render() {
        // Transition smoother
        translate([0, 0, base_h + body_h + flex_h])
            smoother(flex_d, head_d);

        // Flex
        translate([0, 0, base_h + body_h])
            cylinder(h=flex_h, d=flex_d);
        translate([0, 0, base_h + body_h])
            smoother(external_d=body_d, internal_d=flex_d);

        // Body
        difference() {
            translate([0, 0, base_h])
                cylinder(h=body_h, d=body_d);
                    // The notch
            translate([0, 0, total_height - notch_d])
                notch(
                    external_d=body_d,
                    internal_d=body_d - body_d * notch_b,
                    height=notch_h
                );
        }

        // Base
        cylinder(h=base_h, d=base_d);
    }
}


body($fn=40);
