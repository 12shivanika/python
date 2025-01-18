import sys
print(sys.argv)

print(sys.argv[1:])
n=sys.argv[1:]
sum=0
for i in n:
    sum=sum+int(i)
print(sum)

