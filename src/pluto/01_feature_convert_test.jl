### A Pluto.jl notebook ###
# v0.12.17

using Markdown
using InteractiveUtils

# ╔═╡ 695567b6-4307-11eb-3a59-7507eeb658d7
using Pkg;Pkg.activate()

# ╔═╡ 799dec10-4307-11eb-0fd0-6d19c3ac98e3
using Camoforge

# ╔═╡ bc46e572-430b-11eb-2bd5-3fa2afb8d877
Camoforge.get_image("/home/brad/Desktop/plains.jpg")

# ╔═╡ ed9a62ce-4307-11eb-27a0-c34b698ac0c0
Camoforge.most_common_colors("/home/brad/Desktop/plains.jpg", 10)

# ╔═╡ d329324a-430b-11eb-21b2-891efa3f11b6
Camoforge.get_image("/home/brad/Desktop/test.jpg")

# ╔═╡ b712ba46-430a-11eb-0fdc-a30ac392a610
Camoforge.most_common_colors("/home/brad/Desktop/test.jpg", 10)

# ╔═╡ Cell order:
# ╠═695567b6-4307-11eb-3a59-7507eeb658d7
# ╠═799dec10-4307-11eb-0fd0-6d19c3ac98e3
# ╠═bc46e572-430b-11eb-2bd5-3fa2afb8d877
# ╠═ed9a62ce-4307-11eb-27a0-c34b698ac0c0
# ╠═d329324a-430b-11eb-21b2-891efa3f11b6
# ╠═b712ba46-430a-11eb-0fdc-a30ac392a610
