import argparse
parser= argparse.ArgumentParser(description="Celcius")
#py adder.py hi.txt
parser.add_argument('num1',type=int,help='Enter a celcius')
parser.add_argument("operation",type=str,choices=["f"],help="operation")
#adder.py -c 5 mytxt.txt
#adder.py -s mytxt.txt
#adder.py -t mytxt.txt # it will go to false if i didn't call -t

args=parser.parse_args()

if args.operation == "f":

    print(f"Result: {((9/5)*args.num1)+32}")

print(args)
