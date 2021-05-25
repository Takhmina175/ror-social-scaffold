module UserHelper
  def user_gravatar(user, size = 32)
    gravatar_id = Digest::MD5.hexdigest(user.email.to_s.downcase)
    gravatar_url = "http://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: 'profile-pic rounded-circle')
  end

  def notification(user)
    user.pending_friends.count + user.requested_friends.count
  end
end
