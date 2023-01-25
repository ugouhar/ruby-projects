module Dao
  def insert(data)
    File.open("./db.txt", "a") do |file|
      file.write(data)
    end
  end

  def read
    File.open("./db.txt", "r") do |file|
      return file.read()
    end
  end

  def write(data)
    File.open("./db.txt", "w") do |file|
      file.write(data)
    end
  end

  def delete
  end
end
