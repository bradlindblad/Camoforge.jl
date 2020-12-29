

using Gadfly

Gadfly.plot(x = x, y = y, Geom.point)

plot(x=[0, 1, 1, 2, 2, 3, 3, 2, 2, 1, 1, 0, 4, 5, 5, 4],
     y=[0, 0, 1, 1, 0, 0, 3, 3, 2, 2, 3, 3, 0, 0, 3, 3],
     group=["H", "H", "H", "H", "H", "H", "H", "H",
            "H", "H", "H", "H", "I", "I", "I", "I"],
     Geom.polygon(preserve_order=true, fill=true))

     x=[0, 1, 1, 2, 2, 3, 3, 2, 2, 1, 1, 0, 4, 5, 5, 4]
     y=[0, 0, 1, 1, 0, 0, 3, 3, 2, 2, 3, 3, 0, 0, 3, 3]

     brad = zip(x,y)

plot(x=[4,5,5,4],
    y = [0,0,3,3],
    Geom.polygon(fill=true))






function gen_poly_layer(x)
    # x = (10,2)

    input_array = [
                    [x[1], x[2]],
                    [x[1] + 1, x[2]],
                    [x[1] + 1, x[2] + 1],
                    [x[1], x[2] + 1]
    ]

    xs = map(x->x[1], input_array)
    ys = map(x->x[2], input_array)

    layer(x=xs, y=ys, Geom.polygon(fill=true))

end



# 1. create 2 arrays of cartesian inputs
all_x = rand(1:2000, 600)

all_y = rand(20:500, 600)

# 2. combine those into cartesian coord arrays
# foo = hcat(all_x, all_y)
# foo[n,1:2]

# cart_arr = [[a, b] for a in all_x, b in all_y]

# cart_arr = []
# for i in all_x
#     for j in all_y
#     to_push = [i,j]
#     push!(cart_arr, to_push)
#     end
# end

# [all_x[1], all_y[1]]

# all_x[1]
# all_y[1]
cart_arr = collect(zip(all_x, all_y))

# 3. now gen poly for all

set_default_plot_size(127cm ,127cm)
layer_list = map(x -> gen_poly_layer(x), cart_arr);

output = Gadfly.plot(layer_list...)


# 4. save it
img = PNG("/home/brad/Desktop/digital_output.png", 127cm, 127cm)
draw(img, output)
