require 'faker'

class BoardgameSeeder
  @boardgames = [
    { :user_id=>2,
      :name=>"Lueilwitz LLC",
      :description=>"Assimilated client-driven contingency",
      :publisher=>"Taylor & Francis"
    }, {:user_id=>4,
      :name=>"Nikolaus, Oberbrunner and Bailey",
      :description=>"Quality-focused modular attitude",
      :publisher=>"Secker & Warburg"
    }, {:user_id=>3,
      :name=>"Lueilwitz-O'Keefe",
      :description=>"Exclusive optimal open architecture",
      :publisher=>"Hogarth Press"
    }, {:user_id=>2,
       :name=>"Greenholt LLC",
       :description=>"Integrated tertiary process improvement",
       :publisher=>"UCL Press"
    }, {:user_id=>3,
      :name=>"Conn, Cormier and Leuschke",
      :description=>"Ameliorated empowering matrices",
      :publisher=>"Brill"
    }, {:user_id=>3,
      :name=>"Shanahan-Towne",
      :description=>"Phased heuristic structure",
      :publisher=>"Tartarus Press"
    }, {:user_id=>4,
      :name=>"Hane, Stanton and Kessler",
      :description=>"Horizontal regional function",
      :publisher=>"St. Martin's Press"
    }
  ]

  def self.seed!
    @boardgames.each do |boardgame_params|
      name = boardgame_params[:name]
      boardgame = Boardgame.find_or_initialize_by(name: name)
      boardgame.assign_attributes(boardgame_params)
      boardgame.save!
    end
  end

end
