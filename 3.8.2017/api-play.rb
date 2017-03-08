require "net/http"
require "json"
require "openssl"


class ITunes
  def self.search(artist)
    artist = artist.split(" ").join"+"
    uri = URI("https://itunes.apple.com/search?term=#{artist}")

    response = Net::HTTP.get(uri)

    json = JSON.parse(response)

 	ary=[]
 	i = 0

    5.times do
    	ary << ["Track Name: " + json["results"][i]["trackName"]]
    	ary << ["Track ID: " + json["results"][i]["trackId"].to_s]
    	i += 1	
    end
    ary
  end
end

p ITunes.search("grateful dead")

