Gem::Specification.new do |s|
  s.name = "slipcover"
  s.version = "0.2.0"
  s.date = "2008-09-09"
  s.summary = "CouchDB clustering and parallelization."
  s.email = "greg@grabb.it"
  s.homepage = "http://github.com/atduskgreg/slipcover"
  s.description = "Slipcover runs a single query across a multi-member cluser (i.e. a group of CouchDBs) and zip up the results. CaliforniaKing runs a series of queries in parallel against a single CouchDB."
  s.has_rdoc = false
  s.authors = ["Greg Borenstein", "J. Chris Anderson"]
  s.files = %w{
    lib/slipcover.rb lib/california_king.rb
    README.rdoc 
    slipcover.gemspec
    doctest/slipcover.doctest doctest/california_king.doctest doctest/doctest_helper.rb
    }
  s.require_path = "lib"
  s.add_dependency("couchrest", [">= 0.9"])
end
