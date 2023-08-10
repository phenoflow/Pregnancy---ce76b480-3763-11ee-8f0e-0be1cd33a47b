# Julie George, Emily Herrett, Liam Smeeth, Harry Hemingway, Anoop Shah, Spiros Denaxas, 2023.

import sys, csv, re

codes = [{"code":"2684","system":"readv2"},{"code":"6221","system":"readv2"},{"code":"622Z.00","system":"readv2"},{"code":"7F0..00","system":"readv2"},{"code":"7F0..12","system":"readv2"},{"code":"7F06.00","system":"readv2"},{"code":"7F06000","system":"readv2"},{"code":"7F06100","system":"readv2"},{"code":"7F06200","system":"readv2"},{"code":"7F06y00","system":"readv2"},{"code":"7F06z00","system":"readv2"},{"code":"7F0y.00","system":"readv2"},{"code":"7F0z.00","system":"readv2"},{"code":"L13..11","system":"readv2"},{"code":"L130.00","system":"readv2"},{"code":"L130z00","system":"readv2"},{"code":"L131.00","system":"readv2"},{"code":"L131200","system":"readv2"},{"code":"L131z00","system":"readv2"},{"code":"L243.00","system":"readv2"},{"code":"L243000","system":"readv2"},{"code":"L243z00","system":"readv2"},{"code":"Z221.00","system":"readv2"},{"code":"Z222.00","system":"readv2"},{"code":"Z23..00","system":"readv2"},{"code":"Z231.00","system":"readv2"},{"code":"Z234.00","system":"readv2"},{"code":"Z234100","system":"readv2"},{"code":"Z234200","system":"readv2"},{"code":"Z234300","system":"readv2"},{"code":"Z236100","system":"readv2"},{"code":"Z237.00","system":"readv2"},{"code":"Z237200","system":"readv2"},{"code":"Z23E.00","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('pregnancy-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["pregnancy-gravida---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["pregnancy-gravida---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["pregnancy-gravida---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
