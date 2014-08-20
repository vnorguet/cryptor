class RmDir < ShellCommand
  def initialize(container_name)
    mount_path = File.join('/media', container_name)
    @description = "Unmount #{mount_path}"
    @command = "rmdir #{mount_path}"
  end

end
