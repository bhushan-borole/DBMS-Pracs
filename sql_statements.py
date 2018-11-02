import re
wrap = lambda string, wrapper : wrapper+string+wrapper
def print_table(header, table):
    end_char = " "
    for i in header : 
        print(i, end = end_char)
    print()
    for row in table: 
        for cols in row:
            print(cols, end = end_char)
        print()


def seggregate(table):
    global data_types
    
    for i in range(len(table)):
        for j in range(len(table[i])):
            col = table[i][j]
            try :
                int(col)
                data_types[j] = 'number'
            except : 
                try:
                    float(col)
                    data_types[j] = 'float'
                except:
                    if re.match(r'\d{4}-\d{2}-\d{2}', col) : 
                        table[i][j] = "Date '{}'".format(col)
                    else : 
                        if col and col != 'null': 
                            table[i][j] = wrap(table[i][j], "'")
                            if any(x in table[i][j].lower() for x in ["jan", 'feb', 'mar', 'apr', 'may', 'jun', 'jul', 'aug', 'sep', 'oct', 'nov', 'dec']):
                                data_types[j] = 'date'
                            else :
                                data_types[j] = 'varchar2'
    return table
import sys

table_name = input("Enter the table name :")

print("Enter the table :")
print("\x1B[3mPress Ctrl+D to stop giving input.\x1B[3m")

table_strings = sys.stdin.readlines()

print("\nEntered table is : ")

table = []

header = table_strings.pop(0).split(" ")
if header[-1][-1:] == "\n" : header[-1] = header[-1][:-1]

data_types = ["" for i in range(len(header))]

for row in table_strings :
    print(row)
    if "---" in row : continue
    table.append(row.split(" "))
    if table[-1][-1][-1:] == "\n" : 
        table[-1][-1] = table[-1][-1][:-1]

print_table(header, table)

table = seggregate(table)

for i in range(len(data_types)):
    if data_types[i] in ('varchar2', "number"): 
        data_types[i] += "("+str(max([len(row[i]) for row in table]))+")"      #stores with buffer of 2.
print("create table {}({});".format(table_name, ", ".join([header[i]+" "+data_types[i] for i in range(len(header))])))

[print("insert into {} values({});".format(table_name, ", ".join([i for i in row if i]))) for row in table if row]

