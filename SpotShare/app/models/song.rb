require 'rspotify'

class Song < ApplicationRecord
  belongs_to :playlist

  def track
    RSpotify::Track.search("#{self.name} #{self.artist}", limit: 10, market: 'US').first
  end

  def track_url
    track.external_urls['spotify'].split('/').last
  end

  def track_duration
    @total_seconds = self.track.duration_ms / 1000
    @seconds = @total_seconds.modulo(60)
    @minutes = @total_seconds / 60
    "#{@minutes}:#{@seconds}"
  end

end
