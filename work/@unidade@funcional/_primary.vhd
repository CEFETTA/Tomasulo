library verilog;
use verilog.vl_types.all;
entity UnidadeFuncional is
    port(
        clock           : in     vl_logic;
        instruction     : in     vl_logic_vector(15 downto 0);
        instructIn      : in     vl_logic;
        done            : out    vl_logic;
        dout            : out    vl_logic_vector(15 downto 0);
        reg1            : in     vl_logic_vector(15 downto 0);
        reg2            : in     vl_logic_vector(15 downto 0)
    );
end UnidadeFuncional;
