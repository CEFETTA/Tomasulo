library verilog;
use verilog.vl_types.all;
entity RSadders is
    port(
        instruction     : in     vl_logic_vector(15 downto 0);
        Clock           : in     vl_logic;
        Adderin         : in     vl_logic;
        Busy            : out    vl_logic_vector(7 downto 0);
        R1              : in     vl_logic_vector(15 downto 0);
        R2              : in     vl_logic_vector(15 downto 0);
        R3              : in     vl_logic_vector(15 downto 0);
        R4              : in     vl_logic_vector(15 downto 0);
        R5              : in     vl_logic_vector(15 downto 0);
        R6              : in     vl_logic_vector(15 downto 0);
        R7              : in     vl_logic_vector(15 downto 0);
        instOutEnable   : out    vl_logic;
        instOut         : out    vl_logic_vector(15 downto 0);
        done            : out    vl_logic;
        dout            : out    vl_logic_vector(15 downto 0);
        doutAddress     : out    vl_logic_vector(2 downto 0)
    );
end RSadders;
