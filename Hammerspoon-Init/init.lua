kana = hs.hotkey.modal.new({}, nil, nil)

--function kana:entered() hs.alert'Entered mode' end
--function kana:exited() hs.alert'Exited mode' end

local function keystrokeFunction(modifiers, characters)
    return function()
        fastKeyStroke(modifiers, characters);
    end
end

fastKeyStroke = function(modifiers, character)
  local event = require("hs.eventtap").event
  event.newKeyEvent(modifiers, string.lower(character), true):post()
  hs.timer.usleep(100)
  event.newKeyEvent(modifiers, string.lower(character), false):post()
end

-- 'WASD'-like arrows
kana:bind('', 'w', nil, keystrokeFunction(nil, 'up'), keystrokeFunction(nil, 'up'))
kana:bind('', 'r', nil, keystrokeFunction(nil, 'down'), keystrokeFunction(nil, 'down')) 
kana:bind('', 'a', nil, keystrokeFunction(nil, 'left'), keystrokeFunction(nil, 'left'))
kana:bind('', 's', nil, keystrokeFunction(nil, 'right'), keystrokeFunction(nil, 'right'))

-- 'WASD'-like - selection
kana:bind('alt', 'w', nil, keystrokeFunction('shift', 'up'), keystrokeFunction('shift', 'up'))
kana:bind('alt', 'r', nil, keystrokeFunction('shift', 'down'), keystrokeFunction('shift', 'down')) 
kana:bind('alt', 'a', nil, keystrokeFunction('shift', 'left'), keystrokeFunction('shift', 'left'))
kana:bind('alt', 's', nil, keystrokeFunction('shift', 'right'), keystrokeFunction('shift', 'right'))

-- Home-Row navigation
kana:bind('', 'n', nil, keystrokeFunction(nil, 'home'), keystrokeFunction(nil, 'home'))
kana:bind('', 'e', nil, keystrokeFunction('alt', 'left'), keystrokeFunction('alt', 'left'))
kana:bind('', 'i', nil, keystrokeFunction('alt', 'right'), keystrokeFunction('alt', 'right'))
kana:bind('', 'o', nil, keystrokeFunction(nil, 'end'), keystrokeFunction(nil, 'end'))

-- Home-Row selection
kana:bind('alt', 'n', nil, keystrokeFunction('shift', 'home'), keystrokeFunction('shift', 'home'))
kana:bind('alt', 'e', nil, keystrokeFunction({'alt', 'shift'}, 'left'), keystrokeFunction({'alt', 'shift'}, 'left'))
kana:bind('alt', 'i', nil, keystrokeFunction({'alt', 'shift'}, 'right'), keystrokeFunction({'alt', 'shift'}, 'right'))
kana:bind('alt', 'o', nil, keystrokeFunction('shift', 'end'), keystrokeFunction('shift', 'end'))

-- Caps-Lock+Space == Delete previous word (alt+delete (backspace))
kana:bind('', 'space', nil, keystrokeFunction('alt', 'delete'), keystrokeFunction('alt', 'delete'))


-- Caps-Lock is rebound to f19
kanaToggle = hs.hotkey.new(
    {},
    'f19',
    function()
        kana:enter()
    end,
    function()
        kana:exit()
    end)

kanaToggle:enable()