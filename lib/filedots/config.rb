module Filedots
  class Config

    attr_accessor :links

    def initialize
      @links = []
    end

    def link(source, target=nil)
      target ||= ".#{source}"
      @links << [source, target]
    end

    def links(*sources)
      sources.each { |s| link(s) }
    end

  end
end
