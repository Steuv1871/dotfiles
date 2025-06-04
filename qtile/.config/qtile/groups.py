from libqtile.config import Group, Match

def initGroups():
    #groups = [Group(i) for i in "azertyuiop"]
    groups = [Group("a", label="", layout='monadtall'),
          Group("z", label="", layout='monadtall'),
          Group("e", label="", layout='monadtall',matches=[Match(title=["Mozilla Firefox"])]),
          Group("r", label="", layout='monadtall',matches=[Match(title=["Obsidian"])]),
          #Group("r", label="", layout='monadtall'),
          #Group("t", label="", layout='monadtall'),
          #Group("y", label="", layout='monadtall'),
          #Group("u", label="", layout='monadtall'),
          #Group("i", label="", layout='monadtall'),
          Group("o", label="", layout='monadtall'),
          Group("p", label="󰞋", layout='floating')]
    
    return groups
