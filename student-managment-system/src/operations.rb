require './student'
require './dao.rb'
require './codec.rb'
include Dao
include Codec

module Operations
  def add_new_student()
    system("cls")
    puts "ADDING NEW STUDENT"
    puts "------------------"
    s = Student.new
    s.set_details()
    data = Codec.serialize(s).concat("\n")
    Dao.insert(data)
  end

  def get_student()
    system("cls")
    puts "GETTING STUDENT DETAILS"
    puts "-----------------------"
    print "Enter student roll number: "

    roll_no = gets.chomp()
    student = search_student(roll_no)

    if student != nil
      student.get_details
    else
      puts("No student of roll no " + roll_no + " found")
    end
  end

  def update_student(students)
    puts "UPDATING STUDENT DETAILS"
    puts "-----------------------"
    print "Enter student roll number: "
    roll_no = gets.chomp()
    student_index = -1
    students = get_all_students()
    for index in 0..students.length-1
      student = students[index]
      if(student.roll_no == roll_no)
        student.get_details
        student_index = index
        break
      end
    end

    if student_index != -1
      updated_student = Student.new
      updated_student.set_details
      students[index].name = updated_student.name
      students[index].std = updated_student.std
      students[index].roll_no = updated_student.roll_no
      Dao.write(Codec.serialize_obj_list(students))
    else
      puts("No student of roll no " + roll_no + " found")
    end
  end

  def delete_student()
    system("cls")
    puts "DELETING STUDENT DETAILS"
    puts "-----------------------"
    print "Enter student roll number: "
    roll_no = gets.chomp()
    student_index = nil
    students = get_all_students()
    for index in 0..students.length-1
      student = students[index]
      if(student.roll_no == roll_no)
        print "Deleting student: "
        student.get_details
        student_index = index
        break
      end
    end
    if student_index != nil
      students.delete_at(index)
      data = Codec.serialize_obj_list(students)
      Dao.write(data)
    else
      puts("No student of roll no " + roll_no + " found")
    end
  end
  
  def list_all_students()
    system("cls")
    students = get_all_students()
    puts "LISING ALL STUDENTS"
    puts "-------------------"
    for student in students
      student.get_details
    end
    puts "-------------------"
  end

  def print_types_of_operations
    puts "What do you want to do ?"
    puts "  1. Add new student"
    puts "  2. Get details of a student"
    puts "  3. Update details of a student"
    puts "  4. Delete student entry"
    puts "  5. List all students details"
    puts "  6. Cancel"
  end


  private

  def search_student(roll_no)
    students = get_all_students()
    for student in students
      if(student.roll_no == roll_no)
        return student
      end
    end

    return nil
  end

  def get_all_students()
    serialized_data = Dao.read
    serialized_data_list = serialized_data.split("\n")
    students = serialized_data_list.map{|data| Codec.deserialize(data)}
    return students
  end
end

# function to search record to use in get, update, delete student