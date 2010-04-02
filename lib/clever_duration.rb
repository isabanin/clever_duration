def require_local(suffix)
  require(File.expand_path(File.join(File.dirname(__FILE__), suffix)))
end

require_local 'clever_duration/clever_duration'