#Isintance
class Person:
    def __init__(self,name,age):
        self.name=name
        self.age=age
class Employee(Person):
    def __init__(self,name,age,emp_id):
        super().__init__(name,age)
        self.emp_id=emp_id

emp=Employee("Jhon Doe",30,12345)
print(emp.name)
print(emp.age)
print(emp.emp_id)








class students:
    def __init__(self):
        self.l=[]
    def stud(self,name,sec,rollno):
       d=[name,sec,rollno]
       self.l.append(d)
    def remov(self,name):
        for i in self.l:
            if name in i:
                self.l.remove(i)
obj=students()
obj.stud("shivani","a","1")
obj.stud("haritha","a","1")
#obj.remov("sanjana")
print(obj.l)