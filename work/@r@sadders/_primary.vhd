library verilog;
use verilog.vl_types.all;
entity RSadders is
    port(
        OP              : in     vl_logic_vector(15 downto 0);
        Clock           : in     vl_logic;
        Adderin         : in     vl_logic;
        Busy            : out    vl_logic
    );
end RSadders;
