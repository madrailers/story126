def current_user(stubs = {})
  @current_user ||= mock_model(User, stubs)
end

def user_session(stubs = {}, user_stubs = {})
  @current_session ||= mock_model(UserSession, {:user => current_user(user_stubs)}.merge(stubs))
end

def al_login(session_stubs = {}, user_stubs = {})
  UserSession.stub!(:find).and_return(user_session(session_stubs, user_stubs))
end

def al_admin(session_stubs = {}, user_stubs = {})
  UserSession.stub!(:find).and_return(user_session(session_stubs, user_stubs.merge(:login => "admin")))
end

def logout
  @user_session = nil
end