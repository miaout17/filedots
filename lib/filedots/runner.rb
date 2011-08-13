require 'thor'

module Filedots
  class Runner < Thor
    include Thor::Actions

    desc 'install', 'Install dotfiles'
    def install
      return unless load_config
      @config.links.each do |source, target|
        link(source, target)
      end
    end

    desc 'uninstall', 'Uninstall dotfiles'
    def uninstall
      return unless load_config
    end

    no_tasks do
      def load_config
        @config = Config.new
        @config.instance_eval(File.read('.filedots'))
        true
      end

      def link(source, target)
        if File.exists?(target)
          if File.identical?(source, target)
            say_status :identical, target
          else
            link!(source, target) if yes?("Overwrite #{target}?")
          end
        else
          link!(source, target)
        end
      end

      def link!(source, target)
        run "ln -sfn #{source} #{target}"
      end

      def unlink(target)
      end

    end
  end
end
