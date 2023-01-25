require('./student')
module Codec
  def serialize(obj)
    data = ""
    data += (obj.name + ", ")
    data += (obj.std + ", ")
    data += (obj.roll_no)

    return data
  end

  def serialize_obj_list(obj_list)
    data = ""
    obj_list.each{|item| 
      data += serialize(item).concat("\n")
    }
    return data
  end

  def deserialize(str)
    obj_values = str.split(",").map{|elem| elem.strip}
    
    student = Student.new
    student.name = obj_values[0]
    student.std = obj_values[1]
    student.roll_no = obj_values[2]

    return student
  end
end
