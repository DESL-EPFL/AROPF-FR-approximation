# Test Networks for Flexibility Region Approximation

This repository provides the test network datasets used in the manuscript:

**"Explicit Convex Inner Approximation of TSO-DSO Flexibility Regions via Exact Second-order Cone Relaxation in Radial Networks"**

The datasets accompany the manuscript submitted for publication and are made publicly available to support reproducibility of the numerical experiments.

The test cases include radial networks:

- an illustrative 4-node network
- several networks from MATPOWER cases
- a synthetic Swiss distribution network from this [work](https://github.com/aeonetos/Swiss-PDGs).

To investigate flexibility region approximation, selected networks have been modified by introducing some flexible generators, storages, and loads.

## Repository Structure

```text
.
├── README.md
├── BasicTypes.jl
└── cases/
    ├── case_4-node.json
    ├── case_12-node.json
    ├── case_33-node.json
    ├── case_74-node.json
    ├── case_85-node.json
    ├── case_94-node.json
    ├── case_118-node.json
    ├── case_141-node.json
    └── case_Swiss-PDG.json
```

- `BasicTypes.jl` defines the Julia data structures.
- `cases/` contains the modified test networks in JSON format.

## Test Cases and Original Sources

The following table lists the test cases and their corresponding original sources.

| Test case | Original network source |
|---|---|
| 4-node | Illustrative network |
| 12-node | [MATPOWER `case12da.m`](https://github.com/MATPOWER/matpower/blob/master/data/case12da.m) |
| 33-node | [MATPOWER `case33bw.m`](https://github.com/MATPOWER/matpower/blob/master/data/case33bw.m) |
| 74-node | [MATPOWER `case74ds.m`](https://github.com/MATPOWER/matpower/blob/master/data/case74ds.m) |
| 85-node | [MATPOWER `case85.m`](https://github.com/MATPOWER/matpower/blob/master/data/case85.m) |
| 94-node | [MATPOWER `case94pi.m`](https://github.com/MATPOWER/matpower/blob/master/data/case94pi.m) |
| 118-node | [MATPOWER `case118zh.m`](https://github.com/MATPOWER/matpower/blob/master/data/case118zh.m) |
| 141-node | [MATPOWER `case141.m`](https://github.com/MATPOWER/matpower/blob/master/data/case141.m) |
| Swiss-PDG | [Swiss-PDGs](https://github.com/aeonetos/Swiss-PDGs/tree/main/grids/matpower_data/LV/Midlands-Urban/1024-10_0_6), ID: `1024-10_0_6` |

### Modifications to the Original Networks

Depending on the test case, modifications include:

- Addition of flexible generators and storage systems at selected non-slack buses.
- Introduction of box constraints on active and reactive power injections.
- Introduction of flexible loads with up to 10% demand reduction in selected networks.
- Adjustment of voltage and branch current limits for the numerical experiments.

The modified configurations are explicitly stored in the JSON files.

## Data Format

Each JSON file contains five top-level dictionaries:

```json
{
  "buses": {},
  "branches": {},
  "gens": {},
  "loads": {},
  "storages": {}
}
```

Their entries correspond to the structures defined in `BasicTypes.jl`.

| Component | Description |
|:---:|---|
| `buses` | Bus types, nominal voltage bases, and voltage limits |
| `branches` | Branch connectivity, resistance, reactance, shunt susceptances, and current limits |
| `gens` | Generator locations, operating points, and power limits |
| `loads` | Load locations, operating points, and flexibility limits |
| `storages` | Storage locations, power limits, and energy-related parameters |

### Units and Conventions

All electrical quantities in the test datasets are expressed in the per-unit system, using the corresponding network base quantities.

The main parameters are:

| Parameter | Description |
|:---|---|
| `P_op`, `Q_op` | Initial active/reactive power operating points |
| `P_min`, `P_max` | Active power limits |
| `Q_min`, `Q_max` | Reactive power limits |
| `r`, `x` | Branch resistance and reactance |
| `b_fr`, `b_to` | Branch shunt susceptances at the sending and receiving ends |
| `i_max` | Branch current magnitude limit |
| `v_min`, `v_max` | Bus voltage magnitude limits |
| `base_kv` | Voltage-base parameter |

**Note:** `v_min` and `v_max` represent voltage magnitude limits, while `i_max` represents a current magnitude limit. These quantities must be squared when used in formulations whose optimization variables represent squared voltage or current magnitudes.

## Attribution

The underlying network topologies and electrical parameters originate from the references listed above. The authors of this repository acknowledge the original dataset developers and MATPOWER contributors. The modifications made for the accompanying manuscript, including flexible resource allocation and operating constraints, are provided solely for research reproducibility.
