class MountLoop < ShellCommand

  def initialize(loop_device, container_name)
    @description = "Mount loop point"
    @command = "losetup #{loop_device} #{container_name}"
  end

end
