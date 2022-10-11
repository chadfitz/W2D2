require_relative "./room.rb"

class Hotel
    def initialize(name, rooms)
        @name = name
        @rooms = {}
        rooms.each { |k, v| @rooms[k] = Room.new(v) }
        #rooms = {name=>capacity}
    end

    def name
        new_names = []
        @name.split.each { |ele| new_names << ele.capitalize }
        new_names.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(name)
        if @rooms.has_key?(name)
            return true
        else
            false
        end
    end

    def check_in(person, name)
        if !room_exists?(name)
            p 'sorry, room does not exist'
        else
            rooms[name].add_occupant(person)
            if rooms[name].occupants.include?(person)
                p 'check in successful'
            else
                p 'sorry, room is full'
            end
        end
    end

    def has_vacancy?
        @rooms.each { |room_name, room| return true if !rooms[room_name].full? }
        false
    end

    def list_rooms
        @rooms.each do |room_name, room| 
            # puts "#{room_name} : #{room.available_space}"
            puts room_name + ".*" + rooms[room_name].available_space.to_s
        end
    end
end
