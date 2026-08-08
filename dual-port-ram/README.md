# 64 × 16 Dual-Port RAM

## Overview

A synchronous dual-port RAM designed and verified using Verilog.

The memory contains 64 locations, with each location storing 16 bits of data.

The RAM has two independent ports, Port A and Port B, allowing two memory operations to occur on the same clock cycle.

## Specifications

- Memory depth: 64 locations
- Data width: 16 bits
- Address width: 6 bits
- Number of ports: 2
- Clock: Positive-edge triggered
- Write enable: Separate for each port

## Ports

### Port A

| Signal | Width | Description |
|---|---:|---|
| `addr_a` | 6 bits | Address selected by Port A |
| `data_a` | 16 bits | Data input for Port A |
| `we_a` | 1 bit | Write enable for Port A |
| `q_a` | 16 bits | Data output from Port A |

### Port B

| Signal | Width | Description |
|---|---:|---|
| `addr_b` | 6 bits | Address selected by Port B |
| `data_b` | 16 bits | Data input for Port B |
| `we_b` | 1 bit | Write enable for Port B |
| `q_b` | 16 bits | Data output for Port B |

### Common Signal

| Signal | Width | Description |
|---|---:|---|
| `clk` | 1 bit | Common clock |

## Operation

### Write

When `we_a = 1`, Port A writes `data_a` into the memory location specified by `addr_a`.

When `we_b = 1`, Port B writes `data_b` into the memory location specified by `addr_b`.

### Read

When the corresponding write enable is `0`, the selected memory location is read and the value is available at the corresponding output.

## Verification

The design was verified using a Verilog testbench and simulated using Icarus Verilog with EPWave.

The testbench checks:

1. Simultaneous write through both ports
2. Simultaneous read through both ports
3. Port A write while Port B reads
4. Reading previously stored values
5. Same-address access

## Simulation Waveform

![Dual-Port RAM Waveform](waveform.png)
