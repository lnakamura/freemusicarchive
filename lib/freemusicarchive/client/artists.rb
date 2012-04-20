module FreeMusicArchive
  class Client
    module Artists
      
      def artists(options={})
        get("/api/get/artists", options)
      end
      
    end
  end
end