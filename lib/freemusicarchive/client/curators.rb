module FreeMusicArchive
  class Client
    module Curators
      
      def curators(options={})
        get("/api/get/curators", options)
      end
      
    end
  end
end