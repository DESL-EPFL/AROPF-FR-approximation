module BasicTypes
    @kwdef mutable struct GenParams
        bus::Int
        P_op::Float64
        Q_op::Float64
        P_min::Float64
        P_max::Float64
        Q_min::Float64
        Q_max::Float64
        type::String = "Gen"
    end

    @kwdef mutable struct LoadParams
        bus::Int
        P_op::Float64
        Q_op::Float64
        P_min::Float64
        P_max::Float64
        Q_min::Float64
        Q_max::Float64
        type::String = "Load"
    end

    @kwdef mutable struct StorageParams
        bus::Int
        P_op::Float64
        Q_op::Float64
        P_min::Float64
        P_max::Float64
        Q_min::Float64
        Q_max::Float64
        E_min::Float64 = 0.1
        E_max::Float64 = 1.0
        E_init::Float64 = 0.5
        eta::Float64 = 0.95
        tau::Float64 = 1.0/6.0
        #default type "BESS"
        type::String = "BESS"
    end

    @kwdef mutable struct BranchParams
        f_bus::Int
        t_bus::Int
        r::Float64
        x::Float64
        b_fr::Float64
        b_to::Float64
        i_max::Float64
        type::String = "Branch"
    end


    @kwdef mutable struct BusParams
        bus_type::Int
        base_kv::Float64
        v_min::Float64
        v_max::Float64
    end

    @kwdef mutable struct PowerSystemParams
        buses::Dict{Int, BusParams}
        branches::Dict{Int, BranchParams}
        gens::Dict{Int, GenParams}
        loads::Dict{Int, LoadParams}
        storages::Dict{Int, StorageParams}
    end
end