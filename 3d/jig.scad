offset = 9.5;
margin = 0.1;
thickness = 1;

xt60L = 15.5 - 1.5;
xt60W = 8.1 - 1.5;
xt60H = 7.7 + 1;
xt60L1 = 11.5;
xt60W1 = 2.4;

% translate([24.3, 16 / 2 - 1.1, -10 ]) rotate([0,0,180]) import("../out/xt60PDU_v1.0/xt60PDU.stl");

module xt60F(margin = margin)
{
    linear_extrude(xt60H) offset(margin) hull()
    {
        square([ xt60W, xt60L1 ]);
        translate([ (xt60W - xt60W1) / 2, xt60L ]) square([ xt60W1, .01 ]);
    }
}

L = 3 * offset + xt60W + 2 * margin + 2 * thickness;
W = xt60L + 2 * margin + 2 * thickness;

difference()
{
    translate([ -thickness - margin, -thickness - margin, .01 ]) cube([ L, W, xt60H - .02 ]);
    for (i = [0:3])
    {
        translate([ i * offset, 0, 0 ]) xt60F();
    }
}
