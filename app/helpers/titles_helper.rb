module TitlesHelper
  def posted_by(name)
    "<div class='posted-by card-action'>
      <p>[img] #{name} • #{rand(12)} hours ago.</p>
    </div>".html_safe
  end

  def row(title, left_width:, right_width: nil)
    right_width ||= 12-left_width

    "<div class='row'>
      #{left_title_card(title, width: left_width)}
      #{right_title_card(title, width: right_width)}
    </div>".html_safe
  end

  def right_title_card(title, width: 5)
    "<div class='col s12 m#{width}'>
      <div class='article-card card horizontal'>
        <div class='card-image'>
          <img src='http://lorempixel.com/100/190/nature/6'>
        </div>
        <div class='card-stacked'>
          <div class='card-content'>
            <p>
              <strong>#{title.phrase}</strong><br />
              And we can't stop talking about it.
            </p>
          </div>

          #{posted_by("Margaret Thatcher")}
        </div>
      </div>
    </div>".html_safe
  end

  def left_title_card(title, width: 7)
    "<div class='col s12 m#{width}'>
        <div class='article-card card horizontal'>
          <div class='card-image'>
            <img src='http://lorempixel.com/100/190/nature/6'>
          </div>

        <div class='card-stacked'>
          <div class='card-content'>
            <p>
              <strong>#{title.phrase}</strong><br />
              And I can't even about it
            </p>
          </div>

          #{posted_by('Benjamin Franklin')}
        </div>
      </div>
    </div>".html_safe
  end
end
