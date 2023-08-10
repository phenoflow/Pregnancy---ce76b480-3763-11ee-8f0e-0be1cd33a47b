# Julie George, Emily Herrett, Liam Smeeth, Harry Hemingway, Anoop Shah, Spiros Denaxas, 2023.

import sys, csv, re

codes = [{"code":"639..00","system":"readv2"},{"code":"6391","system":"readv2"},{"code":"6392","system":"readv2"},{"code":"6393","system":"readv2"},{"code":"6394","system":"readv2"},{"code":"6395","system":"readv2"},{"code":"6396","system":"readv2"},{"code":"6397","system":"readv2"},{"code":"6398","system":"readv2"},{"code":"6399","system":"readv2"},{"code":"639A.00","system":"readv2"},{"code":"639B.00","system":"readv2"},{"code":"63A..00","system":"readv2"},{"code":"63A1.00","system":"readv2"},{"code":"63A2.00","system":"readv2"},{"code":"63A3.00","system":"readv2"},{"code":"63A4.00","system":"readv2"},{"code":"63A5.00","system":"readv2"},{"code":"63A6.00","system":"readv2"},{"code":"63A7.00","system":"readv2"},{"code":"63A8.00","system":"readv2"},{"code":"63A9.00","system":"readv2"},{"code":"63AA.00","system":"readv2"},{"code":"63AB.00","system":"readv2"},{"code":"63B..00","system":"readv2"},{"code":"63B1.00","system":"readv2"},{"code":"63B2.00","system":"readv2"},{"code":"63B3.00","system":"readv2"},{"code":"63B4.00","system":"readv2"},{"code":"63B6.00","system":"readv2"},{"code":"63B7.00","system":"readv2"},{"code":"63B8.00","system":"readv2"},{"code":"63B9.00","system":"readv2"},{"code":"63BA.00","system":"readv2"},{"code":"63BB.00","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('pregnancy-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["pregnancy-minute---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["pregnancy-minute---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["pregnancy-minute---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
