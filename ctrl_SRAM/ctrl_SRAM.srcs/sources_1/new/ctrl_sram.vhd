----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.10.2025 15:02:47
-- Design Name: 
-- Module Name: ctrl_sram - ctrl_sram_bh
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- pour IOBUF Xilinx
library unisim;
use unisim.vcomponents.all

entity ctrl_sram is
generic ( 
adrr_width : integer := 19;
data_width : integer := 36
);
end ctrl_sram;
 port (
    clk     : in  std_logic;
    rst   : in  std_logic;

    READ    : in  std_logic;
    WRITE   : in  std_logic;
    ADDR_IN   : in std_logic_vector(ADDR_WIDTH-1 downto 0); -- adresse départ
    DATA_IN   : in std_logic_vector(DATA_WIDTH-1 downto 0);
    DATA_OUT  : out std_logic_vector(DATA_WIDTH-1 downto 0);
    BUSY      : out std_logic;
    READY     : out std_logic;
    ADDR_OUT  : out std_logic_vector(ADDR_WIDTH-1 downto 0);
    OE_n   : out std_logic;
    WE_n   : out std_logic;  -- active low: '0' = write
    CE_n   : out std_logic;
    ADV_LD_n : out std_logic;

    CKE_n  : out std_logic
    );

architecture ctrl_sram_bh of ctrl_sram is

begin


end ctrl_sram_bh;
