const std = @import("std");
const ztb = @import("zt/build.zig");

pub fn build(b: *std.build.Builder) void {
    const target = b.standardTargetOptions(.{
        .default_target = .{ .abi = std.Target.Abi.gnu }, // Lets avoid MSVC on windows :')
    });
    const mode = b.standardReleaseOptions();

    const exe = b.addExecutable("Application", "src/main.zig");
    exe.setTarget(target);
    exe.setBuildMode(mode);
    ztb.link("zt/", b, exe, target);
    exe.install();

    const run_cmd = exe.run();
    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);
}
