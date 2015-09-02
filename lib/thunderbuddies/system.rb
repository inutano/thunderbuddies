# coding: utf-8

module Thunderbuddies
  class System
    class << self
      def halt(level, location, dir)
        if emergency?(level, location, dir)
          shutdown
        else
          puts "Hey buddy, I'm OK.."
        end
      end
      
      def emergency?(level, location, dir)
        image = Thunderbuddies::Image.new(location, dir)
        current_level = image.get_thunder_level
        current_level >= level
      end
      
      def shutdown
        puts "shutting down in 5 seconds:"
        sleep 1
        puts "4"
        sleep 1
        puts "3"
        sleep 1
        puts "2"
        sleep 1
        puts "1"
        sleep 1
        puts "bye."
        `sudo shutdown -h now`
      end
    end
  end
end
