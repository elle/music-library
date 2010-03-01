require 'spec/rake/spectask'

task :default => :test
task :test => :spec

if !defined?(Spec)
  puts "spec targets require RSpec"
else
  desc "Run all examples"
  Spec::Rake::SpecTask.new('spec') do |t|
    t.spec_files = FileList['spec/**/*.rb']
    t.spec_opts = ['-cfs']
  end
end

namespace :db do
  desc 'Auto-migrate the database (destroys data)'
  task :migrate => :environment do
    DataMapper.auto_migrate!
  end

  desc 'Auto-upgrade the database (preserves data)'
  task :upgrade => :environment do
    DataMapper.auto_upgrade!
  end
  
  desc 'Bootstraps the database'
  task :bootstrap => :environment do
    [ ['Davison, Archibald T and Apel, Willi', 'Harvard University Press', 'Cambridge, Massachusetts', 1949, 4, 'First title', 'Historical Anthology of Music: Oriental, Medieval and Renaissance Music', 'Anthology'],
      ['Schering, Arnold', 'Veb Brietkopf & Hartel Muskverlag', 'Leipzig', 1931, 1, '2nd title', 'Geschiecte Der Musik In Beispielen: Drehundertfunfzig Tonsatze Aus Neun Jahrhunderten', 'Anthology'],
      ['Beethoven, Ludwig Van', 'Boosey & Co.', 'New York', 1948, 1, 'Fidelio', 'Vocal Score with Piano Reduction', 'Opera']
    ].each do |properties|
      album = Album.new
      properties.map { |author, publisher, location, year, edition, title, detail, style| album.attributes = {:author => author, :publisher => publisher, :location => location, :year => year, :edition => edition, :title => title, :detail => detail, :style => style }}
      album.save!
    end
  end
end

# this one is the one that is needed to be able to call on the models in the db rake methods
task :environment do
  require 'init'
end
