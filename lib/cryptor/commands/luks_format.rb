class LuksFormat < ShellCommand

  def initialize(keyfile, ld)
      @description = "Format LUKS partition"
      @command = "#{CRYPTSETUP_BASE} --key-file #{keyfile} luksFormat #{ld}"
  end

end
