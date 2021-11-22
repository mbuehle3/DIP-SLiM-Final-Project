import numpy as np
import subprocess
import time

reps = 1
capture = [20,30,40,50,100]
release = [10,15,20,25,30]

shoutit = open("project-dip.csv", "w")
csv_header = "pop-id, pop-size, hetero., mean phenotype, optimal phenotype\n"
shoutit.write(csv_header)

process_list = []
mix_list = []
for i in range(reps):
    for c in capture:
        for r in release:
            lug = "slim -d ru=%i -d capture=%s -d release=%s  project-code.slim" % (i, c, r)
            process_list.append(subprocess.Popen(lug, shell=True))

for proc in process_list:
    proc.wait()

shoutit.close()




