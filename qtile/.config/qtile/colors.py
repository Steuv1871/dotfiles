def initColors():
    return themeTokyoNight()

def themeSteuv():
  # Colors Palette
  palette = []
  palette.append("1D2330") #1D2330
  palette.append("E1ACFF") #E1ACFF
  palette.append("FFFFFF") #FFFFFF
  palette.append("000000") #000000

  colors = {'winUnfocus' : palette[0],
  'winFocus' : palette[1],
  'pwrline_dark' : palette[1],
  'pwrline_light' : palette[0],
  'pwrline_text_dark' : palette[0],
  'pwrline_text_light' : palette[1],
  'bar_bckgrnd' : palette[2],
  'bar_text' : palette[3],
  'spawn_text' : palette[2]
  }

  return colors

def themeTokyoNight():
    # Colors Palette
    palette = []
    palette.append("1f2335") #1f2335
    palette.append("24283b") #24283b
    palette.append("292e42") #292e42
    palette.append("3b4261") #3b4261
    palette.append("414868") #414868
    palette.append("545c7e") #545c7e
    palette.append("565f89") #565f89
    palette.append("737aa2") #737aa2
    palette.append("a9b1d6") #a9b1d6
    palette.append("c0caf5") #c0caf5
    palette.append("394b70") #394b70
    palette.append("3d59a1") #3d59a1
    palette.append("7aa2f7") #7aa2f7
    palette.append("7dcfff") #7dcfff
    palette.append("b4f9f8") #b4f9f8
    palette.append("bb9af7") #bb9af7
    palette.append("9d7cd8") #9d7cd8
    palette.append("ff9e64") #ff9e64
    palette.append("ffc777") #ffc777
    palette.append("c3e88d") #c3e88d
    palette.append("4fd6be") #4fd6be
    palette.append("41a6b5") #41a6b5
    palette.append("ff757f") #ff757f
    palette.append("c53b53") #c53b53
    palette.append("ff007c") #ff007c
    

    colors = {'winUnfocus' : palette[1],
    'winFocus' : palette[16],
    'pwrline_dark' : palette[16],
    'pwrline_light' : palette[1],
    'pwrline_text_dark' : palette[1],
    'pwrline_text_light' : palette[16],
    'bar_bckgrnd' : palette[2],
    'bar_text' : palette[7],
    'spawn_text' : palette[21]
    }

    return colors 
