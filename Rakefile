require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/**/test*.rb']
  t.verbose = true
end

#Rake::TestTask.new do |t| 
#	t.pattern = 'test/**/test_*.rb' 
#	t.warning = true 
#end 

