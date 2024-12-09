text = "Feruz jinni 🤪"

num_lines = 8
times=100

for i in range(times):
        
    for i in range(num_lines):
        print(" " * i + text)

    for i in range(num_lines - 1, -1, -1):
        print(" " * i + text)
