Before do
  @dirs ||= ['tmp/aruba/dotfiles']
  @home_dir = File.expand_path File.join(current_dir, "../home")
  FileUtils.rm_rf(@home_dir)
  FileUtils.mkdir_p(@home_dir)
end

After do
end

