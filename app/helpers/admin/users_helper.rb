module Admin::UsersHelper
  def admin_share_link(user)
    root_url + 'users/share/' + user.admin_link
  end
end
