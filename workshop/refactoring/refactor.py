import random
a = []
a.append(int(random.random() * 100))
a.append(int(random.random() * 100))
a.append(int(random.random() * 100))
a.append(int(random.random() * 100))
a.append(int(random.random() * 100))
a.append(int(random.random() * 100))
a.append(int(random.random() * 100))
a.append(int(random.random() * 100))
a.append(int(random.random() * 100))
a.append(int(random.random() * 100))
c = 0
# last = None
# for new in a:
#     if last == new:
#         a.remove(new)
#     last = new
for i in range(0,10):  # here we loop
    if (a[i]%7== 0):
        c += 1
    if (a[i]%11==0):
        c += 1
    if (a[i] % 7 == 0):
        print(a[i], "is divisible by 7 or 11")
    if (a[i] % 11 == 0):
        print(a[i], "is divisible by 7 or 11")
print("found", c, "numbers divisible by 7 or 11")
