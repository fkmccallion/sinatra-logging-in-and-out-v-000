class Helpers
  def self.current_user(session_hash)
    @user = User.find(session_hash[:user_id])
    @user
  end

  def self.is_logged_in?(session_hash)
    #if session_hash[:user_id] == nil
    #  false
    #else
    #  true
    #end
    !session[:user_id].nil?
  end
end
