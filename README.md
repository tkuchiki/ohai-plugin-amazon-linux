# ohai-plugin-amazon-linux

Ohai plugin for Amazon Linux

# Usage

## ohai command

```console
# Amazon Linux 1
$ ohai -d /path/to/plugin/dir | jq .amazon_linux
{
  "major_version": 1,
  "version": "2017.09",
  "init_package": "init"
}

# Amazon Linux 2
$ ohai -d /path/to/plugin/dir | jq .amazon_linux
{
  "major_version": 2,
  "version": "2017.12",
  "init_package": "systemd"
}
```

## chef

```ruby
# (client|knife|solo).rb
Ohai::Config[:plugin_path] << '/path/to/plugins'
```

```ruby
# in cookbook
node[:amazon_linux][:major_version]
node[:amazon_linux][:version]
node[:amazon_linux][:init_package]
```
