module ApplicationHelper
  def full_title(page_title) 
  	base_title = "Atlas China"
  	if page_title.empty?
  		base_title
  	else
  		"#{base_title} | #{page_title}"
  	end
  end

  def thinstripe(stripe_class, text)
    stripe = <<-Q
      <div class="#{stripe_class}">
        <div class="overlay">
          <div class="container">
            <div class="row">
              <div class="span12">
                <div class="profile_header">
                  <h2>#{text}</h2>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    Q
    stripe.html_safe
  end
end