Before do
  @dirs ||= ['tmp/aruba/dotfiles']
  @home_dir = File.expand_path File.join(current_dir, "..")

  @_origin_home = ENV["HOME"]
  ENV["HOME"] = @home_dir

  FileUtils.rm_rf(@home_dir)
  FileUtils.mkdir_p(@home_dir)

  #rbx and jruby are too slow on travis, let's see how slow it is
  @aruba_timeout_seconds = 30
end

After do
  ENV["HOME"] = @_origin_home
end

