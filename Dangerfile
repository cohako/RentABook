require 'danger_plugin'

brakeman.lint
rubyc.lint

warn('PR is too large. Consider breaking it into smaller parts.') if git.lines_of_code > 500

warn('PR description is missing. Add a detailed description of what was changed.') if github.pr_body.strip.empty?

modified_files = git.modified_files

app_files = modified_files.select { |file| file.start_with?('app/') }
test_files = modified_files.select { |file| file.start_with?('spec/', 'test/') }

app_files.each do |app_file|
  test_file = app_file.sub(%r{^app/}, 'spec/').sub(/\.rb$/, '_spec.rb')

  warn("The application file #{app_file} was modified, but there is no corresponding test file #{test_file}.") unless test_files.include?(test_file)
end

warn('Remove temporary TODO or FIXME comments.') if /TODO|FIXME/.match?(git.diff.to_s)

warn('PRs should not be made directly to the master branch.') if github.branch_for_base == 'production'

warn('The .env file should not be changed.') if git.modified_files.include?('.env')

generated_files = git.modified_files.select { |file| file.end_with?('.lock', '.min.js', '.min.css') }
warn("Generated files should not be included: #{generated_files.join(', ')}") if generated_files.any?

warn('There are unresolved conflicts in the PR. Please resolve before continuing.') if /<<<<<<</.match?(git.diff.to_s)

MAX_FILE_SIZE = 500 * 1024 # 500 KB in bytes
big_files = git.modified_files.select { |file| File.size(file) > MAX_FILE_SIZE }
warn("This PR contains large files: #{big_files.join(', ')}") if big_files.any?

warn('Remove `binding.pry` from the code.') if /binding.pry/.match?(git.diff.to_s)
warn('Remove `console.log` from the code.') if /console.log/.match?(git.diff.to_s)
warn('Remove `puts` from the code.') if /puts/.match?(git.diff.to_s)

if git.modified_files.include?('Gemfile') || git.modified_files.include?('Gemfile.lock')
  warn('You added new gems. Ensure that the `Gemfile` and `Gemfile.lock` have been updated and that the team is aware.')
end

warn('You changed migration files. Ensure that these changes will not cause issues in the database.') if git.modified_files.any? do |file|
  file.include?('db/migrate/')
end

warn('You changed configuration files. Check that the changes are necessary and will not affect the environment configuration.') if git.modified_files.any? do |file|
  file.include?('config/')
end

if git.modified_files.any? { |file| file.start_with?('db/seeds') || file == 'db/seeds.rb' }
  warn('You changed seed files. Ensure that these changes will not cause issues with test data.')
end

# if `bundle outdated`.strip.length > 0
#   warn("There are outdated dependencies in your project. Consider updating the dependencies.")
# end

if git.modified_files.any? { |file| file.end_with?('.js', '.css') }
  warn('You changed frontend files. Ensure that these changes have been tested in different browsers.')
end

if git.modified_files.any? { |file| file.include?('lib/') }
  warn('You changed files in the `lib/` folder. Check that the changes do not introduce security vulnerabilities.')
end

if /def .*?end.*?^.*\n$/.match?(git.diff.to_s)
  warn('You introduced code that appears to be unused anywhere. Consider removing it to keep the code clean.')
end

warn('You removed commented code. Consider reviewing the reason for this removal.') if /#.*(deprecated|obsolete)/.match?(git.diff.to_s)

warn('You are using deprecated methods. Check for recommended alternatives.') if /deprecated_method/.match?(git.diff.to_s)

github.dismiss_out_of_range_messages
public_files = (git.modified_files + git.added_files)
rubocop.lint public_files
