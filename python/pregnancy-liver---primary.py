# Julie George, Emily Herrett, Liam Smeeth, Harry Hemingway, Anoop Shah, Spiros Denaxas, 2023.

import sys, csv, re

codes = [{"code":"7F20000","system":"readv2"},{"code":"7F22.00","system":"readv2"},{"code":"7N61111","system":"readv2"},{"code":"L100100","system":"readv2"},{"code":"L100200","system":"readv2"},{"code":"L10y200","system":"readv2"},{"code":"L114100","system":"readv2"},{"code":"L11y100","system":"readv2"},{"code":"L11y200","system":"readv2"},{"code":"L123100","system":"readv2"},{"code":"L123300","system":"readv2"},{"code":"L125100","system":"readv2"},{"code":"L125300","system":"readv2"},{"code":"L126100","system":"readv2"},{"code":"L126300","system":"readv2"},{"code":"L127100","system":"readv2"},{"code":"L127300","system":"readv2"},{"code":"L130100","system":"readv2"},{"code":"L130200","system":"readv2"},{"code":"L132100","system":"readv2"},{"code":"L132200","system":"readv2"},{"code":"L150100","system":"readv2"},{"code":"L150200","system":"readv2"},{"code":"L181300","system":"readv2"},{"code":"L187300","system":"readv2"},{"code":"L224100","system":"readv2"},{"code":"L23y100","system":"readv2"},{"code":"L255100","system":"readv2"},{"code":"L25y100","system":"readv2"},{"code":"L265100","system":"readv2"},{"code":"L266100","system":"readv2"},{"code":"L305100","system":"readv2"},{"code":"L309100","system":"readv2"},{"code":"L312100","system":"readv2"},{"code":"L35y100","system":"readv2"},{"code":"L397100","system":"readv2"},{"code":"Z251.00","system":"readv2"},{"code":"Z252.00","system":"readv2"},{"code":"Z254500","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('pregnancy-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["pregnancy-liver---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["pregnancy-liver---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["pregnancy-liver---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
