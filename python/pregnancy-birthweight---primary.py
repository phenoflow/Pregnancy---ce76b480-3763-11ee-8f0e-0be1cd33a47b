# Julie George, Emily Herrett, Liam Smeeth, Harry Hemingway, Anoop Shah, Spiros Denaxas, 2023.

import sys, csv, re

codes = [{"code":"62O..12","system":"readv2"},{"code":"6311","system":"readv2"},{"code":"6312","system":"readv2"},{"code":"6313","system":"readv2"},{"code":"6314","system":"readv2"},{"code":"6315","system":"readv2"},{"code":"633..13","system":"readv2"},{"code":"633..14","system":"readv2"},{"code":"633a.00","system":"readv2"},{"code":"636..00","system":"readv2"},{"code":"636..11","system":"readv2"},{"code":"6371","system":"readv2"},{"code":"6372","system":"readv2"},{"code":"6373","system":"readv2"},{"code":"6374","system":"readv2"},{"code":"6375","system":"readv2"},{"code":"6376","system":"readv2"},{"code":"6377","system":"readv2"},{"code":"6378","system":"readv2"},{"code":"638..00","system":"readv2"},{"code":"6381","system":"readv2"},{"code":"6384","system":"readv2"},{"code":"6385","system":"readv2"},{"code":"6386","system":"readv2"},{"code":"638Z.00","system":"readv2"},{"code":"63E2.00","system":"readv2"},{"code":"64B..00","system":"readv2"},{"code":"64B2.00","system":"readv2"},{"code":"64B2.11","system":"readv2"},{"code":"64B3.00","system":"readv2"},{"code":"64B5.00","system":"readv2"},{"code":"L161.00","system":"readv2"},{"code":"L161.11","system":"readv2"},{"code":"L161000","system":"readv2"},{"code":"L161300","system":"readv2"},{"code":"L16D.00","system":"readv2"},{"code":"L2B..00","system":"readv2"},{"code":"Q21..00","system":"readv2"},{"code":"Q21z.13","system":"readv2"},{"code":"Q2y..00","system":"readv2"},{"code":"Z254D00","system":"readv2"},{"code":"Z254E00","system":"readv2"},{"code":"ZV27.11","system":"readv2"},{"code":"ZV3..00","system":"readv2"},{"code":"ZV3z.00","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('pregnancy-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["pregnancy-birthweight---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["pregnancy-birthweight---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["pregnancy-birthweight---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
