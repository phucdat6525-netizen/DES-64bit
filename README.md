🔐 DES Algorithm Implementation in HDL
Overview
This repository contains a high-performance hardware implementation of the Data Encryption Standard (DES) algorithm using Verilog. Unlike software-based approaches, this project focuses on hardware efficiency, utilizing concurrent processing and bit-level manipulations to achieve robust encryption and decryption.

Hardware Architecture
The design follows the classic Feistel Network structure, optimized for FPGA/ASIC deployment:

Block Size: 64-bit data blocks.

Key Management: Processes a 64-bit input key to derive 16 unique 48-bit subkeys through a dedicated Key Scheduling logic.

Core Logic: Implements 16 rounds of permutations and substitutions, including:

Non-linear substitution using optimized S-Boxes.

Technical Specifications
Language: Verilog HDL 

Design Style: Structural & Behavioral Modeling.

Resource Optimization: Efficient LUT (Look-Up Table) usage for S-Box implementation.

Key Features
Bit-Level Precision: Leverages HDL's strength in direct wire-mapping and bit-wise operations.

Symmetric Encryption: Supports both encryption and decryption modes using the same core logic with reversed subkeys.

Modular Design: Separated modules for Key Generation, F-Function, and Round Logic for easy testing and integration.
