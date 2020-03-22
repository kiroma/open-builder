
local backgroundTexture = game.gui.getTexture("res/char_select_bg.png")
local buttonTexture = game.gui.getTexture("res/button.png")
local buttonTextureSmall = game.gui.getTexture("res/button_small.png")

local CHAR_SELECT_WIDTH = 400
local CHAR_SELECT_HEIGHT = 90
local CHAR_SLOT_SIZE = GuiDim.new(0, CHAR_SELECT_WIDTH, 0, CHAR_SELECT_HEIGHT)

local function createCharacterSelectButton(menu, slot)
    local selector = menu:addButton("+ New Character")
    selector.textSize = 40

    if slot == 0 then
        selector.text = "AAAAAAAAAAAAAA/ Lvl 10"
        selector.onClick = function()
            game.gui.change("play_game", "Vanilla")
        end
    else
        selector.onClick = function()
            game.gui.change("new_character", tostring(slot))
        end
    end
end

local function create(overlay) 
    local menu = StackMenu:create(900, overlay, 10, "Select Character")
    menu:pad(50)
    menu:setBackground(backgroundTexture)

    for characterSlot = 0, 5 do
        createCharacterSelectButton(menu, characterSlot)
    end

    menu:pad(50)
    local backButton = menu:addButton("Back")
    backButton.onClick = function()
        game.gui.change("main_menu")
    end
end

game.gui.addGui{
    id = "character_select",
    title = "Character Select Menu",
    create = create
}