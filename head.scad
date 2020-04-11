include <shapes.scad>;


module brush(
    radius=8,
    thickness=1.25,
    height=50,
    twists=2
) {
    for (clockwise = [true, false])
        for (angle = [0, 90, 180, 270])
            rotate([0, 0, angle]) coil(
                 r1=radius,
                 r2=thickness,
                 h=height,
                 clockwise=clockwise,
                 twists=twists
            );
}



// Testing
// brush();
