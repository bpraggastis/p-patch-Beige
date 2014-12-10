module ApplicationHelper
  def user_tagline
    if @current_user
      "Signed in as #{@current_user.username}"
    else
      '<div id="choices-for-signing-in" class="white">
      <div id="wp">SIGN IN WITH:&nbsp'.html_safe+
      link_to(image_tag("twitter_32.png", class: "twitter-bird img-circle"), "/auth/twitter")+
      '<span >&nbspOR&nbsp</span>
      <span class="pea-logo btn btn-default btn-sm">
      Whirled Peas
      </span>
      </div>
      <div id="sign-in" class = "">'.html_safe+
      form_tag("/sessions/create") do
        '<ul class = "list-unstyled list-inline">
        <li>'.html_safe+ text_field_tag(:username , nil, placeholder: "Username", class: "pea-color")+'</li>
        <li>'.html_safe+ password_field_tag(:password, nil, placeholder: "Password", class: "pea-color")+'</li>
        <li><span >'.html_safe+ submit_tag("Sign In With Whirled Peas", :class => "pea-logo btn btn-default btn-xs") + '</span></li>
        </ul>'.html_safe
        end+'</div>'.html_safe
    end
  end
end
