{ pkgs, ... }:

{
  virtualisation.docker.enable = true;

  # Windows VM for Revit and other Windows-only applications.
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = false;
      swtpm.enable = true;
    };
  };

  virtualisation.spiceUSBRedirection.enable = true;
  programs.virt-manager.enable = true;

  users.users.krosh.extraGroups = [
    "docker"
    "kvm"
    "libvirtd"
  ];
}
