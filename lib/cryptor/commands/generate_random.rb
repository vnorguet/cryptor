class GenerateRandom < ShellCommand

  def initialize(container_name, size_in_M)
    @description = "Generate random data"
    @command = "dd if=/dev/urandom of=#{container_name} bs=#{size_in_M}M count=10 2>/dev/null"
  end

end
