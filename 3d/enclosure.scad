l = 50;
w = 16;

pcb = 1.6;
ridge = 0.5; // enough room to avoid solder pads

h = pcb + 4 + 0.2; // height of PCB fuse + margin

t = 1;

% translate([ t + l / 2, t + w / 2, -pcb ]) import("../out/xt60PDU_v1.0/xt60PDU.stl");

difference()
{
    translate([ 0, 0, -h - t ]) cube([ 2 * t + l, 2 * t + w, t + h ]);
    translate([ t, t, -pcb ]) cube([ l, w, pcb + .01 ]);

    // NOTE: no ridge on short edges to give maximum room for fuse holder
    translate([ t, t + ridge, - h ]) cube([ l, w - 2 * ridge, h - pcb + .01 ]);
}
