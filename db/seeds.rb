player_list = {
    "Jose Altuve" => {
      :position => "2B", :bats => "Right", :throws => "Right"
    },
    "Robinson Cano" => {
      :position => "2B", :bats => "Left", :throws => "right"
    },
    "Brian Dozier" => {
      :position => "2B", :bats => "Right", :throws => "Right"
    },
    "Daniel Murphy" => {
      :position => ["2B", "1B", "3B"], :bats => "Left", :throws => "Right"
    },
    "Dustin Pedroia" => {
      :position => "2B", :bats => "Right", :throws => "Right"
    },
    "Jonathan Schoop" => {
      :position => "2B", :bats => "Right", :throws => "Right"
    },
    "Ian Kinsler" => {
      :position => "2B", :bats => "Right", :throws => "Right"
    },
    "Neil Walker" => {
      :position => "2B", :bats => "Switch", :throws => "Right"
    },
    "Cesar Hernandez" => {
      :position => ["2B", "3B"], :bats => "Switch", :throws => "Right"
    },
    "Carlos Correa" => {
      :position => "SS", :bats => "Right", :throws => "Right"
    },
    "Corey Seager" => {
      :position => "SS", :bats => "Leftt", :throws => "Right"
    },
    "Francisco Lindor" => {
      :position => "SS", :bats => "Switch", :throws => "Right"
    },
    "Trea Turner" => {
      :position => ["SS", "CF", "2B"], :bats => "Right", :throws => "Right"
     },
    "Andrelton Simmons" => {
      :position => "SS", :bats => "Right", :throws => "Right"
     },
    "Jean Segura" => {
      :position => ["SS", "2B"], :bats => "Right", :throws => "Right"
     },
    "Paul DeJong" => {
      :position => ["SS", "2B"], :bats => "Right", :throws => "Right"
     },
    "Elvis Andrus" => {
      :position => "SS", :bats => "Right", :throws => "Right"
     },
    "Trevor Story" => {
      :position => "SS", :bats => "Right", :throws => "Right"
     },
    "Tim Beckham" => {
      :position => ["SS", "2B", "3B"], :bats => "Right", :throws => "Right"
     },
     "Kris Bryant" => {
      :position => ["3B", "OF"], :bats => "Right", :throws => "Right"
      },
     "Nolan Arenado" => {
      :position => "3B", :bats => "Right", :throws => "Right"
      },
     "Josh Donaldson" => {
       :position => "3B", :bats => "Right", :throws => "Right"
      },
     "Justin Turner" => {
       :position => ["3B", "2B", "SS"], :bats => "Right", :throws => "Right"
      },
     "Anthony Rendon" => {
       :position => "3B", :bats => "Right", :throws => "Right"
      },
     "Adrian Beltre" => {
       :position => "3B", :bats => "Right", :throws => "Right"
      },
     "Jose Ramirez" => {
      :position => "3B", :bats => "Switch", :throws => "Right"
      },
     "Manny Machado" => {
       :position => ["3B, SS"], :bats => "Right", :throws => "Right"
      },
     "Alex Bregman" => {
       :position => "3B", :bats => "Right", :throws => "Right"
      },
     "Kyle Seager" => {
      :position => "3B", :bats => "Left", :throws => "Right"
      },
      "Marcell Ozuna" => {
        :position => ["LF", "OF"], :bats => "Right", :throws => "Right"
       },
      "Yoenis Cespedes" => {
        :position => "LF", :bats => "Right", :throws => "Right"
       },
      "Justin Upton" => {
        :position => "LF", :bats => "Right", :throws => "Right"
       },
      "Ryan Braun" => {
        :position => "LF", :bats => "Right", :throws => "Right"
       },
      "Trey Mancini" => {
        :position => "LF", :bats => "Right", :throws => "Right"
       },
      "Khris Davis" => {
       :position => "LF", :bats => "Right", :throws => "Right"
       },
      "Adam Eaton" => {
        :position => ["LF", "OF"], :bats => "Left", :throws => "Left"
       },
      "Andrew Benintendi" => {
        :position => "LF", :bats => "Left", :throws => "Left"
       },
      "Marwin Gonzalez" => {
        :position => ["LF", "SS", "1B"], :bats => "Switch", :throws => "Right"
       },
      "Brett Gardner" => {
        :position => "LF", :bats => "Left", :throws => "Left"
       }
  }

  player_list.each do |name, player_hash|
    p = Player.new
    p.name = name
    player_hash.each do |attribute, value|
        p[attribute] = value
    end
    p.save
  end


  stadia_list = {
    "AT&T Park" => {
      :year_opened => 2000, :capacity => "41,915"
    },
    "Yankee Stadium" => {
      :year_opened => 2009, :capacity => "47,309"
    },
    "Target Field" => {
      :year_opened => 2010, :capacity => "38,649"
    },
    "Comerica Park" => {
      :year_opened => 2000, :capacity => "41,299"
    },
    "Wrigley Field" => {
      :year_opened => 1914, :capacity => "41,649"
    },
    "Fenway Park" => {
      :year_opened => 1912, :capacity => "37,755"
    },
    "Citi Field" => {
      :year_opened => 2009, :capacity => "41,922"
    },
    "Citizens Bank Park" => {
      :year_opened => 2004, :capacity => "43,651"
    },
    "Dodger Stadium" => {
      :year_opened => 1962, :capacity => "56,000"
    }
  }

stadia_list.each do |name, stadium_hash|
  p = Stadium.new
  p.name = name
  stadium_hash.each do |attribute, value|
      p[attribute] = value
  end
  p.save
end
