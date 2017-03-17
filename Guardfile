guard :rspec, cmd: "bin/rspec" do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^app/routes/(.+)\.rb$}) { |m| "spec/api/#{m[1]}_spec.rb" }
  watch(%r{^app/models/(.+)\.rb$}) { |m| "spec/models/#{m[1]}_spec.rb" }
  watch(%r{^lib/(.+)\.rb$}) { |m| "spec/lib/#{m[1]}_spec.rb" }

  # Notifications
  notification :terminal_notifier, app_name: "SinatraApp ::", activate: 'com.googlecode.iTerm2' if `uname` =~ /Darwin/
end
