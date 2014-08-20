class LuksClose < ShellCommand
  def initialize(fs_name)
    @description = "Closing LUKS #{fs_name}"
    @command = "cryptsetup luksClose /dev/mapper/#{fs_name}"
  end

end
