use <lib/pipe.scad>
use <fittings.scad>

$fn = 100;

heater_joint();

module heater_joint (
  heater_joint_d = 3,
  heater_joint_D = 8,
  heater_joint_height = 11,
  heater_joint_pitch = 0.9407,
  bridge_height = 7,
  stop_height = 11,
  stop_D = 20,
  exit_joint_d = 7,
  exit_joint_D = 16.3,
  exit_joint_pitch = 1.4111,
  exit_joint_height = 14,
) {

  union() {
    // heater joint
    male_fitting(
      pitch = heater_joint_pitch,
      thread_angle = 27,
      D = heater_joint_D,
      d = heater_joint_d,
      height = heater_joint_height
    );

    translate([0, 0, heater_joint_height]){

    // bridge
    pipe(
      h = bridge_height,
      d1 = heater_joint_d,
      D1 = heater_joint_D,
      d2 = exit_joint_d,
      D2 = stop_D - 3
    );

    // stop
    translate([0, 0, bridge_height]){
    pipe(
      h = stop_height,
      d = exit_joint_d,
      D = stop_D,
      sides= 6
    );

    //exit joint
    translate([0, 0, stop_height])
    male_fitting(
      pitch = exit_joint_pitch,
      thread_angle = 27,
      D = exit_joint_D,
      d = exit_joint_d,
      height = exit_joint_height
    );
    }
    }
  }
}
