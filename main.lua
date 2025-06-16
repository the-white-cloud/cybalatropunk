--- STEAMODDED HEADER
--- MOD_NAME: Cybalatropunk
--- MOD_ID: Cybalatropunk
--- MOD_AUTHOR: [Jules (the-white-cloud)]
--- MOD_DESCRIPTION: Adds Cyberpunk 2077 inspired Jokers and other stuff.
--- PREFIX: cbpunk
-----------------------------------------
-----------------Mod Code----------------


SMODS.Atlas{
    key = 'j_cbpunk_jokers',
    path = 'jokers.png',
    px = 71,
    py = 85
}

local files = {
  jokers = {
    list = {
      --You can rearrange the joker order in the collection by changing the order here
      "bill_mitchel",
      "misty",
    },
    directory = 'jokers/'
  },
}


local function load_files(set)
    for i = 1, #files[set].list do
        if files[set].list[i] then assert(SMODS.load_file(files[set].directory .. files[set].list[i] .. '.lua'))() end
    end
end

for key, value in pairs(files) do
  load_files(key)
end