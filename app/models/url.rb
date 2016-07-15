class Url < ActiveRecord::Base

  validates_uniqueness_of :short_url

  def shorten_url
    # generate a shortest string
    try = true
    while(try) do
      self.short_url = shortest_string
      try = !self.save
    end
  end

  def shortest_string
    # fetch all urls
    urls = Url.all
    # find max char length for short_url
    max_char = urls.max {|u| u.short_url.length}
    # assign 
    max_char = max_char.short_url ? max_char.short_url.length : 1
    short_url = ( ('a'..'z').to_a + (0..9).to_a + ('A'..'Z').to_a ).shuffle.first(max_char).join
  end
end
