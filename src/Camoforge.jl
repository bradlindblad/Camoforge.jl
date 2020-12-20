__precompile__()
module Camoforge

using Colors
using Images
using PyCall

export get_image
export most_common_colors



include("image_utils/get_image.jl")
include("image_utils/most_common_colors.jl")

end
