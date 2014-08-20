class CreateMountPoint < ShellCommand

  def initialize(container_name)
    mount_path = File.join('/media', container_name)
    @description = "Create mount point #{mount_path}"
    @command = "mkdir -p #{mount_path}"
  end

end
