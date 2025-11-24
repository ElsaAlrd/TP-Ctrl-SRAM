----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.11.2025 09:42:28
-- Design Name: 
-- Module Name: Tb_SRAM_Ctrl_Module - Tb_SRAM_Ctrl_Module_arch
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
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity Tb_SRAM_Ctrl_Module is
end Tb_SRAM_Ctrl_Module;

architecture Tb_SRAM_Ctrl_Module_arch of Tb_SRAM_Ctrl_Module is

-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT test_io
	PORT(
		CLK : IN std_logic;
		nRESET : IN std_logic;
		TRIG : IN std_logic;
		ENTREE : IN std_logic;    
		E_S : INOUT std_logic;      
		SORTIE : OUT std_logic
		);
	END COMPONENT;


component mt55l512y36f is
    generic (
      
      addr_bits : integer := 19;
      data_bits : integer := 36;

      -- Timing parameters for -10 (100 Mhz)
      tKHKH : time := 10.0 ns;
      tKHKL : time := 2.5 ns;
      tKLKH : time := 2.5 ns;
      tKHQV : time := 5.0 ns;
      tAVKH : time := 2.0 ns;
      tEVKH : time := 2.0 ns;
      tCVKH : time := 2.0 ns;
      tDVKH : time := 2.0 ns;
      tKHAX : time := 0.5 ns;
      tKHEX : time := 0.5 ns;
      tKHCX : time := 0.5 ns;
      tKHDX : time := 0.5 ns
      );

    
    -- Port Declarations
    PORT (
        Dq        : INOUT STD_LOGIC_VECTOR (data_bits - 1 DOWNTO 0);   -- Data I/O
        Addr      : IN    STD_LOGIC_VECTOR (addr_bits - 1 DOWNTO 0);   -- Address
        Lbo_n     : IN    STD_LOGIC;                                   -- Burst Mode
        Clk       : IN    STD_LOGIC;                                   -- Clk
        Cke_n     : IN    STD_LOGIC;                                   -- Cke#
        Ld_n      : IN    STD_LOGIC;                                   -- Adv/Ld#
        Bwa_n     : IN    STD_LOGIC;                                   -- Bwa#
        Bwb_n     : IN    STD_LOGIC;                                   -- BWb#
        Bwc_n     : IN    STD_LOGIC;                                   -- Bwc#
        Bwd_n     : IN    STD_LOGIC;                                   -- BWd#
        Rw_n      : IN    STD_LOGIC;                                   -- RW#
        Oe_n      : IN    STD_LOGIC;                                   -- OE#
        Ce_n      : IN    STD_LOGIC;                                   -- CE#
        Ce2_n     : IN    STD_LOGIC;                                   -- CE2#
        Ce2       : IN    STD_LOGIC;                                   -- CE2
        Zz        : IN    STD_LOGIC                                    -- Snooze Mode
    );
  end component;

 component SRAM_Ctrl_Module is
    Port (
        clock           : in  STD_LOGIC;
        reset           : in  STD_LOGIC;
        write_cmd       : in  STD_LOGIC;
        read_cmd        : in  STD_LOGIC;
        user_address    : in  STD_LOGIC_VECTOR (18 downto 0);
        user_data       : inout  STD_LOGIC_VECTOR (35 downto 0);
        cke             : out STD_LOGIC;
        ce              : out STD_LOGIC;
        ce2             : out STD_LOGIC;
        --adv_ld          : out STD_LOGIC;
        rw              : out STD_LOGIC;
        bw              : out STD_LOGIC_VECTOR (3 downto 0);
        addr            : out STD_LOGIC_VECTOR (18 downto 0);
        dq_in           : in STD_LOGIC_VECTOR (35 downto 0);
        dq_out          : out STD_LOGIC_VECTOR (35 downto 0);
        oe              : out STD_LOGIC;
        zz              : out STD_LOGIC;
        mode            : out STD_LOGIC
    );
end component;


    
constant TCLKH    : time := 15 ns;
constant TCLKL    : time := 15 ns;
  	
    signal clock        : std_logic := '0';
    signal reset        : std_logic := '0';
    signal write_cmd    : std_logic := '0';
    signal read_cmd     : std_logic := '0';
    signal user_address : std_logic_vector(18 downto 0);
    signal user_data    : std_logic_vector(35 downto 0);
    signal cke          : std_logic;
    signal ld_n         : std_logic;
    signal ce           : std_logic;
    signal ce2          : std_logic;
    --signal adv_ld  : std_logic;
    signal rw           : std_logic;
    signal bw           : std_logic_vector(3 downto 0);
    signal addr         : std_logic_vector(18 downto 0);
    signal dq_in        : std_logic_vector(35 downto 0);
    signal dq_out       : std_logic_vector(35 downto 0);
    signal oe           : std_logic;
    signal zz           : std_logic;
    signal mode         : std_logic;
    signal dq           : std_logic_vector(35 downto 0);

begin

-- Instanciation 
 utt: mt55l512y36f
 PORT MAP (
      Dq    => dq,
      Addr  => addr,
      Lbo_n => mode,        
      Clk   => clock,
      Cke_n => cke,
      Ld_n  => ld_n,
      Bwa_n => bw(0),
      Bwb_n => bw(1),
      Bwc_n => bw(2),
      Bwd_n => bw(3),
      Rw_n  => rw,
      Oe_n  => oe,
      Ce_n  => ce,
      Ce2_n => ce2,
      Ce2   => ce2,
      Zz    => zz
 );
 
 inst_sram_ctrl: Sram_Ctrl_Module
 Port map(
    
      clock        => clock,
      reset        => reset,
      write_cmd    => write_cmd,
      read_cmd     => read_cmd,
      user_address => user_address,
      user_data    => user_data,
      cke          => cke,
      ce           => ce,
      ce2          => ce2,
      -- adv_ld       => adv_ld,
      rw           => rw,
      bw           => bw,
      addr         => addr,
      dq_in        => dq_in,
      dq_out       => dq_out,
      oe           => oe,
      zz           => zz,
      mode         => mode
      );

-- Clock process
 process
  begin
    clock <= '0';
    wait for 15 ns ;
    clock <= '1';
    wait for 15 ns;
  end process;
  
 -- Reset process 
 process 
 begin 
    reset <= '1';
    wait for 100 ns;
    reset <= '0';
  
  -- lire adress 00001
    wait for 100 ns;
    read_cmd <= '1';
    user_address <= "0000000000000000001";
    wait for 10 ns;
    read_cmd <= '0';
    
    -- écrire pour adress 00001
    wait for 100 ns;
    write_cmd <= '1';
    user_address <= "0000000000000000001";
    user_data <= (others => '0');
    wait for 10 ns;
    write_cmd <= '0';
    
  -- lire adress 00002 
    wait for 100ns; 
    read_cmd <='1'; 
    user_address <= "0000000000000000010";
    wait for 10ns; 
    read_cmd <='0';
    
  -- ecrire 
     wait for 100 ns;
    write_cmd <= '1';
    user_address <= "0000000000000000010";
    user_data <= (others => '0');
    wait for 10 ns;
    write_cmd <= '0';
    
    --lire 
    wait; 
    end process;
    
    
    
  
 
 
end Tb_SRAM_Ctrl_Module_arch;
