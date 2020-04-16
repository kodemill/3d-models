    // translate( [0, 0, stop_height] )
  // cylinder ()
  // translate( [-R_pipe-R_male, 0, male_height-2] )
  // rotate( [90, 0, 0] )
  //   emptyLoop(
  //     cr=R_pipe,
  //     rin=d_male/2,
  //     rout=R_male,
  //     angle=90,
  //     $step=1
  //   );

  // female( d=D_male, D=D_male+4, height=male_height, pitch=1.2 );

cube([1, 1, 1]);
