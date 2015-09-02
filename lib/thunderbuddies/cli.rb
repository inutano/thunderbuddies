# coding: utf-8

require 'thor'

module Thunderbuddies
  class CLI < Thor
    desc "level [LOCATION] [IMAGEDIR]", "Get the level of thunder 0-4 at LOCATION"
    def level(location="Mishima", dir="/tmp")
      puts Thunderbuddies::Image.new(location, dir).get_thunder_level
    end
    
    desc "halt [LEVEL] [LOCATION] [IMAGEDIR]", "Shutting down the computer if the thunder level is equal to LEVEL or higher"
    def halt(level=4, location="Mishima", dir="tmp")
      Thunderbuddies::System.halt(level, location, dir)
    end
  end
end
