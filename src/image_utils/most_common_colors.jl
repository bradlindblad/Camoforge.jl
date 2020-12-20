"""
    most_common_colors(img::String)
img: path to local image file
"""
function most_common_colors(img::String)

    colorthief = pyimport("colorthief")
    color_thief = colorthief.ColorThief(img)
    cols = color_thief.get_palette(color_count=8)

	color1 = RGB(cols[1][1]/255, cols[1][2]/255,  cols[1][3]/255)
	color2 = RGB(cols[2][1]/255, cols[2][2]/255,  cols[2][3]/255)
	color3 = RGB(cols[3][1]/255, cols[3][2]/255,  cols[3][3]/255)

    return (color1, color2, color3)

end
