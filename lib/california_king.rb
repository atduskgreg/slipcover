require 'rubygems'
require 'enumerator'
require 'couchrest'

class CaliforniaKing
  attr_accessor :silenced_errors, :width
  
  def initialize(server, dbname, width=7)
    @server = server
    @dbname = dbname
    @width = width
    @silenced_errors = []
  end
  
  def query(queries)
    results = []
    slice_size = queries.length.to_f / @width
    # each thread gets a slice to process, so it doesn't have to wait on others
    threads = []
    puts "slicing #{queries.length} queries into slices of size #{slice_size}"
    queries.each_slice([slice_size.round,1].max) do |qs|
      puts "feeding #{qs.length} queries to thread #{threads.length}"
      threads << Thread.new(database) do |db|
        qs.each do |q|
          method = q.shift
          begin
            results << db.send(method, *q)
            $stdout.putc '.'
            $stdout.flush
          rescue Exception => e
            raise e unless silenced_errors_include? e
          end
        end
        puts "thread finished"
      end
    end
    threads.each{|t| t.join}
    results
  end
  
  private
  
  def database
    CouchRest.new(@server).database(@dbname)
  end
  
  def silenced_errors_include? e
    @silenced_errors.any?{|eklass| e.is_a? eklass}
  end

end
