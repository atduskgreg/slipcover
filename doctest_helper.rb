class Proc
  def raises_error?(err)
    begin
      self.call
    rescue Exception => e
      e.is_a? err
    end
  end
end