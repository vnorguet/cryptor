class LuksOpen < ShellCommand

  def initialize(keyfile, loop_device, fs_name)
    @description = "Open LUKS container"
    @command = "#{CRYPTSETUP_BASE} --key-file #{keyfile} luksOpen #{loop_device} #{fs_name}"
  end

end
