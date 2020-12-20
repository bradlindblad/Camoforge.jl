### A Pluto.jl notebook ###
# v0.12.17

using Markdown
using InteractiveUtils

# ╔═╡ b8293916-42e5-11eb-0a82-11d14d1b4ba1
using Pkg; Pkg.status()

# ╔═╡ d5ea666e-42e5-11eb-2d9b-432c08b84a98
using Camoforge

# ╔═╡ 7009f8c4-42e9-11eb-2775-eb9f6cce20a2
using Colors

# ╔═╡ 4f305f60-42eb-11eb-33aa-1548a90f866a
using StatsBase

# ╔═╡ 3aa78d38-42f1-11eb-1005-2bf725559cb3
using Images

# ╔═╡ 34165c74-42fb-11eb-2d74-512a600c05ba
using PyCall

# ╔═╡ e0c451bc-42e5-11eb-1e3e-417e400304ad
Camoforge.get_image("/home/brad/Desktop/test.jpg")

# ╔═╡ fd62b854-42e5-11eb-0880-cf34d4d189ae
test = Camoforge.get_image("/home/brad/Desktop/test.jpg")

# ╔═╡ 28456c56-42e6-11eb-31f3-dfadfd7bc8a1
test[end-9]

# ╔═╡ 4fd8f040-42ea-11eb-2548-bdb8e7cd15ec
md"### Info on arrays"

# ╔═╡ 5a3a1c3a-42ea-11eb-134a-514790026194
md"[https://en.wikibooks.org/wiki/Introducing_Julia/Arrays_and_tuples#Finding_out_about_an_array](https://en.wikibooks.org/wiki/Introducing_Julia/Arrays_and_tuples#Finding_out_about_an_array)"

# ╔═╡ 6b156e22-42e9-11eb-0e22-9d27615d22cc
Colors.hex(test[end])

# ╔═╡ d963bbd6-42e9-11eb-3c7d-3b2722e77bc2
ndims(test)

# ╔═╡ 37d03b70-42ea-11eb-1a05-ff87bd42f290
size(test)

# ╔═╡ 6f44c31e-42ea-11eb-3507-cbff33f47bc0
to_remove = mode(test)

# ╔═╡ c0b38aaa-42ea-11eb-06dc-6f53490d1ad3
md"Soo, could we find mode, then subtract that mean from image, find mode again, ad nauseaum?"

# ╔═╡ d22ada9a-42ea-11eb-380f-677bbeb7cf41
typeof(to_remove)

# ╔═╡ f8a4e1f6-42eb-11eb-0588-cd1265323630
splice!(collect(test), to_remove)

# ╔═╡ 46bf1bae-42ec-11eb-3dd6-3db6770bcf2b
get_outt = findall(x -> x == to_remove, test)

# ╔═╡ 9cabda98-42ec-11eb-3b7c-eda2202fc177
deleteat!(test, findall(x -> x == to_remove, collect(test)))

# ╔═╡ 060bc478-42ed-11eb-348a-9151d0e922f7
splice!(to_remove, test)

# ╔═╡ 59125ee8-42ed-11eb-3542-97ef27972eeb
to_remove

# ╔═╡ f078aa16-42ee-11eb-3a5e-b3e15fd996be
length(to_remove)

# ╔═╡ 30c5609e-42ef-11eb-2192-b55fbd3d9117
to_remove.b

# ╔═╡ 4136c37a-42ef-11eb-1cf3-730605a35461
to_remove.g

# ╔═╡ 446fd160-42ef-11eb-1c4a-6b3ef08da790
to_remove.r

# ╔═╡ 4c9365da-42ef-11eb-1267-bba560e658da
color_type(to_remove)

# ╔═╡ 7c035cf0-42ef-11eb-0e03-3deebb70be20
Gray.(test)

# ╔═╡ 2c5cf682-42f1-11eb-2df6-fd0f011892f3
floaty = float64.(test)

# ╔═╡ 43b0273c-42f1-11eb-1913-8fb68197b140
size(floaty)

# ╔═╡ 6a728abc-42f2-11eb-0ba4-35851b18884f
summary(floaty)

# ╔═╡ aeca591a-42f2-11eb-151d-6f91e731109c
floaty[end-5000:end]

# ╔═╡ dbdc8da6-42f2-11eb-3be6-6f2534c46a1c
mode(floaty)

# ╔═╡ dfcb378c-42f2-11eb-35d7-ef2bf7d5fb5b
b = floaty-mode(floaty)

# ╔═╡ eb5b08fc-42f2-11eb-2eef-e537c759b187
c = b - mode(b)

# ╔═╡ 0557a7c4-42f3-11eb-07c5-8939b379a026
d = c - mode(c)

# ╔═╡ 0bd7bca6-42f3-11eb-0465-31501db99fb6
e = d - mode(d)

# ╔═╡ 128ea79e-42f3-11eb-1ff6-1b3cc98007a5
floaty

# ╔═╡ caaf8810-42f9-11eb-1fdf-39cebeb0171d
function dewitt(img,n)
	counter = 0
	modes = []
	push!(modes, mode(img))
	
	
	while counter < n
		this_mode = mode((img-modes[1:end]))
		push!(modes, this_mode)
		counter += 1
	end
	
end

# ╔═╡ ee0082e6-42fa-11eb-2a7b-a96ad878ce9c
summary(floaty)

# ╔═╡ e663a5da-42f4-11eb-0f0c-e933e4de323e
onedim_floaty = reshape(floaty,(2073600))	

# ╔═╡ 23ebde74-42f5-11eb-37ca-c3cbc43b9e98
ndims(onedim_floaty)

