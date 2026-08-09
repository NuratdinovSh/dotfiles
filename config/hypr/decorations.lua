hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 50,
	border_size = 0,
        resize_on_border = true,
    },

    decoration = {
        rounding       = 15,
        rounding_power = 2,
	dim_inactive   = true,
	dim_strength   = 0.15,
        shadow = {
            enabled      = true,
            range        = 10,
            render_power = 10,
	    color        = 0xaa1a1a1a
        },
    },

    animations = {
        enabled = true,
    },
})
