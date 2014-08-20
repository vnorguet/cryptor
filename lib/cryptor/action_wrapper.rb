Dir[File.join('.',"lib/cryptor/**/*.rb")].each do |f|
  require f
end

module Cryptor
  class ActionWrapper
    include ::Loggable

    attr_accessor :container_name, :keyfile, :container_path

    def initialize(container_path)
      @container_path = container_path
      @container_name = File::basename("#{container_path}")
    end

    def create_container(keyfile, size_in_M)
      commands = []
      ensure_files_exists(keyfile)
      loop_dev = FreeLoopDevice.new
      logger.info "Generating file"
      commands << GenerateRandom.new(container_path, size_in_M)
      commands << MountLoop.new(loop_dev.device, container_path)
      commands << LuksFormat.new(keyfile, loop_dev.device)
      commands << LuksOpen.new(keyfile, loop_dev.device, fs_name)
      commands << MkfsFormat.new(fs_name)
      commands << CreateMountPoint.new(container_name)
      commands << Mount.new(fs_name, container_name)
      logger.info "Starting execution"
      commands.each { |cmd| cmd.execute }
    end

    def mount(keyfile)
      commands = []
      ensure_files_exists(container_path, keyfile)
      loop_dev = FreeLoopDevice.new
      commands << MountLoop.new(loop_dev.device, container_path)
      commands << LuksOpen.new(keyfile, loop_dev.device, fs_name)
      commands << CreateMountPoint.new(container_name)
      commands << Mount.new(fs_name, container_name)
      commands.each { |cmd| cmd.execute }
    end

    def unmount
      commands = []
      ensure_files_exists(container_path)
      commands << Unmount.new(container_name)
      commands << LuksClose.new(fs_name)
      commands << DeleteLoop.new(container_path)
      commands << RmDir.new(container_name)
      commands.each { |cmd| cmd.execute }
    end

    private

    def fs_name
      File::basename("#{container_name}fs")
    end

    def ensure_files_exists(*files)
      [*files].each do |f|
        if !File.exists?(f)
          throw "File '#{f}' does not exist"
          exit 1
        end
      end
    end

  end
end
