module Experiments
using Plots
include("CompleteIntersections.jl")

function classic_plot(N, multidegrees)
    # N = int which is ambient dimension
    # multidegrees = array of multidegrees
    c1_sq_array = []
    c2_array = []
    for md in multidegrees
        push!(c1_sq_array, CompleteIntersections.classic_projective_ci_chern(N, md)[1])
        push!(c2_array, CompleteIntersections.classic_projective_ci_chern(N, md)[2])
    end

    plot(c1_sq_array,
    c2_array,
    seriestype = :scatter,
    title = "P^$N, multidegrees in $multidegrees",
    xaxis = "c_1^2",
    yaxis = "c_2")
end

function weighted_plot(weights, multidegrees)
    # weights = tuple of ints which are weights
    # multidegrees = array of multidegrees
    c1_sq_array = []
    c2_array = []
    for md in multidegrees
        push!(c1_sq_array, CompleteIntersections.weighted_projective_ci_chern(weights, md)[1])
        push!(c2_array, CompleteIntersections.weighted_projective_ci_chern(weights, md)[2])
    end

    plot(c1_sq_array,
    c2_array,
    seriestype = :scatter,
    title = "P$weights, multidegrees in $multidegrees",
    xaxis = "c_1^2",
    yaxis = "c_2")
end

function weighted_plot_example()
    weights = (1,1,2,7)
    multidegrees = 1:18

    weighted_plot(weights, multidegrees)
end

function classic_plot_example()
    N = 3
    multidegrees = 1:18

    classic_plot(N, multidegrees)
end

end#module
