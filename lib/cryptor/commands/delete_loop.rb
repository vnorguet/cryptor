class DeleteLoop < ShellCommand
  def initialize(container_name)
    @description = "Deleting loop device"
    loop_device = %x[losetup -j #{container_name}].split(':')[0]
    @command = "losetup -d #{loop_device}"
  end

end