# ╔═╡ 311c3904-42f5-11eb-1240-1996737cce47
length(onedim_floaty)

# ╔═╡ d6a715b6-42f4-11eb-324d-5539c2ae9160
md"### Using python to find most common clusters     
[https://towardsdatascience.com/finding-most-common-colors-in-python-47ea0767a06a](https://towardsdatascience.com/finding-most-common-colors-in-python-47ea0767a06a)"

# ╔═╡ bdd2d418-42fd-11eb-2227-d79ddf290602
# colorthief = pyimport("colorthief")

# ╔═╡ d7c255ba-42fd-11eb-308b-b1e8a03b4a2a
# color_thief = colorthief.ColorThief("/home/brad/Desktop/plains.jpg")

# ╔═╡ bde8c072-42fe-11eb-2a86-733ed6debe38
cols = color_thief.get_palette(color_count=8)

# ╔═╡ 799c8628-4301-11eb-3f7a-73ac9c544609
function convert_colors_to_julia(x::Array{Tuple{Int64,Int64,Int64}})
	
	color1 = RGB(cols[1][1]/255, cols[1][2]/255,  cols[1][3]/255)
	color2 = RGB(cols[2][1]/255, cols[2][2]/255,  cols[2][3]/255)
	color3 = RGB(cols[3][1]/255, cols[3][2]/255,  cols[3][3]/255)
	
	return (color1, color2, color3)
end

# ╔═╡ 983f1744-4301-11eb-3a99-43b1a6e47f37
convert_colors_to_julia(cols)

# ╔═╡ Cell order:
# ╠═b8293916-42e5-11eb-0a82-11d14d1b4ba1
# ╠═d5ea666e-42e5-11eb-2d9b-432c08b84a98
# ╠═e0c451bc-42e5-11eb-1e3e-417e400304ad
# ╠═fd62b854-42e5-11eb-0880-cf34d4d189ae
# ╠═28456c56-42e6-11eb-31f3-dfadfd7bc8a1
# ╟─4fd8f040-42ea-11eb-2548-bdb8e7cd15ec
# ╟─5a3a1c3a-42ea-11eb-134a-514790026194
# ╠═7009f8c4-42e9-11eb-2775-eb9f6cce20a2
# ╠═6b156e22-42e9-11eb-0e22-9d27615d22cc
# ╠═d963bbd6-42e9-11eb-3c7d-3b2722e77bc2
# ╠═37d03b70-42ea-11eb-1a05-ff87bd42f290
# ╠═4f305f60-42eb-11eb-33aa-1548a90f866a
# ╠═6f44c31e-42ea-11eb-3507-cbff33f47bc0
# ╟─c0b38aaa-42ea-11eb-06dc-6f53490d1ad3
# ╠═d22ada9a-42ea-11eb-380f-677bbeb7cf41
# ╠═f8a4e1f6-42eb-11eb-0588-cd1265323630
# ╠═46bf1bae-42ec-11eb-3dd6-3db6770bcf2b
# ╠═9cabda98-42ec-11eb-3b7c-eda2202fc177
# ╠═060bc478-42ed-11eb-348a-9151d0e922f7
# ╠═59125ee8-42ed-11eb-3542-97ef27972eeb
# ╠═f078aa16-42ee-11eb-3a5e-b3e15fd996be
# ╠═30c5609e-42ef-11eb-2192-b55fbd3d9117
# ╠═4136c37a-42ef-11eb-1cf3-730605a35461
# ╠═446fd160-42ef-11eb-1c4a-6b3ef08da790
# ╠═4c9365da-42ef-11eb-1267-bba560e658da
# ╠═7c035cf0-42ef-11eb-0e03-3deebb70be20
# ╠═3aa78d38-42f1-11eb-1005-2bf725559cb3
# ╠═2c5cf682-42f1-11eb-2df6-fd0f011892f3
# ╠═43b0273c-42f1-11eb-1913-8fb68197b140
# ╠═6a728abc-42f2-11eb-0ba4-35851b18884f
# ╠═aeca591a-42f2-11eb-151d-6f91e731109c
# ╠═dbdc8da6-42f2-11eb-3be6-6f2534c46a1c
# ╠═dfcb378c-42f2-11eb-35d7-ef2bf7d5fb5b
# ╠═eb5b08fc-42f2-11eb-2eef-e537c759b187
# ╠═0557a7c4-42f3-11eb-07c5-8939b379a026
# ╠═0bd7bca6-42f3-11eb-0465-31501db99fb6
# ╠═128ea79e-42f3-11eb-1ff6-1b3cc98007a5
# ╠═caaf8810-42f9-11eb-1fdf-39cebeb0171d
# ╠═ee0082e6-42fa-11eb-2a7b-a96ad878ce9c
# ╠═e663a5da-42f4-11eb-0f0c-e933e4de323e
# ╠═23ebde74-42f5-11eb-37ca-c3cbc43b9e98
# ╠═311c3904-42f5-11eb-1240-1996737cce47
# ╟─d6a715b6-42f4-11eb-324d-5539c2ae9160
# ╠═34165c74-42fb-11eb-2d74-512a600c05ba
# ╠═bdd2d418-42fd-11eb-2227-d79ddf290602
# ╠═d7c255ba-42fd-11eb-308b-b1e8a03b4a2a
# ╠═bde8c072-42fe-11eb-2a86-733ed6debe38
# ╠═799c8628-4301-11eb-3f7a-73ac9c544609
# ╠═983f1744-4301-11eb-3a99-43b1a6e47f37
