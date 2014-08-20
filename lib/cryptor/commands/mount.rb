class Mount < ShellCommand

  def initialize(fs_name, container_name)
    mount_path = File.join('/media', container_name)
    @description = "Mounting #{fs_name} on #{mount_path}"
    @command = "mount /dev/mapper/#{fs_name} #{mount_path}"
  end

end
