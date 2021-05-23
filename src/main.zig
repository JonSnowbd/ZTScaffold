const std = @import("std");
const zt = @import("zt");
usingnamespace @import("imgui");
usingnamespace zt.imguiComponents;

var config: zt.app.ZTLAppConfig = .{
    .init = init,
    .update = update,
    .deinit = deinit,
};

fn init() void {
    // Enable docking.
    var io = igGetIO();
    io.*.ConfigFlags |= ImGuiConfigFlags_DockingEnable;
}
fn update() void {
    if(igBegin("Welcome", null, ImGuiWindowFlags_None)) {
        igText("Welcome to the ZT Framework!\nEdit src/main.zig and get going!");
    }
    igEnd();

    if(igBegin("Dock Window", null, ImGuiWindowFlags_None)) {
        igText("Docking me!");
    }
    igEnd();
}
fn deinit() void {
}

pub fn main() void {
    zt.app.start(config);
}