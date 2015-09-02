# coding: utf-8

require 'open-uri'
require 'fileutils'
require 'mkmf'

module MakeMakefile::Logging
  @logfile = File::NULL
end

module Thunderbuddies
  class Image
    def initialize(location, image_base_dir)
      @location  = location
      @date      = Time.now
      @datetime = @date.strftime("%Y%m%d%H%M").to_i / 10 * 10
      @image_dir = get_image_dir(image_base_dir)
      @image     = get_image_fname
    end
    
    def get_image_fname
      fname    = "thunderbuddies-#{@datetime}.png"
      File.join(@image_dir, fname)
    end
    
    def get_image_dir(image_base_dir)
      year     = @date.strftime("%Y")
      month    = @date.strftime("%m")
      day      = @date.strftime("%d")
      File.join(image_base_dir, year, month, day)
    end
    
    def get_thunder_level
      get_image(thunder_url)
      check_image
    end
    
    def thunder_url
      "#{base_url}/#{get_location_code}/#{@datetime}-01.png"
    end

    def base_url
      "http://www.jma.go.jp/jp/radnowc/imgs/thunder"
    end
    
    def get_location_code
      "210" # Mishima
    end
    
    def get_image(url)
      create_dir(@image_dir)
      save_image(url)
    end
    
    def create_dir(dirpath)
      FileUtils.mkdir_p(dirpath) if !File.exist?(dirpath)
    end
    
    def save_image(url)
      open(@image, 'wb') do |output|
        open(url) do |data|
          output.write(data.read)
        end
      end
    rescue OpenURI::HTTPError
      exit 1
    end
    
    def check_image
      cropped_image = convert_image
      image_info    = identify_image(cropped_image)
      evaluate(image_info)
    end
    
    def convert_image
      raise if !find_executable('convert')
      cropped_image = "#{@image}.cropped.png"
      `convert -crop 50x50+300+100 #{@image} #{cropped_image}`
      cropped_image
    end
    
    def identify_image(cropped_image)
      raise if !find_executable('identify')
      `identify -verbose #{cropped_image} | grep Histogram -A 10 | grep -E '#FAF500|#FF2800|#FFAA00|#C800FF'`
    end
    
    def evaluate(image_info)
      case image_info
      when /#C800FF/
        4
      when /#FFAA00/
        3
      when /#FF2800/
        2
      when /#FAF500/
        1
      else
        0
      end
    end
  end
end
