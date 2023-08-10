# Julie George, Emily Herrett, Liam Smeeth, Harry Hemingway, Anoop Shah, Spiros Denaxas, 2023.

import sys, csv, re

codes = [{"code":"L040000","system":"readv2"},{"code":"L040100","system":"readv2"},{"code":"L040w00","system":"readv2"},{"code":"L040y00","system":"readv2"},{"code":"L043x00","system":"readv2"},{"code":"L131000","system":"readv2"},{"code":"L210200","system":"readv2"},{"code":"L212200","system":"readv2"},{"code":"L222200","system":"readv2"},{"code":"L224200","system":"readv2"},{"code":"L226200","system":"readv2"},{"code":"L229200","system":"readv2"},{"code":"L237200","system":"readv2"},{"code":"L250200","system":"readv2"},{"code":"L25z300","system":"readv2"},{"code":"L26..00","system":"readv2"},{"code":"L260200","system":"readv2"},{"code":"L261200","system":"readv2"},{"code":"L262200","system":"readv2"},{"code":"L263200","system":"readv2"},{"code":"L264200","system":"readv2"},{"code":"L267500","system":"readv2"},{"code":"L268.00","system":"readv2"},{"code":"L270200","system":"readv2"},{"code":"L28..00","system":"readv2"},{"code":"L280200","system":"readv2"},{"code":"L281200","system":"readv2"},{"code":"L282000","system":"readv2"},{"code":"L282300","system":"readv2"},{"code":"L28y.00","system":"readv2"},{"code":"L28y100","system":"readv2"},{"code":"L28z.00","system":"readv2"},{"code":"L28z200","system":"readv2"},{"code":"L28zz00","system":"readv2"},{"code":"L29..00","system":"readv2"},{"code":"L29z.00","system":"readv2"},{"code":"L29zz00","system":"readv2"},{"code":"L305200","system":"readv2"},{"code":"L307200","system":"readv2"},{"code":"L311200","system":"readv2"},{"code":"L312200","system":"readv2"},{"code":"L323200","system":"readv2"},{"code":"L33z200","system":"readv2"},{"code":"L340200","system":"readv2"},{"code":"L341200","system":"readv2"},{"code":"L342200","system":"readv2"},{"code":"L343200","system":"readv2"},{"code":"L344200","system":"readv2"},{"code":"L34y200","system":"readv2"},{"code":"L34z000","system":"readv2"},{"code":"L350200","system":"readv2"},{"code":"L351300","system":"readv2"},{"code":"L352200","system":"readv2"},{"code":"L356200","system":"readv2"},{"code":"L35y200","system":"readv2"},{"code":"L360100","system":"readv2"},{"code":"L360200","system":"readv2"},{"code":"L362200","system":"readv2"},{"code":"L371100","system":"readv2"},{"code":"L371200","system":"readv2"},{"code":"L393100","system":"readv2"},{"code":"L393200","system":"readv2"},{"code":"L394200","system":"readv2"},{"code":"L39y400","system":"readv2"},{"code":"L39z400","system":"readv2"},{"code":"L51..00","system":"readv2"},{"code":"L51X.00","system":"readv2"},{"code":"Lyu0B00","system":"readv2"},{"code":"Lyu3900","system":"readv2"},{"code":"Lyu3A00","system":"readv2"},{"code":"Q026.11","system":"readv2"},{"code":"Z226.00","system":"readv2"},{"code":"Z239500","system":"readv2"},{"code":"Z23F.00","system":"readv2"},{"code":"Z243800","system":"readv2"},{"code":"Z249.00","system":"readv2"},{"code":"Z258.00","system":"readv2"},{"code":"Z262R00","system":"readv2"},{"code":"Z265200","system":"readv2"},{"code":"Z288.00","system":"readv2"},{"code":"ZV23800","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('pregnancy-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["pregnancy-problemunspecifd---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["pregnancy-problemunspecifd---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["pregnancy-problemunspecifd---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
