require "opal"

Opal.append_paths(
  "./lib",
  "/Users/jacobevelyn/.gem/ruby/2.3.0/gems/memoist-0.14.0/lib",
  "/Users/jacobevelyn/.gem/ruby/2.3.0/gems/paint-1.0.1/lib"
)
File.binwrite "friends-opal.js", Opal::Builder.build("friends").to_s
