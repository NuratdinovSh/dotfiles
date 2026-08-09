hl.curve("crv", { type = "bezier", points = { {0.22, 1}, {0.36, 1} } })

hl.animation({ leaf = "windowsIn", enabled = true, speed = 3, bezier = "crv", style = "popin 80%"})
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "crv", style = "popin 80%"})
hl.animation({ leaf = "windowsMove", enabled = true, speed = 4, bezier = "crv"})
hl.animation({ leaf = "fadeIn", enabled = true, speed = 3, bezier = "crv"})
hl.animation({ leaf = "fadeOut", enabled = true, speed = 3, bezier = "crv"})
hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "crv", style = "slide"})
