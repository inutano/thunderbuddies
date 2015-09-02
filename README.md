# Thunderbuddies

[![thunderbuddies](http://img.youtube.com/vi/G9PnNW56bp0/0.jpg)](http://www.youtube.com/watch?v=G9PnNW56bp0)

Thunderbuddies are powerful tools to protect your server from blackout by thunders. Thunderbuddies tell your computer that a thunderstorm is coming and shut it down before it crashes. Please read the usage below carefully since currently features are limited.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'thunderbuddies'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install thunderbuddies

## Usage

Use an executable `thunderbuddies` to check the level of the thunder alert or to shut your computer down immediately if you are scared of it.

You can specify two arguments for `thunderbuddies level`, the first is for the name of your location and the last for the path to the directory to save the image of the thunder forecast.

```ruby
thunderbuddies level Tokyo $HOME/tmp
```

**WARNING**: Currently this is the experimental, so you can specify your location but it is ignored. If a thunder is coming to Mishima, where the [largest supercomputer system for the genomic science in Japan](http://sc.ddbj.nig.ac.jp/) is located, your computer will be shutting down regardless the weather on your location. I appreciate your sympathy.

You can also specify three arguments for `thunderbuddies halt`; threshold of the alert level, your location, and the path to the directory to save the image. You need to run this command with root permission to access the shutdown command.

```ruby
sudo thunderbuddies halt 4 Asgard $HOME/tmp
```

**WARNING AGAIN**: You do not have to worry about specifying your location. When our supercomputer system in Mishima goes down, your computer will follow no matter how good the weather is on your place. 

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/inutano/thunderbuddies.

