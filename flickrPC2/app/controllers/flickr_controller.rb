class FlickrController < ApplicationController
   def search
	FlickRaw.api_key = 'e8f5ecd7d935db1576a2c6203d95e186'
	FlickRaw.shared_secret = '1c2d026d5277681d'
	photos = flickr.photos.search(:tags=>params[:tags], :per_page => 24)
	@piece = render_to_string :partial => 'photo.text',
		:collection => photos.map{ |photo| {:square => FlickRaw.url_s(photo), :big => FlickRaw.url(photo) } }
   end
end
