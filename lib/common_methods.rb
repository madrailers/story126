def random_string(length=126)
  (1..length).inject(""){|sum,c|sum+(rand(122-97)+97).chr}
end

def auto_story(name='silly')
  case name
  when 'silly'
    'Beaming with pride, Mal presses the glowing button, and the world around him bleeds to white. "This," he muses, "is progress."'
  when 'scary'
    "Exhausted, drugged and bound, Rose watched the claymore rive her mother's chest, unleashing a fury the world has yet to match."
  when 'cool'
    'A rocket in the distance slowly erects a plume tower. His teary eyes follow. Dropping to a knee, he removes his helmet, gasps.'
  when 'sad'
    'The octogenarian refuses a helping hand, rising out of his wheelchair. Adorned in his uniform, he salutes my casketed grandpa.'
  else
    'Two decades ago, had he not become so spellbound by his computer at age 3, Jon might not be at this crossroad. He hits "Send."'
  end
end