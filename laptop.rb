brews = File.readlines(File.expand_path '../brews.lst', __FILE__)
brews.each { |c| dep "#{c.strip}.managed" }
casks = File.readlines(File.expand_path '../casks.lst', __FILE__)
casks.each { |c| dep "#{c.strip}.cask" }

dep 'laptop' do
  brews.each { |c| requires "#{c.strip}.managed" }
  casks.each { |c| requires "#{c.strip}.cask" }
  requires 'alfred cask integration'

  requires 'sporkd:osx computer name set'.with computer_name: 'rabi', local_hostname: 'rabi'

  requires 'vim'
end
