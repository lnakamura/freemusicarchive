module FreeMusicArchive
  class Client
    module Albums
      
      def albums(options={})
        get("/api/get/albums", options)
      end
      
    end
  end
end