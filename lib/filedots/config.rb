module Filedots
  class Config

    attr_accessor :links

    def initialize
      @links = []
    end

    def link(source, target=nil)
      if source.is_a?(Array)
        source.each { |s| link(s) }
        return
      end

      target ||= "~/.#{source}"
      target = File.expand_path(target)
      source = File.expand_path("#{Dir.pwd}/#{source}")

      @links << [source, target]
    end

  end
end
