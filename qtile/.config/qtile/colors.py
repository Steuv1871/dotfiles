def intermediate_color(color1, color2, ratio=0.5):
  """
  Returns the intermediate color between two colors, as a hexadecimal string.
  color1 and color2: hexadecimal strings representing the colors (exemple : "2FAE34").
  ratio: float between 0 and 1 representing the ratio of color2.
  """
  
  return "{:02X}{:02X}{:02X}".format(
    int(int(color1[0:2], 16) * (1 - ratio) + int(color2[0:2], 16) * ratio), 
    int(int(color1[2:4], 16) * (1 - ratio) + int(color2[2:4], 16) * ratio), 
    int(int(color1[4:6], 16) * (1 - ratio) + int(color2[4:6], 16) * ratio)
  )

def initColors():
  # Colors Palette
  palette = []
  palette.append("1D2330")
  palette.append("E1ACFF")
  palette.append("FFFFFF")
  palette.append("000000")

  colors = {'winUnfocus' : palette[0],
  'winFocus' : palette[1],
  'pwrline_dark' : palette[1],
  'pwrline_light' : palette[0],
  'pwrline_text_dark' : palette[0],
  'pwrline_text_light' : palette[1],
  'bar_bckgrnd' : palette[2],
  'bar_text' : palette[3]
  }

  return colors
