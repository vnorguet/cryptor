class FreeLoopDevice < ShellCommand
  attr_accessor :device

  def initialize
    @description = "Getting a free loop device"
    @device = %x[losetup -f][/(\w|\/)*/]
  end

end
