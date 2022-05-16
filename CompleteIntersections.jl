module CompleteIntersections

function classic_projective_ci_chern(n,D)
  if length(D) != n-2
    error("Did not intersect with n-2 hyperplanes")
  end 
  Πdᵢ = prod(D)
  println(Πdᵢ)
  nD = length(D)
  Σdᵢdⱼ = sum(D[i]*D[j] for i in 1:nD for j in 1:nD if i ≤ j) 
  println(binomial(n+1,2))
  c₁_sq = Πdᵢ * (sum(D) - (n + 1))^2
  c₂ = Πdᵢ * ( Σdᵢdⱼ + binomial(n+1,2) - (n+1)*sum(D) ) 
  (c₁_sq, c₂)
end


end#module
