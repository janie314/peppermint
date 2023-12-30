class Ruby
  def cp
    [".solargraph.yml", ".rubocop.yml", ".standard.yml", ".rspec",
      ".ruby-version"].each do |filename|
      FileUtils.cp (File.expand_path File.join __dir__, "..", "..", "..", filename), Dir.pwd
    end
  end
end
