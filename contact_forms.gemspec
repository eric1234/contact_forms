Gem::Specification.new do |s|
  s.name = 'contact_forms'
  s.version = '0.0.4'
  s.homepage = 'https://github.com/eric1234/contact_forms'
  s.author = 'Eric Anderson'
  s.email = 'eric@pixelwareinc.com'
  s.add_dependency 'rails', '> 3'
  s.add_dependency 'enforce_schema_rules'
  s.add_dependency 'rack_mailer'
  s.files = Dir['**/*.rb'] + Dir['**/*.erb']
  s.extra_rdoc_files << 'README.rdoc'
  s.rdoc_options << '--main' << 'README.rdoc'
  s.summary = 'Gives admin ability to manage response to contact forms'
  s.description = <<-DESCRIPTION
    A UI plugin that wraps rack_mailer to configure the middleware,
    the success message and the auto-responder if one is desired.
  DESCRIPTION
end
