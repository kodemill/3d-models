use <lib/Threading.scad>

for (i=[0:1]) {
  D = 16.3+i*.1;
  d = D-6;
  height = 14;
  pitch = 1.4111;

  translate([i*(D+5),0,0]) {
    testModel(pitch = pitch, height = height, D = D, d = d, thread_angle = 29);
    % translate([0,10,0]) text(text = str(D), size = 4, halign = "center");
  }
}

// https://en.wikipedia.org/wiki/National_pipe_thread#cite_note-piping-designer-8

module testModel (
  d = 6,
  D = 10,
  windings = 5,
  height = 0,
  thread_angle = 29,
  pitch = 1,
  $fn = 100,
) {
  height = height == 0 ? pitch*(windings+1) : height;
  windings = height == 0 ? windings : height/pitch-1;

  union() {
    difference() {
      cylinder( r = D/2+2, h = 2 );
      translate( [0, 0, -1] )
        cylinder(
          r = d/2,
          h = 14
        );
    }
    difference () {
      threading( pitch = pitch, d = D, D = d, windings = windings, angle = thread_angle, full = true );
      translate( [0, 0, -1] )
        cylinder( r = d/2, h = 2+pitch*(windings+1) );
    }
  }
}

