# Julie George, Emily Herrett, Liam Smeeth, Harry Hemingway, Anoop Shah, Spiros Denaxas, 2023.

import sys, csv, re

codes = [{"code":"7F20.00","system":"readv2"},{"code":"7F20y00","system":"readv2"},{"code":"7F20z00","system":"readv2"},{"code":"7F21.00","system":"readv2"},{"code":"7F21y00","system":"readv2"},{"code":"7F21z00","system":"readv2"},{"code":"Infinity","system":"readv2"},{"code":"L01..00","system":"readv2"},{"code":"L01z.00","system":"readv2"},{"code":"L097000","system":"readv2"},{"code":"Lyu0100","system":"readv2"},{"code":"Z22AD11","system":"readv2"},{"code":"Z22C500","system":"readv2"},{"code":"Z22C511","system":"readv2"},{"code":"Z26..00","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('pregnancy-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["pregnancy-concep---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["pregnancy-concep---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["pregnancy-concep---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
