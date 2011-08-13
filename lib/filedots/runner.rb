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
      @config.links.each do |source, target|
        unlink(target)
      end
    end

    no_tasks do
      def load_config
        @config = Config.new
        @config.instance_eval(File.read('.filedots'))
        true
      end

      def link(source, target)
        if File.exists?(target)
          # TODO: This is not accuracy.
          # Check the link, make some test cases....when I have more free time :)
          if File.identical?(source, target)
            say_status :identical, target
          else
            link!(source, target) if yes?("Overwrite #{target}?", :red)
          end
        else
          link!(source, target)
        end
      end

      def link!(source, target)
        File.unlink(target) if File.exists?(target)
        File.symlink(source, target)
        say_status :symlink, "#{source} #{target}"
      end

      def unlink(target)
        # TODO: Alert if it's not symlink?
        if File.exists?(target)
          File.unlink(target)
          say_status :unlink, target
        else
          say_status :nonexist, target
        end
      end
    end
  end
end
