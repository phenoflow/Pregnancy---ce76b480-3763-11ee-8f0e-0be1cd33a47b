# Julie George, Emily Herrett, Liam Smeeth, Harry Hemingway, Anoop Shah, Spiros Denaxas, 2023.

import sys, csv, re

codes = [{"code":"62N..00","system":"readv2"},{"code":"62N2.00","system":"readv2"},{"code":"62N3.00","system":"readv2"},{"code":"62N4.00","system":"readv2"},{"code":"62N5.00","system":"readv2"},{"code":"62N6.00","system":"readv2"},{"code":"62N7.00","system":"readv2"},{"code":"62N8.00","system":"readv2"},{"code":"62N9.00","system":"readv2"},{"code":"62NA.00","system":"readv2"},{"code":"62NB.00","system":"readv2"},{"code":"62NC.00","system":"readv2"},{"code":"62ND.00","system":"readv2"},{"code":"62NE.00","system":"readv2"},{"code":"62NF.00","system":"readv2"},{"code":"62NG.00","system":"readv2"},{"code":"62NH.00","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('pregnancy-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["pregnancy-examination---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["pregnancy-examination---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["pregnancy-examination---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
