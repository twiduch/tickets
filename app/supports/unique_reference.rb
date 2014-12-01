class UniqueReference
  def self.generate 
    new.generate
  end
  
  def generate 
    while Ticket.find_by_ref(n = reference_number); end
    n
  end
  
  private
  def reference_number
    "#{random_letters}-#{random_hex}-#{random_letters}-#{random_hex}-#{random_letters}"
  end
  
  def random_letters
    (0...3).map { ('A'..'Z').to_a[rand(26)] }.join
  end
  
  def random_hex
    SecureRandom.hex(1).upcase
  end
end
