# Julie George, Emily Herrett, Liam Smeeth, Harry Hemingway, Anoop Shah, Spiros Denaxas, 2023.

import sys, csv, re

codes = [{"code":"623..00","system":"readv2"},{"code":"623Z.00","system":"readv2"},{"code":"625..00","system":"readv2"},{"code":"625Z.00","system":"readv2"},{"code":"626..00","system":"readv2"},{"code":"627..00","system":"readv2"},{"code":"628..00","system":"readv2"},{"code":"628Z.00","system":"readv2"},{"code":"L2...00","system":"readv2"},{"code":"L227.00","system":"readv2"},{"code":"L2y..00","system":"readv2"},{"code":"L2z..00","system":"readv2"},{"code":"Z22A100","system":"readv2"},{"code":"Z22A200","system":"readv2"},{"code":"Z22A211","system":"readv2"},{"code":"Z234400","system":"readv2"},{"code":"ZV23.00","system":"readv2"},{"code":"ZV23y00","system":"readv2"},{"code":"ZV23z00","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('pregnancy-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["pregnancy-highrisk---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["pregnancy-highrisk---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["pregnancy-highrisk---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
