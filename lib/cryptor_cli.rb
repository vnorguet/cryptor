require "loggable"
require "cryptor/action_wrapper"

class CryptorCli < Thor
  include Loggable

  desc "create CONTAINER KEY SIZE","Create a new CONTAINER of SIZE and encrypt with given KEY"
  def create(container, key, size)
    container = Cryptor::ActionWrapper.new(container)
    container.create_container(key, size)
  end

  desc "mount CONTAINER KEY", "Descrypt and mount the CONTAINER with givent KEY"
  def mount(container, key)
    container = Cryptor::ActionWrapper.new(container)
    container.mount(key)
  end

  desc "unmount CONTAINER", "Unmount CONTAINER and cleanup"
  def unmount(container)
    container = Cryptor::ActionWrapper.new(container)
    container.unmount
  end
end
