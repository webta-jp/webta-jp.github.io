###
# Lib
###
require "lib/basic_helpers"
helpers BasicHelpers

###
# Blog settings
###
#set :site_title, "Site name"
Time.zone = "Tokyo" # Time.zone = "UTC"
activate :settings
activate :blog do |blog|
  blog.prefix = "posts"
  blog.taglink = "tags/{tag}.html"
  blog.layout = "post"
  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"
  blog.summary_separator = /(続きを読む)/
  blog.summary_length = 140
  # blog.permalink = "{year}/{month}/{day}/{title}.html"
  # Matcher for blog source files
  #blog.sources = "{year}-{month}-{day}-{title}.html"
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html" 
  blog.default_extension = ".md"

  # Enable pagination
  blog.paginate = true
  blog.per_page = 10
  blog.page_link = "page/{num}"
end

page '/*', layout: 'main'
page '/', layout: 'top'
page "/test.html", layout: 'test'
page "/feed.xml", layout: false
#with_layout :plain do
#  page '/views'
#end

###
# Compass
###
# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###
# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", layout: false
#
# With alternative layout
# page "/path/to/file.html", layout: :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do
  activate :minify_css # For example, change the Compass output style for deployment
  activate :minify_javascript # Minify Javascript on build
  activate :asset_hash # Enable cache buster
  activate :relative_assets
  # Use relative URLs
  # activate :relative_assets
  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

after_configuration do
  sprockets.append_path "#{root}/components/"
end

set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'
set :fonts_dir, 'assets/fonts'
set :relative_links, true
set :slim, { :pretty => true, :sort_attrs => false, :format => :html }
set :markdown_engine, :redcarpet
set :markdown, :tables => true, :autolink => true, :gh_blockcode => true,
    :fenced_code_blocks => true, :with_toc_data => true, :smartypants => true,
    no_intra_emphasis: true, space_after_headers: true, hard_wrap: true
activate :syntax, :line_numbers => true
#activate :autoprefixer, browsers: ['last 2 versions', 'ie 9']
#activate :disqus do |d|
#  d.shortname = 'kntmrkm-new' # Replace with your Disqus shortname.
#end

###
# Deploy
###
activate :deploy do |deploy|
  deploy.build_before = true
  deploy.method = :git
  deploy.branch = 'master'
end

###
# Helpers
###
activate :automatic_image_sizes # Automatic image dimensions on image_tag helper
activate :livereload # Reload the browser automatically whenever files change
#activate :compass


