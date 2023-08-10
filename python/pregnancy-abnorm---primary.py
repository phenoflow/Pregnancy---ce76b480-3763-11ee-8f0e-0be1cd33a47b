# Julie George, Emily Herrett, Liam Smeeth, Harry Hemingway, Anoop Shah, Spiros Denaxas, 2023.

import sys, csv, re

codes = [{"code":"62G8.00","system":"readv2"},{"code":"62G9.00","system":"readv2"},{"code":"L188100","system":"readv2"},{"code":"L188300","system":"readv2"},{"code":"L251.00","system":"readv2"},{"code":"L251000","system":"readv2"},{"code":"L251100","system":"readv2"},{"code":"Lyu4500","system":"readv2"},{"code":"Q212000","system":"readv2"},{"code":"Q213000","system":"readv2"},{"code":"Q214000","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('pregnancy-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["pregnancy-abnorm---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["pregnancy-abnorm---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["pregnancy-abnorm---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
