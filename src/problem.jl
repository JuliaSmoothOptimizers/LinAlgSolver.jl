export LinAlgProblem

mutable struct LinAlgProblem{T, S}
  A
  b::S
  name
end

SolverCore.problem_name(p::LinAlgProblem{T, S}) where {T, S} = p.name
SolverCore.problem_info(::Type{<: LinAlgProblem}) = (
  [Int, Int],
  [:nrows, :ncols],
  p -> [size(p.A)...],
)
function SolverCore.output_info(::Type{<: LinAlgProblem})
  [], [], o -> []
end

function LinAlgProblem(A, b::S; kwargs...) where {S}
  T = eltype(b)
  LinAlgProblem{T, S}(A, b, kwargs...)
end

function LinAlgProblem{T, S}(A, b::S; name="noname") where {T, S}
  LinAlgProblem{T, S}(A, b, name)
end

function SolverCore.reset_problem!(::LinAlgProblem) end