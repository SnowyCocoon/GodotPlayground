# Planet Jumper:smiling_imp:
Basic Planet jumping with Gravity

# Based on:
1. https://www.youtube.com/watch?v=zuEPWtPRsgE
2. https://www.youtube.com/watch?v=aL8TB_mB3j8

# Mechanics
We're jumping between 2 planets. Player is a "RigidBody". We're using "Area" Node for simulating planet gravity (gravity_point). Planet is using "StaticBody".

1. We get the direction vector between the player and the center of the planet
2. We align the player Y-Axis with that direction vector

![Visual](https://github.com/SnowyCocoon/GodotPlayground/blob/master/PlanetJump/grtmcI3.png)

Dont forget to turn off gravity in the editor settings (from 9.8 to 0)
