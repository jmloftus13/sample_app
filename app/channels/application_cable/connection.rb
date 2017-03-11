#code here runs before the connection between user & server is established.
module ApplicationCable
  class Connection < ActionCable::Connection::Base

    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    def disconnect

    end

    protected

    def find_verified_user
    	#env variable about the user
      if verified_user = request.env['warden'].user
        verified_user
      else
        reject_unauthorized_connection
      end
    end
  
  end
end
