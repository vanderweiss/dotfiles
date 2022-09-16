require('colorizer').setup {
	filetypes = { "*" },
      user_default_options = {
        RGB = true, 
        RRGGBB = true,
        names = false,  
        RRGGBBAA = true,
        AARRGGBB = true,
        rgb_fn = true, 
        hsl_fn = true, 
        css = true, 
        css_fn = true, 
        mode = "foreground", 
        tailwind = false, 
        sass = { enable = false, parsers = { css }, }, 
        virtualtext = "■",
      },
      buftypes = {},
}
