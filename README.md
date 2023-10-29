# WordleSolver

TODO: Delete this and the text below, and describe your gem

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/wordle_solver`. To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

TODO: Replace `UPDATE_WITH_YOUR_GEM_NAME_PRIOR_TO_RELEASE_TO_RUBYGEMS_ORG` with your gem name right after releasing it to RubyGems.org. Please do not do it earlier due to security reasons. Alternatively, replace this section with instructions to install your gem from git if you don't plan to release to RubyGems.org.

Install the gem and add to the application's Gemfile by executing:

    $ bundle add UPDATE_WITH_YOUR_GEM_NAME_PRIOR_TO_RELEASE_TO_RUBYGEMS_ORG

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install UPDATE_WITH_YOUR_GEM_NAME_PRIOR_TO_RELEASE_TO_RUBYGEMS_ORG

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### Sorbet
🤔 What's next

1. Many Ruby applications use metaprogramming DSLs to dynamically generate constants and methods.
  To generate type definitions for any DSLs in your application, run:

  bin/tapioca dsl

2. Check whether the constants in the sorbet/rbi/todo.rbi file actually exist in your project.
  It is possible that some of these constants are typos, and leaving them in todo.rbi will
  hide errors in your application. Ideally, you should be able to remove all definitions
  from this file and delete it.

3. Typecheck your project:

  bundle exec srb tc

  There should not be any typechecking errors.

4. Upgrade a file marked "# typed: false" to "# typed: true".
  Then, run: bundle exec srb tc and try to fix any errors.

  You can use Spoom to bump files for you:

  spoom bump --from false --to true

  To learn more about Spoom, visit: https://github.com/Shopify/spoom

5. Add signatures to your methods with sig. To learn how, read: https://sorbet.org/docs/sigs

Documentation
We recommend skimming these docs to get a feel for how to use Sorbet:
- Gradual Type Checking: https://sorbet.org/docs/gradual
- Enabling Static Checks: https://sorbet.org/docs/static
- RBI Files: https://sorbet.org/docs/rbi

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/wordle_solver.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
