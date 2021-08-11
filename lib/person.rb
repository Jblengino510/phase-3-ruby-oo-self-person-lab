class Person

    attr_accessor :bank_account
    # (Both reader & writer)

    attr_reader :name, :happiness, :hygiene
    # def name
    #     @name
    # end

    # attr_writer :name
    # def name=(name)
    #     @name = name
    # end

    def initialize(name, bank_account = 25, happiness = 8, hygiene = 8)
        @name = name
        @bank_account = bank_account
        @happiness = happiness
        @hygiene = hygiene
        @@people << self
    end

    def happiness=(new_happiness)
        if new_happiness.between?(0,10)
            @happiness = new_happiness
        elsif new_happiness > 10
            @happiness = 10
        else 
            @happiness = 0
        end
    end

    def hygiene=(new_hygiene)
        if new_hygiene.between?(0,10)
            @hygiene = new_hygiene
        elsif new_hygiene > 10
            @hygiene = 10
        else
            @hygiene = 0
        end
    end

    def happy?
       @happiness > 7 
    end
    
    def clean?
        @hygiene > 7
    end

    def get_paid(amount)
        self.bank_account += amount
        "all about the benjamins"
    end

    def take_bath
        self.hygiene += 4
        "♪ Rub-a-dub just relaxing in the tub ♫"
    end

    def work_out
        self.hygiene -= 3
        self.happiness += 2
        "♪ another one bites the dust ♫"
    end

    def call_friend(friend)
        self.happiness += 3
        friend.happiness += 3
        "Hi #{friend.name}! It's #{self.name}. How are you?"
    end

    def start_conversation(friend, topic)
        case topic 
        when "politics"
          [self, friend].each { |person| person.happiness -= 2 }
          "blah blah partisan blah lobbyist"
        when "weather"
          [self, friend].each { |person| person.happiness += 1 }
          "blah blah sun blah rain"
        else
          "blah blah blah blah blah"
        end
      end
end
