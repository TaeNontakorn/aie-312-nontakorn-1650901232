# create a new Class, User, that has the following attributes:
# - name
# - email
# - password


# create a new Class, Room, that has the following attributes:
# - name
# - description
# - users

# create a new Class, Message, that has the following attributes:
# - user
# - room
# - content

# add a method to user so, user can enter to a room
# user.enter_room(room)

# add a method to user so, user can send a message to a room
# user.send_message(room, message)
# user.ackowledge_message(room, message)

# add a method to a room, so it can broadcast a message to all users
# room.broadcast(message)


class User
    attr_accessor :name, :email, :password, :rooms
  
    def initialize(name, email, password)
      @name = name
      @email = email
      @password = password
      @rooms = []
    end
  
    def enter_room(room)
  
      unless @rooms.include?(room)
        @rooms << room
        room.users << self
        puts "#{@name} has entered the room #{room.name}"
      end
  
    end
  
  end
  
  class Room
    attr_accessor :name, :description, :users, :messages
  
    def initialize(name, description)
      @name = name
      @description = description
      @users = []
      @messages = []
    end
  
    def broadcast(message)
      puts "Broadcasting message in room #{message.room.name}: '#{message.content}'"
    end
    
  end
  
  class Message
    attr_accessor :user, :room, :content
  
    def initialize(user, room, content)
      @user = user
      @room = room
      @content = content
    end
  
    def self.send_message(user, room, content)
  
      message = Message.new(user, room, content)
      room.messages << message
      puts "#{user.name} sent a message to #{room.name}: #{content}"
      room.broadcast(message)
  
    end
  
    def self.acknowledge_message(room)
      last_message = room.messages.last
      puts "#{room.name} acknowledges message is: '#{last_message.content}' from #{last_message.user.name}"
    end
  
    def broadcast(message)
      puts "Broadcasting message in room #{message.room.name}: '#{message.content}'"
    end
  
  end
  
  
  user1 = User.new("Tae", "nontakorn.lakl@bumail.net", "123456789")
  
  room1 = Room.new("999", "Room for handsome guy")
  
  user1.enter_room(room1)
  
  Message.send_message(user1, room1, "Hi guy")
  Message.acknowledge_message(room1)
  