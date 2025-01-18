import argparse
parser= argparse.ArgumentParser(description="Enter a file")
#py adder.py hi txt
parser.add_argument("operation",type=str,choices=["text12"],help="operation")
parser.add_argument("file_extension",type=str,help="operation")


#adder.py -c 5 mytxt.txt
#adder.py -s mytxt.txt
#adder.py -t mytxt.txt # it will go to false if i didn't call -t
 
args=parser.parse_args()
if args.operation == "text12":
 with open(args.file_extension,'r') as f:
    print(len(f.read()))



    

