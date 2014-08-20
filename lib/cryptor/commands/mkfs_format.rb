class MkfsFormat < ShellCommand

  def initialize(fs_name)
    @description = "Format partition in ext4 format"
    @command = "mkfs.ext4 -q /dev/mapper/#{fs_name}"
  end

end
