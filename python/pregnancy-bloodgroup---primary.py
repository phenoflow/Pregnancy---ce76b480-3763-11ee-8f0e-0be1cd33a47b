# Julie George, Emily Herrett, Liam Smeeth, Harry Hemingway, Anoop Shah, Spiros Denaxas, 2023.

import sys, csv, re

codes = [{"code":"6212","system":"readv2"},{"code":"62H6.00","system":"readv2"},{"code":"62I..00","system":"readv2"},{"code":"62L..00","system":"readv2"},{"code":"62L2.00","system":"readv2"},{"code":"62LZ.00","system":"readv2"},{"code":"62U..00","system":"readv2"},{"code":"62U8.00","system":"readv2"},{"code":"62U9.00","system":"readv2"},{"code":"62UA.00","system":"readv2"},{"code":"62Uz.00","system":"readv2"},{"code":"62W..00","system":"readv2"},{"code":"7F00000","system":"readv2"},{"code":"7F01100","system":"readv2"},{"code":"7F01111","system":"readv2"},{"code":"7F03200","system":"readv2"},{"code":"7F04100","system":"readv2"},{"code":"7F04111","system":"readv2"},{"code":"7L13000","system":"readv2"},{"code":"L262100","system":"readv2"},{"code":"Q410.00","system":"readv2"},{"code":"Q410000","system":"readv2"},{"code":"Z245.00","system":"readv2"},{"code":"Z245100","system":"readv2"},{"code":"Z245400","system":"readv2"},{"code":"Z263400","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('pregnancy-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["pregnancy-bloodgroup---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["pregnancy-bloodgroup---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["pregnancy-bloodgroup---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
