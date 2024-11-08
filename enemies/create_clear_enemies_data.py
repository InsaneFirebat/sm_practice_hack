#!/usr/bin/env python
import io
import os
import sys

if len(sys.argv) != 3:
   print("create_clear_enemies_data.py <output> <input>")
   sys.exit()

output_asm = sys.argv[1]
input_txt = sys.argv[2]

f_input = io.open(os.path.join(os.path.dirname(os.path.realpath(__file__)), input_txt), "r")
input_lines = f_input.readlines()
f_input.close()

enemies = {}

for line in input_lines:
   parts = line.split('=')
   if len(parts) == 2:
      enemy_id = parts[0].strip()
      if len(enemy_id) == 4:
         shifted_enemy_id = (int(enemy_id, 16) + 196605) >> 2
         enemies[shifted_enemy_id] = parts[1].rstrip()

f_output = io.open(os.path.join(os.path.dirname(os.path.realpath(__file__)), output_asm), "w", newline='\n')
f_output.write("\n; ---------------")
f_output.write("\n; Clear Enemies")
f_output.write("\n; (autogenerated)")
f_output.write("\n; ---------------")

last_enemy_id = None
for enemy_id in sorted(enemies):
   if not last_enemy_id:
      f_output.write("\n\nif !FEATURE_CLEAR_ENEMIES\n")
      f_output.write("org !ORG_CLEAR_ENEMIES+$F000\n")
      f_output.write("print pc, \" clearenemies start\"\n")
      f_output.write("ClearEnemiesTable:\n\n")
   enemy_id_pal = enemy_id + 8
   f_output.write("")
   f_output.write(f'org !ORG_CLEAR_ENEMIES+${enemy_id:04X}\n')
   f_output.write("dw $000" + enemies[enemy_id] + "\n\n")
   last_enemy_id = enemy_id

f_output.write("print pc, \" clearenemies end\"\n")
f_output.write("endif\n\n")
f_output.close()

