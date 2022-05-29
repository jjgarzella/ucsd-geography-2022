module CompleteIntersections

function classic_projective_ci_chern(n,D)
  if length(D) != n-2
    error("Did not intersect with n-2 hyperplanes")
  end 
  Πdᵢ = prod(D)
  nD = length(D)
  Σdᵢdⱼ = sum(D[i]*D[j] for i in 1:nD for j in 1:nD if i ≤ j) 

  c₁_sq = Πdᵢ * (sum(D) - (n + 1))^2
  c₂ = Πdᵢ * ( Σdᵢdⱼ + binomial(n+1,2) - (n+1)*sum(D) ) 

  (c₁_sq, c₂)
end

function weighted_projective_ci_chern(A,D)
  nA = length(A)
  nD = length(D)
  if nD != nA - 3
    error("Did not intersect with n-2 hyperplanes")
  end 
  Πaᵢ = prod(A)
  Σaᵢ = sum(A)
  Πdᵢ = prod(D)
  Σdᵢ = sum(D)
  Σaᵢaⱼ = sum(A[i]*A[j] for i in 1:nD for j in 1:nA if i < j) 
  Σdᵢdⱼ = sum(D[i]*D[j] for i in 1:nD for j in 1:nD if i ≤ j)
  Σaᵢdⱼ = sum(A[i]*D[j] for i in 1:nA for j in 1:nD)

  c₁_sq = (Σdᵢ - Σaᵢ)^2 * (Πdᵢ) / Πaᵢ
  c₂ = (Σdᵢdⱼ + Σaᵢaⱼ + Σaᵢdⱼ) * (Πdᵢ) / Πaᵢ
  # c₁_sq = (Σdᵢ - Σaᵢ)^2 * (Πdᵢ) * lcm(A...)^(nA-1) / Πaᵢ
  # c₂ = (Σdᵢdⱼ + Σaᵢaⱼ + Σaᵢdⱼ) * (Πdᵢ) * lcm(A...)^(nA-1) / Πaᵢ

  (c₁_sq, c₂)
end

end#module
