from libqtile.config import Group, Match
import re

def initGroups():
    #groups = [Group(i) for i in "azertyuiop"]
    groups = [Group("a", label="", layout='monadtall'),
          Group("z", label="", layout='monadtall'),
      #     Group("e", label="", layout='monadtall',matches=[Match(title=["Mozilla Firefox"])]), # Deprecated
      #     Group("r", label="", layout='monadtall',matches=[Match(title=["Obsidian"])]), # Deprecated
          Group("e", label="", layout='monadtall',matches=[Match(title=re.compile(r"^(Mozilla\ Firefox)$"))]),
          Group("r", label="", layout='monadtall',matches=[Match(title=re.compile(r"^(Obsidian)$"))]),
          #Group("r", label="", layout='monadtall'),
          #Group("t", label="", layout='monadtall'),
          #Group("y", label="", layout='monadtall'),
          #Group("u", label="", layout='monadtall'),
          #Group("i", label="", layout='monadtall'),
          Group("o", label="", layout='monadtall'),
          Group("p", label="󰞋", layout='monadtall')]
    
    return groups
