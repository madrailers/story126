task :default => :test

desc 'Run all tests on this project (unit, functional, spec, integration)'
task :test do
  # errors = %w(verify_rcov features doc:diagram:models).collect do |task|
  # errors = %w(verify_rcov features).collect do |task|
  errors = %w(spec features).collect do |task|
    begin
      Rake::Task[task].invoke
      nil
    rescue => e
      task
    end
  end.compact

	if(out = ENV['CC_BUILD_ARTIFACTS'])
	  mv('coverage', out)
  end

  abort "Errors running #{errors.to_sentence}!" if errors.any?

	if(out = ENV['CC_BUILD_ARTIFACTS'])
	  mv('doc/models.png', out)
  end
end
