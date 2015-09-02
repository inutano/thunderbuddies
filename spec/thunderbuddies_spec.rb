require 'spec_helper'

describe Thunderbuddies do
  it 'has a version number' do
    expect(Thunderbuddies::VERSION).not_to be nil
  end

  it 'returns a valid and reachable url of the thunder alert' do
    tb = Thunderbuddies::Image.new("Asgald", "/tmp")
    expect(tb.thunder_url).not_to be false
  end
  
  it 'saves an image to the specified directory' do
    tb = Thunderbuddies::Image.new("Jotunheim", "/tmp")
    tb.get_image(tb.thunder_url)
    expect(File).to exist(tb.image)
  end
end
