# Julie George, Emily Herrett, Liam Smeeth, Harry Hemingway, Anoop Shah, Spiros Denaxas, 2023.

import sys, csv, re

codes = [{"code":"62B..00","system":"readv2"},{"code":"62B1.00","system":"readv2"},{"code":"62B6.00","system":"readv2"},{"code":"62BZ.00","system":"readv2"},{"code":"62V..00","system":"readv2"},{"code":"631..11","system":"readv2"},{"code":"63D1.00","system":"readv2"},{"code":"63D2.00","system":"readv2"},{"code":"63D3.00","system":"readv2"},{"code":"63D4.00","system":"readv2"},{"code":"63D6.00","system":"readv2"},{"code":"7F04.11","system":"readv2"},{"code":"7F21000","system":"readv2"},{"code":"7F22100","system":"readv2"},{"code":"7F22111","system":"readv2"},{"code":"7F22500","system":"readv2"},{"code":"L11..00","system":"readv2"},{"code":"L110.00","system":"readv2"},{"code":"L110000","system":"readv2"},{"code":"L110100","system":"readv2"},{"code":"L110200","system":"readv2"},{"code":"L110z00","system":"readv2"},{"code":"L111.00","system":"readv2"},{"code":"L111000","system":"readv2"},{"code":"L111100","system":"readv2"},{"code":"L111200","system":"readv2"},{"code":"L111z00","system":"readv2"},{"code":"L112.00","system":"readv2"},{"code":"L112.11","system":"readv2"},{"code":"L112000","system":"readv2"},{"code":"L112100","system":"readv2"},{"code":"L112200","system":"readv2"},{"code":"L112z00","system":"readv2"},{"code":"L116.00","system":"readv2"},{"code":"L265.11","system":"readv2"},{"code":"L267.00","system":"readv2"},{"code":"L267300","system":"readv2"},{"code":"L267600","system":"readv2"},{"code":"L360.11","system":"readv2"},{"code":"L37..00","system":"readv2"},{"code":"L370.00","system":"readv2"},{"code":"L370.11","system":"readv2"},{"code":"L370000","system":"readv2"},{"code":"L370z00","system":"readv2"},{"code":"L370z11","system":"readv2"},{"code":"L371.00","system":"readv2"},{"code":"L37z.00","system":"readv2"},{"code":"L444.00","system":"readv2"},{"code":"Lyu3C00","system":"readv2"},{"code":"Q02..00","system":"readv2"},{"code":"Q021111","system":"readv2"},{"code":"Q021500","system":"readv2"},{"code":"Z212100","system":"readv2"},{"code":"Z212300","system":"readv2"},{"code":"Z256500","system":"readv2"},{"code":"Z262100","system":"readv2"},{"code":"Z262500","system":"readv2"},{"code":"Z262700","system":"readv2"},{"code":"Z262711","system":"readv2"},{"code":"Z262J11","system":"readv2"},{"code":"Z262M00","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('pregnancy-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["pregnancy-placentae---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["pregnancy-placentae---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["pregnancy-placentae---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
