# -*- encoding: utf-8 -*-
# stub: bcrypt 3.1.16 ruby lib
# stub: ext/mri/extconf.rb

Gem::Specification.new do |s|
  s.name = "bcrypt".freeze
  s.version = "3.1.16"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Coda Hale".freeze]
  s.date = "2021-03-24"
  s.description = "    bcrypt() is a sophisticated and secure hash algorithm designed by The OpenBSD project\n    for hashing passwords. The bcrypt Ruby gem provides a simple wrapper for safely handling\n    passwords.\n".freeze
  s.email = "coda.hale@gmail.com".freeze
  s.extensions = ["ext/mri/extconf.rb".freeze]
  s.extra_rdoc_files = ["README.md".freeze, "COPYING".freeze, "CHANGELOG".freeze, "lib/bcrypt/password.rb".freeze, "lib/bcrypt/engine.rb".freeze, "lib/bcrypt/error.rb".freeze, "lib/bcrypt.rb".freeze]
  s.files = [".gitignore".freeze, ".rspec".freeze, ".travis.yml".freeze, "CHANGELOG".freeze, "COPYING".freeze, "Gemfile".freeze, "README.md".freeze, "Rakefile".freeze, "appveyor.yml".freeze, "bcrypt.gemspec".freeze, "ext/jruby/bcrypt_jruby/BCrypt.java".freeze, "ext/mri/bcrypt_ext.c".freeze, "ext/mri/crypt.c".freeze, "ext/mri/crypt.h".freeze, "ext/mri/crypt_blowfish.c".freeze, "ext/mri/crypt_blowfish.h".freeze, "ext/mri/crypt_gensalt.c".freeze, "ext/mri/crypt_gensalt.h".freeze, "ext/mri/extconf.rb".freeze, "ext/mri/ow-crypt.h".freeze, "ext/mri/wrapper.c".freeze, "ext/mri/x86.S".freeze, "lib/bcrypt.rb".freeze, "lib/bcrypt/engine.rb".freeze, "lib/bcrypt/error.rb".freeze, "lib/bcrypt/password.rb".freeze, "spec/TestBCrypt.java".freeze, "spec/bcrypt/engine_spec.rb".freeze, "spec/bcrypt/error_spec.rb".freeze, "spec/bcrypt/password_spec.rb".freeze, "spec/spec_helper.rb".freeze]
  s.homepage = "https://github.com/codahale/bcrypt-ruby".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--title".freeze, "bcrypt-ruby".freeze, "--line-numbers".freeze, "--inline-source".freeze, "--main".freeze, "README.md".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "OpenBSD's bcrypt() password hashing algorithm.".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake-compiler>.freeze, ["~> 0.9.2"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 3"])
    else
      s.add_dependency(%q<rake-compiler>.freeze, ["~> 0.9.2"])
      s.add_dependency(%q<rspec>.freeze, [">= 3"])
    end
  else
    s.add_dependency(%q<rake-compiler>.freeze, ["~> 0.9.2"])
    s.add_dependency(%q<rspec>.freeze, [">= 3"])
  end
end
