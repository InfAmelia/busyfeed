module TitlesHelper
  USERNAMES = ["Peter Abelard", "Theodor Adorno", "Thomas Aquinas", "Hannah Arendt", "Aristotle", "Augustine", "Francis Bacon", "Roland Barthes", "Georges Bataille", "Jean Baudrillard", "Simone de Beauvoir", "Walter Benjamin", "George Berkeley", "Judith Butler"]

  def posted_by(name)
    "<div class='posted-by card-action'>
      <p>[img] #{name} • #{rand(12)} hours ago.</p>
    </div>".html_safe
  end

  def row(title_one, title_two, left_width: 6, right_width: 6)
    right_width ||= 12-left_width

    if title_one && title_two
      "<div class='row'>
        #{generate_random_card(title_one, :left)}
        #{generate_random_card(title_two, :right)}
      </div>".html_safe
    end
  end

  def right_title_card(title, width: 6)
    "<div class='col s12 m#{width}'>
      <div class='article-card card horizontal'>
        <div class='card-image'>
          <img src='http://lorempixel.com/100/190/nature/#{title.id}'>
        </div>
        <div class='card-stacked'>
          <div class='card-content'>
            <p>
              <strong>#{title.swapped_phrase}</strong><br />
              And we can't stop talking about it.
            </p>
          </div>

          #{posted_by(USERNAMES.shuffle.first)}
        </div>
      </div>
    </div>".html_safe
  end

  def left_title_card(title, width: 6)
    "<div class='col s12 m#{width}'>
        <div class='article-card card horizontal'>
          <div class='card-image'>
            <img src='http://lorempixel.com/100/190/nature/#{title.id}'>
          </div>

        <div class='card-stacked'>
          <div class='card-content'>
            <p>
              <strong>#{title.swapped_phrase}</strong><br />
              And I can't even about it
            </p>
          </div>

          #{posted_by(USERNAMES.shuffle.first)}
        </div>
      </div>
    </div>".html_safe
  end

  def generate_random_card(title, position)
    case position
      when :left
        left_title_card(title)
      when :right
        right_title_card(title)
    end
  end
end
