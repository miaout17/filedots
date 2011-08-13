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

      target ||= "#{ENV['HOME']}/.#{source}"
      source = "#{Dir.pwd}/#{source}"

      @links << [source, target]
    end

  end
end
