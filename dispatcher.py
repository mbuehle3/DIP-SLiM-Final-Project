import numpy as np
import subprocess
import time

reps = 2
capture = [20,30,40,50,100]
release = [10,15,20,25,30]
optimum = [10,20,30,50]

shoutit = open("project-dip.csv", "w")
csv_header = "pop-id, pop-size, hetero., mean phenotype, optimal phenotype\n"
shoutit.write(csv_header)

process_list = []
mix_list = []
for i in range(reps):
    for c in capture:
        for r in release:
            for o in optimum:
                lug = "slim -d replicate=%s -d capture=%s -d release=%s -d optimum=%s project-code.slim" % (i, c, r, o)
                process_list.append(subprocess.Popen(lug, shell=True))

for proc in process_list:
    proc.wait()

shoutit.close()




