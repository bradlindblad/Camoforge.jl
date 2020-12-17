using Camoforge
using Documenter

makedocs(;
    modules=[Camoforge],
    authors="bradlindblad <bradley.lindblad@gmail.com> and contributors",
    repo="https://github.com/bradlindblad/Camoforge.jl/blob/{commit}{path}#L{line}",
    sitename="Camoforge.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://bradlindblad.github.io/Camoforge.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/bradlindblad/Camoforge.jl",
    devbranch="main"
)
