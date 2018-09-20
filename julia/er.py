import random

n = 1239
e = 3047.0
p = 0.004


graph = {}

for node in range(n):
    graph[node] = set()

for tail in range(n):
    for head in range(tail, n):
        if tail != head:
            r = random.random()
            if r < p :
                graph[tail].add(head)
                graph[head].add(tail)

print len(graph)
nedges = 0
for k in graph:
    nedges += len(graph[k])

print nedges/2

print e / n**2