require 'thor'

module Filedots
  class Runner < Thor
    desc 'install', 'Install dotfiles'
    def install
      load_spec
    end

    desc 'uninstall', 'Uninstall dotfiles'
    def uninstall
      load_spec
    end

    no_tasks do
      def load_spec
        @spec = Spec.new
        Spec.instance_eval(File.read('filedots.rb'))
      end
    end
  end
end
