require 'thor'

module Filedots
  class Runner < Thor
    desc 'install', 'Install dotfiles'
    def install
      load_config
    end

    desc 'uninstall', 'Uninstall dotfiles'
    def uninstall
      load_config
    end

    no_tasks do
      def load_config
        @config = Spec.new
        Config.instance_eval(File.read('filedots.rb'))
      end
    end
  end
end
