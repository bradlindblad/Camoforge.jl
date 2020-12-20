"""
    most_common_colors(img::String)
img: path to local image file
n: how many common colors to return
"""
function most_common_colors(img::String, n::Int)

    colorthief = pyimport("colorthief")
    color_thief = colorthief.ColorThief(img)
    cols = color_thief.get_palette(color_count=n)


	function getone(x)
		RGB(cols[x][1]/255, cols[x][2]/255,  cols[x][3]/255)
	end

	output = []
	for i in 1:n-1
		push!(output,getone(i))
	end


    return output

end
