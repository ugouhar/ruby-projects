class Student
  attr_accessor :name, :std, :roll_no

  def set_details
    puts "Enter student details"
    print "Name: "
    name = gets.chomp()
    
    print "Std: "
    std = gets.chomp()
    
    print "Roll No: "
    roll_no = gets.chomp()

    self.name = name
    self.std = std
    self.roll_no = roll_no
  end

  def get_details
    puts (self.name + ", " + self.std + ", " + self.roll_no)
  end

end

