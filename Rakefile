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
    Album.create!(
      :author => "Davison, Archibald T and Apel, Willi",
      :publisher => "Harvard University Press",
      :location => "Cambridge, Massachusetts",
      :year => 1949,
      :edition => 4,
      :title => "First title",
      :detail => "Historical Anthology of Music: Oriental, Medieval and Renaissance Music",
      :style => "Anthology"
    )
    Album.create!(
      :author => "Schering, Arnold",
      :publisher => "Veb Brietkopf & Hartel Muskverlag",
      :location => "Leipzig",
      :year => 1931,
      :edition => 1,
      :title => "2nd title",
      :detail => "Geschiecte Der Musik In Beispielen: Drehundertfunfzig Tonsatze Aus Neun Jahrhunderten",
      :style => "Anthology"
    )
    Album.create!(
      :author => "Beethoven, Ludwig Van",
      :publisher => "Boosey & Co.",
      :location => "New York",
      :year => 1948,
      :edition => 1,
      :title => "Fidelio",
      :detail => "Vocal Score with Piano Reduction",
      :style => "Opera"
    )
    end
end

# this one is the one that is needed to be able to call on the models in the db rake methods
task :environment do
  require 'init'
end
