$fa = 1;
$fs = 0.4;
$fn = 100;

pipe_thickness = 30.00;

pipe_attachement_thickness = 8.00;
pipe_attachement_height = 30.00;

ear_x = 30;
ear_y = 15;
ear_z = 20;

height = 50.00;
length = 80.00;

arm_thickness = 20.00;

angle = 50.00;

module pipe_solid_angle()
{
    hyp =  pipe_attachement_height / sin(angle);
    xl = cos(angle) * hyp;
    hull(){
        cylinder(d=pipe_attachement_thickness+pipe_thickness, h=pipe_attachement_height, center=true);
        translate([0, xl+(pipe_attachement_thickness+pipe_thickness)/2, - pipe_attachement_height/2]) rotate ([180]) rotate ([0, 90, 0])
        linear_extrude(arm_thickness, center=true)
            polygon([[0,0],[0, xl], [pipe_attachement_height,xl]]);
    }
    //rotate([90-angle, 0, 0]) translate([0, (pipe_attachement_thickness+pipe_thickness)/2, 0]) cube([arm_thickness, arm_thickness*2, arm_thickness]);
}


module pipe_solid()
{
    hull() {
        cylinder(d=pipe_attachement_thickness+pipe_thickness, h=pipe_attachement_height, center=true);
        translate([(pipe_attachement_thickness+pipe_thickness)/2, 0, 0]) cube([ear_x, ear_y, ear_z], center=true);
        translate([(-pipe_attachement_thickness+pipe_thickness)/2-ear_x, 0, 0]) cube([ear_x, ear_y, ear_z], center=true);
    }
}

module pipe_holder()
{
    difference()
    {
        pipe_solid();
        cylinder(d=pipe_thickness, h=pipe_attachement_height*2, center=true);
    }
}

//pipe_holder();
//pipe_solid();
pipe_solid_angle();
