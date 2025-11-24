----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.10.2025 16:41:15
-- Design Name: 
-- Module Name: SRAM_crtl_module - SRAM_crtl_module_arch
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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity SRAM_crtl_module is
 Port ( 
        
        clock                   : in  STD_LOGIC;
        reset                   : in  STD_LOGIC;
        write_cmd               : in  STD_LOGIC;
        read_cmd                : in  STD_LOGIC;
        user_address            : in  STD_LOGIC_VECTOR (18 downto 0);
        user_data               : inout  STD_LOGIC_VECTOR (35 downto 0);
        tristate                : out STD_LOGIC;
        cke                     : out STD_LOGIC;
        ce                      : out STD_LOGIC;
        ce2                     : out STD_LOGIC;
        -- avance du busrt adv_ld                  : out STD_LOGIC; 
        rw                      : out STD_LOGIC;
        bw                      : out STD_LOGIC_VECTOR (3 downto 0);
        addr                    : out STD_LOGIC_VECTOR (18 downto 0);
        oe                      : out STD_LOGIC;
        zz                      : out STD_LOGIC;
        dq_in                   : in STD_LOGIC_VECTOR (35 downto 0);
        dq_out                  : out STD_LOGIC_VECTOR (35 downto 0);
        mode                    : out STD_LOGIC
    );
end SRAM_ctrl_module;

architecture SRAM_crtl_module_arch of SRAM_crtl_module is
    signal bwa_n_s, bwb_n_s, bwd_n_s, zz_s, mode_s, cke_s: STD_LOGIC :='0';
    signal clock_s : STD_LOGIC :='0';
    constant delay_clk : TIME := 15 ns;
    signal reset_s: STD_LOGIC :='0'; 
    
    
 

 component IOBUF
    port (
        I : in std_logic;
        IO: inout std_logic;
        T : in std_logic;
        O : out std_logic
    );
    end component;
    



begin


     
     

end SRAM_crtl_module_arch;
