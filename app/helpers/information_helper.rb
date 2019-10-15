module InformationHelper
  def information_author(information)
    user_signed_in? && current_user.id == information.user_id
  end
end
