class ShellCommand
  include ::Loggable

  CRYPTSETUP_BASE="cryptsetup -c serpent-cbc-essiv:sha256 --batch-mode"

  def execute(simulate = false)
    if simulate
      puts @command
    else
      logger.info @description
      code = system "#{@command} 2>/dev/null"

      if code
        logger.debug @command
      else
        # Use @command pattern + memorizable to be able to rollback
        logger.error @command
        exit
    end
  end
end

def undo
end

end
