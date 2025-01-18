import argparse
parser= argparse.ArgumentParser(description="Simple calculator")
#py adder.py hi txt
parser.add_argument('num1',type=float,help='Enter a first name')
parser.add_argument('num2',type=float,help='Enter a first name')
parser.add_argument("operation",type=str,choices=["add","subtract","multiply","divide"],help="operation")
#adder.py -c 5 mytxt.txt
#adder.py -s mytxt.txt
#adder.py -t mytxt.txt # it will go to false if i didn't call -t
 
args=parser.parse_args()
 
if args.operation == "add":
    print(f"Result: {args.num1+args.num2}")
elif args.operation == "subtract":
    print(f"Result: {args.num1-args.num2}")
elif args.operation == "multiply":
    print(f"Result: {args.num1*args.num2}")
elif args.operation == "divide":
    try:
        print(f"Result:{args.num1/args.num2}")
    except ZeroDivisionError:
        print("Error:Division by zero.")
