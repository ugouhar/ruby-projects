require './operations.rb'
require './student'
include Operations

def main
  puts "Welcome to Student DB!! \n "

  while true
    Operations.print_types_of_operations
    
    operation_id = gets.chomp()

    case operation_id
      when "1"
        Operations.add_new_student()
      when "2"
        Operations.get_student()
      when "3"
        Operations.update_student()
      when "4"
        Operations.delete_student()
      when "5"
        Operations.list_all_students()
      when "6"
        break
      else
        puts "Please select a valid choice !"
    end
  end

end

main