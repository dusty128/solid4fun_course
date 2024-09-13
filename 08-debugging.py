
# O.k., let's run the script "08-faulty_code.py"
# The result is a "Recursion error", which is bad.

> script.py(5)flatten()
-> flat_list = []
(Pdb) n
> script.py(6)flatten()
-> for item in lst:
(Pdb) n
> script.py(7)flatten()
-> if isinstance(item, list):
(Pdb) p item
1
(Pdb) n
> script.py(11)flatten()
-> flat_list.append(item)
(Pdb) n
> script.py(6)flatten()
-> for item in lst:
(Pdb) n
> script.py(7)flatten()
-> if isinstance(item, list):
(Pdb) p item
[2, [3, [4]], 5]
(Pdb) n
> script.py(8)flatten()
-> flat_list.extend(flatten(lst))
(Pdb) p lst
[1, [2, [3, [4]], 5], 6]
(Pdb) p item
[2, [3, [4]], 5]


flat_list.extend(flatten(lst))  # Bug: Should be flatten(item)
