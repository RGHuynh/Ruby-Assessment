class Genie
  attr_reader :G_age
  attr_accessor :G_name
  def initialize(name, age)
    @G_name = name
    @G_age = age
    @submitted_wishes = {
      granted_wish: [],
      non_granted_wish: []
    }

  end

  def enter_lamp
    p "Genie entered the lamp"
  end

  def exit_lamp
    p "Genie came out of the lamp!"
  end

  def grant_wish(wish, wish_count)
    if wish_count > 3
      @submitted_wishes[:non_granted_wish] << wish
      puts "Wish has not been granted"
    else
      @submitted_wishes[:granted_wish] << wish
      puts "Wish has been granted"
    end
    p @submitted_wishes
    p wish_count
  end

  def display_wish_history
    @submitted_wishes[:granted_wish].each {|wish| p wish}
    @submitted_wishes[:non_granted_wish].each {|wish| p wish}
  end

  def favorite_wish
    word = ""
    number = 0
    @submitted_wishes.each do |k,v|
      v.each do |v|
        current_number = v.scan(/[aeiou]/).count.to_i
        number = current_number if current_number > number
        word = v if current_number >= number
      end
    end
    p word
  end

end

genie = Genie.new("Tom", 49)

puts "Are you going to rub the lamp? (Y/N)"
user_input = gets.chomp.downcase

genie.exit_lamp


wish_count = 1
continue = "yes"

until continue == "no"

  puts "What is your wish?"
  user_wish = gets.chomp
  genie.grant_wish(user_wish, wish_count)
  wish_count += 1
  puts "do you want to continue(yes or no)"
  answer = gets.chomp
  continue = answer
end

genie.display_wish_history
genie.favorite_wish
