class Slipcover
  attr_accessor :silenced_errors, :members
  
  def initialize(members)
    @members = Array(members)
    @silenced_errors = []
  end

  def add_member member
    @members << member
  end
  
  def remove_member(member=nil, &block)
    @members.delete(member) if member
    @members.reject!{ |m| block.call(m) } if block_given?
  end
  
  
  def method_missing(method, *args, &block)
    results = []
    threads = []
        
    @members.each do |m|
      threads << Thread.new(m) do |member|
        begin
          results << member.send(method, *args)
        rescue Exception => e
          raise e unless silenced_errors_include? e
        end
      end
    end
      
    threads.each{|t| t.join}
    results
  end
  
  private
  
  def silenced_errors_include? e
    @silenced_errors.any?{|eklass| e.is_a? eklass}
  end

end
