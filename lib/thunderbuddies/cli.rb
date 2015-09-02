# coding: utf-8

require 'thor'

module Thunderbuddies
  class CLI < Thor
    desc "level LOCATION IMAGEDIR", "get thunder level 0-4 at LOCATION"
    def level(location, dir)
      puts Thunderbuddies::Image.new(location, dir).get_thunder_level
    end
  end
end
