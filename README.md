# The Free Music Archive Ruby Gem

A Ruby wrapper for the Free Music Archive API

## Installation

Add this line to your application's Gemfile:

    gem 'freemusicarchive'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install freemusicarchive

## Usage Examples

See the [API Docs](http://freemusicarchive.org/api/docs/) for more information

    require "rubygems"
    require "freemusicarchive"
    
    # All methods require authentication by api key.
    FreeMusicArchive.configure do |config|
      config.api_key = YOUR_API_KEY
    end
    
    # Get a list of all curators
    puts FreeMusicArchive.curators
    
    # Get a list of all genres sorted by genre_id
    puts FreeMusicArchive.genres(:sort_by => "genre_id")
    
    # Get a list of 10 artists
    puts FreeMusicArchive.artists(:limit => 10)
    
    # Get a list albums by Arcade Fire
    puts FreeMusicArchive.albums(:artist_handle => "Arcade_Fire")
    
    # Get a list of tracks that are permitted for commercial and remix purposes
    puts FreeMusicArchive.tracks(:commercial => true, :remix => true)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
