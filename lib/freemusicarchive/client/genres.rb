module FreeMusicArchive
  class Client
    module Genres
      
      def genres(options={})
        get("/api/get/genres", options)
      end
      
    end
  end
end