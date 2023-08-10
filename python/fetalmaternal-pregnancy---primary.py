# Julie George, Emily Herrett, Liam Smeeth, Harry Hemingway, Anoop Shah, Spiros Denaxas, 2023.

import sys, csv, re

codes = [{"code":"275..00","system":"readv2"},{"code":"2752","system":"readv2"},{"code":"2753","system":"readv2"},{"code":"275Z.00","system":"readv2"},{"code":"62O..11","system":"readv2"},{"code":"62O1.00","system":"readv2"},{"code":"62O2.00","system":"readv2"},{"code":"62O3.00","system":"readv2"},{"code":"62O4.00","system":"readv2"},{"code":"7F03000","system":"readv2"},{"code":"7F03100","system":"readv2"},{"code":"7F04300","system":"readv2"},{"code":"7F25.11","system":"readv2"},{"code":"7F25000","system":"readv2"},{"code":"7F25100","system":"readv2"},{"code":"L161.12","system":"readv2"},{"code":"L170100","system":"readv2"},{"code":"L171300","system":"readv2"},{"code":"L175100","system":"readv2"},{"code":"L175300","system":"readv2"},{"code":"L22y.00","system":"readv2"},{"code":"L22z.00","system":"readv2"},{"code":"L22z100","system":"readv2"},{"code":"L237.00","system":"readv2"},{"code":"L237100","system":"readv2"},{"code":"L25..00","system":"readv2"},{"code":"L250.11","system":"readv2"},{"code":"L250.12","system":"readv2"},{"code":"L250.13","system":"readv2"},{"code":"L250400","system":"readv2"},{"code":"L251400","system":"readv2"},{"code":"L254.00","system":"readv2"},{"code":"L254.11","system":"readv2"},{"code":"L254.12","system":"readv2"},{"code":"L255300","system":"readv2"},{"code":"L25z400","system":"readv2"},{"code":"L260.00","system":"readv2"},{"code":"L263.00","system":"readv2"},{"code":"L263.11","system":"readv2"},{"code":"L263000","system":"readv2"},{"code":"L263100","system":"readv2"},{"code":"L263300","system":"readv2"},{"code":"L263500","system":"readv2"},{"code":"L263700","system":"readv2"},{"code":"L263A11","system":"readv2"},{"code":"L263z00","system":"readv2"},{"code":"L264.11","system":"readv2"},{"code":"L265300","system":"readv2"},{"code":"L265311","system":"readv2"},{"code":"L268000","system":"readv2"},{"code":"L300.00","system":"readv2"},{"code":"L300100","system":"readv2"},{"code":"L390.00","system":"readv2"},{"code":"L39y500","system":"readv2"},{"code":"L5...00","system":"readv2"},{"code":"L510.00","system":"readv2"},{"code":"L512.00","system":"readv2"},{"code":"L514.00","system":"readv2"},{"code":"Q000.11","system":"readv2"},{"code":"Q007111","system":"readv2"},{"code":"Q016.11","system":"readv2"},{"code":"Q10..00","system":"readv2"},{"code":"Q10..11","system":"readv2"},{"code":"Q10z.00","system":"readv2"},{"code":"Q21..12","system":"readv2"},{"code":"Q210.00","system":"readv2"},{"code":"Q212.00","system":"readv2"},{"code":"Q212.11","system":"readv2"},{"code":"Q212z00","system":"readv2"},{"code":"Q213.00","system":"readv2"},{"code":"Q213.11","system":"readv2"},{"code":"Q213z00","system":"readv2"},{"code":"Q214.00","system":"readv2"},{"code":"Q214.11","system":"readv2"},{"code":"Q214100","system":"readv2"},{"code":"Q214z00","system":"readv2"},{"code":"Q408.00","system":"readv2"},{"code":"Q408200","system":"readv2"},{"code":"Q408z00","system":"readv2"},{"code":"Q40y000","system":"readv2"},{"code":"Q436.00","system":"readv2"},{"code":"Z271E00","system":"readv2"},{"code":"ZV31.00","system":"readv2"},{"code":"ZV31000","system":"readv2"},{"code":"ZV31z00","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('pregnancy-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["fetalmaternal-pregnancy---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["fetalmaternal-pregnancy---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["fetalmaternal-pregnancy---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
