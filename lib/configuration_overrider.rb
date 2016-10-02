class ConfigurationOverrider

  def self.overrides(section)
    new(section).send(:overrides)
  end

  private

  def initialize(section)
    @section = section
  end

  def overrides
    custom_yaml if File.exist?(config_file)
  end

  def config_file
    "#{ENV['HOME']}/.config/joinify/config.yml"
  end

  def rendered_yaml
    YAML.load(ERB.new(File.read(config_file)).result)['joinify'][@section]
  end

  def custom_yaml
    # N.B. The rendered YAML always starts with --- signaling the beginning of a
    # new document, so we have to cut that off for this trick to work.
    rendered_yaml.to_yaml.gsub(/^---\n/, '')
  end
end
