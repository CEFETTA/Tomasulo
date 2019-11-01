library verilog;
use verilog.vl_types.all;
entity IQ is
    port(
        Clock           : in     vl_logic;
        Reset           : in     vl_logic;
        Run             : in     vl_logic
    );
end IQ;
