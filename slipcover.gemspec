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
    slipcover.rb california_king.rb
    README.rdoc 
    slipcover.gemspec
    slipcover.doctest california_king.doctest
    }
  # s.require_path = ""
  s.add_dependency("couchrest", [">= 0.9"])
end
