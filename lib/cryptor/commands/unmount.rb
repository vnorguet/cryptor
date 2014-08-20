class Unmount < ShellCommand

  def initialize(container_name)
    mount_path = File.join('/media', container_name)
    @description = "Unmounting mount_path"
    @command = "umount #{mount_path}"
  end

end
