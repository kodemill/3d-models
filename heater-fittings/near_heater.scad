use <lib/Threading.scad>
use <lib/pipe.scad>


$fn = 44;

for (i=[0:2]) {
  D = 8.1+i*.1;
  translate( [i*20, 0, 0] ) {
    heater_joint( d = 3, D = D );
    %translate( [-7, 10, 0] ) text(str(D));
  }
}

module heater_joint (
  d = 3,
  D = 8
) {
  male_height = 11;
  stop_height = 11;
  union() {
    male( d = d, D = D, height = male_height, pitch = 1.2 );
    translate( [0, 0, male_height-1] )
      pipe(d = d, D = 12, height = stop_height);

    translate( [0, 0, stop_height+male_height*2-2] ) rotate( [180] )
      male( d = d, D = D, height = male_height, pitch = 1.2 );
  }
}

module pipe (
  d = 6,
  D = 10,
  height = 10
) {
  difference () {
    cylinder( r = D/2, h = height );
    translate( [0, 0, -1] ) cylinder( r = d/2, h = 2+height );
  }
}

module male (
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
  translate( [0, 0, height] )
  rotate( [180] )
  difference () {
    threading( pitch = pitch, d = D, windings = windings, angle = thread_angle, full = true );
    translate( [0, 0, -1] ) cylinder( r = d/2, h = 2+height );
  }
}

module female (
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
  Threading( pitch = pitch, D = D, d = d, windings = windings, angle = thread_angle );
}
