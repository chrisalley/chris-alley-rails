module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end
  
  def markdown_to_html(markdown_text)
    require 'kramdown'
    require 'sanitize'

    # Converts remaining Markdown syntax to html tags using Kramdown.
    html = Kramdown::Document.new(markdown_text, auto_ids: false).to_html
    
    # Sets up whitelist of html elements, attributes, and protocols that are allowed.
    allowed_elements = ['h2', 'h3', 'a', 'p', 'ul', 'ol', 'li', 'strong', 'em', 'cite', 
      'blockquote', 'code', 'pre', 'dl', 'dt', 'dd', 'br', 'hr', 'sup']
    allowed_attributes = {'a' => ['href', 'rel', 'rev', 'class'],
      'sup' => ['id'], 'li' => ['id'], 'h2' => ['id'], 'h3' => ['id']}
    allowed_protocols = {'a' => {'href' => ['#fn', '#fnref', 'http', 'https', 'mailto', :relative]}}
    
    # Cleans text of any unwanted html tags.
    Sanitize.clean(html, elements: allowed_elements, attributes: allowed_attributes, 
      protocols: allowed_protocols)
  end
end
