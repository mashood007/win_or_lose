module GamesHelper

  def h
    "HOTEL"
  end

  def t
  end

  def e
    ""
  end

  def j
    "JAIL"
  end

  def t
    "TREASURE"
  end

  def dice
    "<svg width=\"3em\" height=\"3em\" viewBox=\"0 0 16 16\" class=\"bi bi-dice-2\" fill=\"white\" xmlns=\"http://www.w3.org/2000/svg\">
    <path fill-rule=\"evenodd\" d=\"M13 1H3a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2zM3 0a3 3 0 0 0-3 3v10a3 3 0 0 0 3 3h10a3 3 0 0 0 3-3V3a3 3 0 0 0-3-3H3z\"/>
    <circle cx=\"4\" cy=\"4\" r=\"1.5\"/>
    <circle cx=\"12\" cy=\"12\" r=\"1.5\"/>
    </svg>".html_safe
  end

  def step_width(steps)
    100 / steps.size
  end

end
