using Camoforge
using Test

@testset "get_image.jl" begin

    @test_nowarn Camoforge.get_image("src/pics/test1.jpg")

end

@testset "most_common_colors.jl" begin

    @test length(Camoforge.most_common_colors("src/pics/test1.jpg", 2)) == 1

    @test length(Camoforge.most_common_colors("src/pics/test1.jpg", 3)) == 2

    @test length(Camoforge.most_common_colors("src/pics/test2.jpg", 2)) == 1

    @test length(Camoforge.most_common_colors("src/pics/test2.jpg", 3)) == 2


end

@testset "digital.jl" begin



end
