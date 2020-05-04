const IdProp = Tuple{Symbol, Symbol}

struct CallbackId
    state ::Vector{IdProp}
    input ::Vector{IdProp}
    output ::Vector{IdProp}    
end

CallbackId(;input ::Union{Vector{IdProp}, IdProp},
            output ::Union{Vector{IdProp}, IdProp},
            state ::Union{Vector{IdProp}, IdProp} = Vector{IdProp}()
            ) = CallbackId(state, input, output)


Base.convert(::Type{Vector{IdProp}}, v::IdProp) = [v]

struct Callback
    func ::Function
    id ::CallbackId
    pass_changed_props ::Bool
end

struct PreventUpdate <: Exception
    
end


struct NoUpdate
end

no_update() = NoUpdate()

const ExternalSrcType = Union{String, Dict{String, String}}