def amazon_linux_info
  info = {
    :major_version => nil,
    :version       => nil,
    :init_package  => nil,
  }

  return info unless File.exist?("/etc/system-release")
  
  system_release = File.read("/etc/system-release")
      
  case system_release
  when /amazon\s+linux\s+release\s+2\s+\((20\d{2}\.\d{2})\)/i
    info[:major_version] = 2
    info[:version] = $1
  when /amazon\s+linux\s+ami\s+release\s+(20\d{2}\.\d{2})/i
    info[:major_version] = 1
    info[:version] = $1
  end

  info[:init_package] =
    case info[:major_version]
    when 2
      "systemd"
    when 1
      "init"
    end

  info
end

def create_objects
  amazon_linux Mash.new(amazon_linux_info)
end

Ohai.plugin(:AmazonLinux) do
  provides 'amazon_linux'

  collect_data(:linux) do
    create_objects
  end
end
