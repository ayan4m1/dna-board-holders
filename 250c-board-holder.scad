$fn = 64;

include <lib/Triangles.scad>;

holder_dims = [65.7, 22.5, 6.1];
holder_rounding = 4;

top_cutout = [12.3, 11];

board_cutout = [65.7, 20.6, 1.5];

board_second_cutout = [65.7, 19.6, 1.5];

screen_cutout = [28.5, 16.75, 2.25];

screen_bridge_cutout = [5, 12, 5];

screen_inset = 2;

screen_bridge_offset = ((screen_cutout[0] - (screen_bridge_cutout[0] * 3)) / 2) - screen_inset;

button_cutout = [21, 8.75, 5];

usb_cutout = [1.85, 0, 5];

usb_second_cutout = [1.4, 11, 5];

screw_diameter = 1.6;

difference() {
union() {
    difference() {
        translate([holder_rounding, holder_rounding, 0]) linear_extrude(holder_dims[2]) offset(holder_rounding) square([holder_dims[0] - holder_rounding * 2, holder_dims[1] - holder_rounding * 2]);

        translate([0, (holder_dims[1] - top_cutout[1]) / 2, 0]) linear_extrude(holder_dims[2]) square(top_cutout);

        translate([0, (holder_dims[1] - board_cutout[1]) / 2, holder_dims[2] - board_cutout[2]]) cube(board_cutout);

        translate([5, (holder_dims[1] - board_second_cutout[1]) / 2, holder_dims[2] - board_cutout[2] - board_second_cutout[2]]) cube(board_second_cutout);

        translate([12.3, (holder_dims[1] - screen_cutout[1]) / 2, 0]) cube(screen_cutout);

        translate([40, (holder_dims[1] - button_cutout[1]) / 2, 0]) cube(button_cutout);

        translate([40 + button_cutout[0] + usb_cutout[0], (holder_dims[1] - usb_cutout[1]) / 2, 0]) rotate([0, 0, 90]) Trapezoid(b = 11, H = 1.85, height = 5, angle = 60);

        translate([40 + button_cutout[0] + usb_cutout[0], (holder_dims[1] - usb_second_cutout[1]) / 2, 0]) cube(usb_second_cutout);

        for (i = [0 : 2]) {
            translate([12.3 + screen_inset + ((screen_bridge_offset + screen_bridge_cutout[0]) * i), (holder_dims[1] - screen_bridge_cutout[1]) / 2, 0]) cube(screen_bridge_cutout);
        }
    }

    translate([57.3, 3.4, holder_dims[2] - board_cutout[2] - .75]) cube([5, 5, 1.5], center = true);
}
translate([3, 3, 0]) cylinder(d = screw_diameter, h = holder_dims[2]);

translate([3, holder_dims[1] - 3, 0]) cylinder(d = screw_diameter, h = holder_dims[2]);

translate([57.3, 3.4, 0]) cylinder(d = screw_diameter, h = holder_dims[2]);
}
