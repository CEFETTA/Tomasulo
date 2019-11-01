library verilog;
use verilog.vl_types.all;
entity RSload is
    port(
        clock           : in     vl_logic;
        instruction     : in     vl_logic_vector(15 downto 0);
        instructionIn   : in     vl_logic;
        registerStatusB0: in     vl_logic_vector(7 downto 0);
        registerStatusB1: in     vl_logic_vector(7 downto 0);
        registerStatusB2: in     vl_logic_vector(7 downto 0);
        registerStatusB3: in     vl_logic_vector(7 downto 0);
        done            : in     vl_logic;
        doneInst        : in     vl_logic_vector(15 downto 0);
        requestRegister : out    vl_logic_vector(2 downto 0);
        requestAddress  : out    vl_logic_vector(15 downto 0);
        requestEnable   : out    vl_logic;
        R1              : in     vl_logic_vector(15 downto 0);
        R2              : in     vl_logic_vector(15 downto 0);
        R3              : in     vl_logic_vector(15 downto 0);
        R4              : in     vl_logic_vector(15 downto 0);
        R5              : in     vl_logic_vector(15 downto 0);
        R6              : in     vl_logic_vector(15 downto 0);
        R7              : in     vl_logic_vector(15 downto 0);
        registerStatusChange: out    vl_logic_vector(3 downto 0);
        registerStatusAddr: out    vl_logic_vector(7 downto 0);
        registerStatusEnable: out    vl_logic
    );
end RSload;
