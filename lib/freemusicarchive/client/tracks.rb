module FreeMusicArchive
  class Client
    module Tracks
      
      def tracks(options={})
        get("/api/get/tracks", options)
      end
      
    end
  end
end