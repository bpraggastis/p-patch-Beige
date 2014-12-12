module ApplicationHelper
  def user_tagline
    if @current_user
      "Signed in as #{@current_user.username}"
    else
      render "layouts/signin_box"
    end
  end

  def link_to_post_new_article
    if @current_user && @current_user.is_admin?
      link_to("Post a New Article", new_article_path, {:class => "btn btn-default btn-xs", :role => "button"})
    else
      nil
    end
  end

  def sign_out_button
    @current_user ? button_to("Sign Out", destroy_path, :class => "btn btn-danger btn-xs", :method => "delete") : nil
  end

  def link_to_signin_as_admin
    @current_user && !@current_user.is_admin? ? button_to("Sign In As Admin", "#", :class => "pea-logo btn btn-default btn-xs") : nil
  end

  def signup_link
    @current_user ? nil : link_to("Create A Whirled Peas Account", new_user_path, :class => "pea-logo btn btn-default btn-xs")
  end

  def edit_account_info_button
    if @current_user
      link_to("Edit Account Information", edit_user_path(@current_user.id), class: "btn btn-xs btn-default pea-logo")
    else
      nil
    end
  end


end
