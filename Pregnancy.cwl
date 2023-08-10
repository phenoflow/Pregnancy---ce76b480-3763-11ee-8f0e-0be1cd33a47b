cwlVersion: v1.0
steps:
  read-potential-cases-i2b2:
    run: read-potential-cases-i2b2.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  antenatal-pregnancy---primary:
    run: antenatal-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-i2b2/output
  pregnancy-abnormality---primary:
    run: pregnancy-abnormality---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: antenatal-pregnancy---primary/output
  pregnancy-maternity---primary:
    run: pregnancy-maternity---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: pregnancy-abnormality---primary/output
  pregnancy-unwanted---primary:
    run: pregnancy-unwanted---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: pregnancy-maternity---primary/output
  pregnant-pregnancy---primary:
    run: pregnant-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: pregnancy-unwanted---primary/output
  teenage-pregnancy---primary:
    run: teenage-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: pregnant-pregnancy---primary/output
  pregnancy-undiagnosed---primary:
    run: pregnancy-undiagnosed---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: teenage-pregnancy---primary/output
  pregnancy-newborn---primary:
    run: pregnancy-newborn---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: pregnancy-undiagnosed---primary/output
  pregnancy-forces---primary:
    run: pregnancy-forces---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: pregnancy-newborn---primary/output
  pregnancy-vagina---primary:
    run: pregnancy-vagina---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: pregnancy-forces---primary/output
  pregnancy-postdelivery---primary:
    run: pregnancy-postdelivery---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: pregnancy-vagina---primary/output
  pregnancy-gravida---primary:
    run: pregnancy-gravida---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: pregnancy-postdelivery---primary/output
  pregnancy-fundu---primary:
    run: pregnancy-fundu---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: pregnancy-gravida---primary/output
  pregnancy-postterm---primary:
    run: pregnancy-postterm---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: pregnancy-fundu---primary/output
  pregnancy-present---primary:
    run: pregnancy-present---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule16
      potentialCases:
        id: potentialCases
        source: pregnancy-postterm---primary/output
  fetalmaternal-pregnancy---primary:
    run: fetalmaternal-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule17
      potentialCases:
        id: potentialCases
        source: pregnancy-present---primary/output
  positive-pregnancy---primary:
    run: positive-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule18
      potentialCases:
        id: potentialCases
        source: fetalmaternal-pregnancy---primary/output
  pregnancy-urine---primary:
    run: pregnancy-urine---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule19
      potentialCases:
        id: potentialCases
        source: positive-pregnancy---primary/output
  previous-pregnancy---primary:
    run: previous-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule20
      potentialCases:
        id: potentialCases
        source: pregnancy-urine---primary/output
  pregnancy-ultrasound---primary:
    run: pregnancy-ultrasound---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule21
      potentialCases:
        id: potentialCases
        source: previous-pregnancy---primary/output
  local-pregnancy---primary:
    run: local-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule22
      potentialCases:
        id: potentialCases
        source: pregnancy-ultrasound---primary/output
  pregnancy-viability---primary:
    run: pregnancy-viability---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule23
      potentialCases:
        id: potentialCases
        source: local-pregnancy---primary/output
  pregnancy-confirmed---primary:
    run: pregnancy-confirmed---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule24
      potentialCases:
        id: potentialCases
        source: pregnancy-viability---primary/output
  pregnancy---primary:
    run: pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule25
      potentialCases:
        id: potentialCases
        source: pregnancy-confirmed---primary/output
  pregnancy-failure---primary:
    run: pregnancy-failure---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule26
      potentialCases:
        id: potentialCases
        source: pregnancy---primary/output
  patient-pregnancy---primary:
    run: patient-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule27
      potentialCases:
        id: potentialCases
        source: pregnancy-failure---primary/output
  pregnancy-bloodgroup---primary:
    run: pregnancy-bloodgroup---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule28
      potentialCases:
        id: potentialCases
        source: patient-pregnancy---primary/output
  pregnancy-vessel---primary:
    run: pregnancy-vessel---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule29
      potentialCases:
        id: potentialCases
        source: pregnancy-bloodgroup---primary/output
  pregnancy-history---primary:
    run: pregnancy-history---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule30
      potentialCases:
        id: potentialCases
        source: pregnancy-vessel---primary/output
  abdominal-pregnancy---primary:
    run: abdominal-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule31
      potentialCases:
        id: potentialCases
        source: pregnancy-history---primary/output
  pregnancy-unplanned---primary:
    run: pregnancy-unplanned---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule32
      potentialCases:
        id: potentialCases
        source: abdominal-pregnancy---primary/output
  pregnancy-puerpnot---primary:
    run: pregnancy-puerpnot---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule33
      potentialCases:
        id: potentialCases
        source: pregnancy-unplanned---primary/output
  pregnancy-multip---primary:
    run: pregnancy-multip---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule34
      potentialCases:
        id: potentialCases
        source: pregnancy-puerpnot---primary/output
  pregnancy-highrisk---primary:
    run: pregnancy-highrisk---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule35
      potentialCases:
        id: potentialCases
        source: pregnancy-multip---primary/output
  uncertain-pregnancy---primary:
    run: uncertain-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule36
      potentialCases:
        id: potentialCases
        source: pregnancy-highrisk---primary/output
  pregnancy-aborter---primary:
    run: pregnancy-aborter---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule37
      potentialCases:
        id: potentialCases
        source: uncertain-pregnancy---primary/output
  grand-pregnancy---primary:
    run: grand-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule38
      potentialCases:
        id: potentialCases
        source: pregnancy-aborter---primary/output
  pregnancy-birth---primary:
    run: pregnancy-birth---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule39
      potentialCases:
        id: potentialCases
        source: grand-pregnancy---primary/output
  perinatal-pregnancy---primary:
    run: perinatal-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule40
      potentialCases:
        id: potentialCases
        source: pregnancy-birth---primary/output
  trophoblastic-pregnancy---primary:
    run: trophoblastic-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule41
      potentialCases:
        id: potentialCases
        source: perinatal-pregnancy---primary/output
  precious-pregnancy---primary:
    run: precious-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule42
      potentialCases:
        id: potentialCases
        source: trophoblastic-pregnancy---primary/output
  elderly-pregnancy---primary:
    run: elderly-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule43
      potentialCases:
        id: potentialCases
        source: precious-pregnancy---primary/output
  pregnancy-infertility---primary:
    run: pregnancy-infertility---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule44
      potentialCases:
        id: potentialCases
        source: elderly-pregnancy---primary/output
  pregnancy-condition---primary:
    run: pregnancy-condition---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule45
      potentialCases:
        id: potentialCases
        source: pregnancy-infertility---primary/output
  pregnancy-booked---primary:
    run: pregnancy-booked---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule46
      potentialCases:
        id: potentialCases
        source: pregnancy-condition---primary/output
  pregnancy-childbirth---primary:
    run: pregnancy-childbirth---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule47
      potentialCases:
        id: potentialCases
        source: pregnancy-booked---primary/output
  pregnancy-primip---primary:
    run: pregnancy-primip---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule48
      potentialCases:
        id: potentialCases
        source: pregnancy-childbirth---primary/output
  pregnancy-provider---primary:
    run: pregnancy-provider---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule49
      potentialCases:
        id: potentialCases
        source: pregnancy-primip---primary/output
  pregnancy-consultant---primary:
    run: pregnancy-consultant---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule50
      potentialCases:
        id: potentialCases
        source: pregnancy-provider---primary/output
  pregnancy-shared---primary:
    run: pregnancy-shared---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule51
      potentialCases:
        id: potentialCases
        source: pregnancy-consultant---primary/output
  pregnancy-failed---primary:
    run: pregnancy-failed---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule52
      potentialCases:
        id: potentialCases
        source: pregnancy-shared---primary/output
  pregnancy-placentae---primary:
    run: pregnancy-placentae---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule53
      potentialCases:
        id: potentialCases
        source: pregnancy-failed---primary/output
  private-pregnancy---primary:
    run: private-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule54
      potentialCases:
        id: potentialCases
        source: pregnancy-placentae---primary/output
  pregnancy-booking---primary:
    run: pregnancy-booking---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule55
      potentialCases:
        id: potentialCases
        source: private-pregnancy---primary/output
  short-pregnancy---primary:
    run: short-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule56
      potentialCases:
        id: potentialCases
        source: pregnancy-booking---primary/output
  pregnancy-amnio---primary:
    run: pregnancy-amnio---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule57
      potentialCases:
        id: potentialCases
        source: short-pregnancy---primary/output
  pregnancy-awaited---primary:
    run: pregnancy-awaited---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule58
      potentialCases:
        id: potentialCases
        source: pregnancy-amnio---primary/output
  pregnancy-hydramnio---primary:
    run: pregnancy-hydramnio---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule59
      potentialCases:
        id: potentialCases
        source: pregnancy-awaited---primary/output
  pregnancy-offered---primary:
    run: pregnancy-offered---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule60
      potentialCases:
        id: potentialCases
        source: pregnancy-hydramnio---primary/output
  pregnancy-dates---primary:
    run: pregnancy-dates---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule61
      potentialCases:
        id: potentialCases
        source: pregnancy-offered---primary/output
  pregnancy-abnorm---primary:
    run: pregnancy-abnorm---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule62
      potentialCases:
        id: potentialCases
        source: pregnancy-dates---primary/output
  pregnancy-growth---primary:
    run: pregnancy-growth---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule63
      potentialCases:
        id: potentialCases
        source: pregnancy-abnorm---primary/output
  pregnancy-antibody---primary:
    run: pregnancy-antibody---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule64
      potentialCases:
        id: potentialCases
        source: pregnancy-growth---primary/output
  pregnancy-sample---primary:
    run: pregnancy-sample---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule65
      potentialCases:
        id: potentialCases
        source: pregnancy-antibody---primary/output
  pregnancy-protein---primary:
    run: pregnancy-protein---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule66
      potentialCases:
        id: potentialCases
        source: pregnancy-sample---primary/output
  pregnancy-syphilis---primary:
    run: pregnancy-syphilis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule67
      potentialCases:
        id: potentialCases
        source: pregnancy-protein---primary/output
  absent-pregnancy---primary:
    run: absent-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule68
      potentialCases:
        id: potentialCases
        source: pregnancy-syphilis---primary/output
  pregnancy-sickle---primary:
    run: pregnancy-sickle---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule69
      potentialCases:
        id: potentialCases
        source: absent-pregnancy---primary/output
  pregnancy-examination---primary:
    run: pregnancy-examination---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule70
      potentialCases:
        id: potentialCases
        source: pregnancy-sickle---primary/output
  pregnancy-miscarriage---primary:
    run: pregnancy-miscarriage---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule71
      potentialCases:
        id: potentialCases
        source: pregnancy-examination---primary/output
  pregnancy-birthweight---primary:
    run: pregnancy-birthweight---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule72
      potentialCases:
        id: potentialCases
        source: pregnancy-miscarriage---primary/output
  pregnancy-ruptured---primary:
    run: pregnancy-ruptured---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule73
      potentialCases:
        id: potentialCases
        source: pregnancy-birthweight---primary/output
  pregnancy-prolonged---primary:
    run: pregnancy-prolonged---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule74
      potentialCases:
        id: potentialCases
        source: pregnancy-ruptured---primary/output
  pregnancy-triple---primary:
    run: pregnancy-triple---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule75
      potentialCases:
        id: potentialCases
        source: pregnancy-prolonged---primary/output
  double-pregnancy---primary:
    run: double-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule76
      potentialCases:
        id: potentialCases
        source: pregnancy-triple---primary/output
  pregnancy-gestationis---primary:
    run: pregnancy-gestationis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule77
      potentialCases:
        id: potentialCases
        source: double-pregnancy---primary/output
  pregnancy-review---primary:
    run: pregnancy-review---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule78
      potentialCases:
        id: potentialCases
        source: pregnancy-gestationis---primary/output
  pregnancy-screening---primary:
    run: pregnancy-screening---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule79
      potentialCases:
        id: potentialCases
        source: pregnancy-review---primary/output
  pregnancy-detail---primary:
    run: pregnancy-detail---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule80
      potentialCases:
        id: potentialCases
        source: pregnancy-screening---primary/output
  pregnancy-prelabour---primary:
    run: pregnancy-prelabour---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule81
      potentialCases:
        id: potentialCases
        source: pregnancy-detail---primary/output
  pregnancy-thirdstage---primary:
    run: pregnancy-thirdstage---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule82
      potentialCases:
        id: potentialCases
        source: pregnancy-prelabour---primary/output
  female-pregnancy---primary:
    run: female-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule83
      potentialCases:
        id: potentialCases
        source: pregnancy-thirdstage---primary/output
  pregnancy-maturity---primary:
    run: pregnancy-maturity---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule84
      potentialCases:
        id: potentialCases
        source: female-pregnancy---primary/output
  pregnancy-postmature---primary:
    run: pregnancy-postmature---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule85
      potentialCases:
        id: potentialCases
        source: pregnancy-maturity---primary/output
  premature-pregnancy---primary:
    run: premature-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule86
      potentialCases:
        id: potentialCases
        source: pregnancy-postmature---primary/output
  pregnancy-baby---primary:
    run: pregnancy-baby---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule87
      potentialCases:
        id: potentialCases
        source: premature-pregnancy---primary/output
  pregnancy-circumference---primary:
    run: pregnancy-circumference---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule88
      potentialCases:
        id: potentialCases
        source: pregnancy-baby---primary/output
  pregnancy-minute---primary:
    run: pregnancy-minute---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule89
      potentialCases:
        id: potentialCases
        source: pregnancy-circumference---primary/output
  pregnancy-refer---primary:
    run: pregnancy-refer---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule90
      potentialCases:
        id: potentialCases
        source: pregnancy-minute---primary/output
  pregnancy-counselling---primary:
    run: pregnancy-counselling---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule91
      potentialCases:
        id: potentialCases
        source: pregnancy-refer---primary/output
  pregnancy-class---primary:
    run: pregnancy-class---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule92
      potentialCases:
        id: potentialCases
        source: pregnancy-counselling---primary/output
  mechanical-pregnancy---primary:
    run: mechanical-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule93
      potentialCases:
        id: potentialCases
        source: pregnancy-class---primary/output
  pregnancy-operation---primary:
    run: pregnancy-operation---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule94
      potentialCases:
        id: potentialCases
        source: mechanical-pregnancy---primary/output
  pregnancy-puerperium---primary:
    run: pregnancy-puerperium---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule95
      potentialCases:
        id: potentialCases
        source: pregnancy-operation---primary/output
  therapeutic-pregnancy---primary:
    run: therapeutic-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule96
      potentialCases:
        id: potentialCases
        source: pregnancy-puerperium---primary/output
  fetoscopic-pregnancy---primary:
    run: fetoscopic-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule97
      potentialCases:
        id: potentialCases
        source: therapeutic-pregnancy---primary/output
  pregnancy-diagn---primary:
    run: pregnancy-diagn---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule98
      potentialCases:
        id: potentialCases
        source: fetoscopic-pregnancy---primary/output
  pregnancy-villus---primary:
    run: pregnancy-villus---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule99
      potentialCases:
        id: potentialCases
        source: pregnancy-diagn---primary/output
  pregnancy-drainage---primary:
    run: pregnancy-drainage---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule100
      potentialCases:
        id: potentialCases
        source: pregnancy-villus---primary/output
  pregnancy-cerclage---primary:
    run: pregnancy-cerclage---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule101
      potentialCases:
        id: potentialCases
        source: pregnancy-drainage---primary/output
  pregnancy-shirodkar---primary:
    run: pregnancy-shirodkar---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule102
      potentialCases:
        id: potentialCases
        source: pregnancy-cerclage---primary/output
  pregnancy-inversion---primary:
    run: pregnancy-inversion---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule103
      potentialCases:
        id: potentialCases
        source: pregnancy-shirodkar---primary/output
  surgical-pregnancy---primary:
    run: surgical-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule104
      potentialCases:
        id: potentialCases
        source: pregnancy-inversion---primary/output
  pregnancy-arm---primary:
    run: pregnancy-arm---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule105
      potentialCases:
        id: potentialCases
        source: surgical-pregnancy---primary/output
  pregnancy-vunspecified---primary:
    run: pregnancy-vunspecified---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule106
      potentialCases:
        id: potentialCases
        source: pregnancy-arm---primary/output
  upper-pregnancy---primary:
    run: upper-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule107
      potentialCases:
        id: potentialCases
        source: pregnancy-vunspecified---primary/output
  lower-pregnancy---primary:
    run: lower-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule108
      potentialCases:
        id: potentialCases
        source: upper-pregnancy---primary/output
  pregnancy-section---primary:
    run: pregnancy-section---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule109
      potentialCases:
        id: potentialCases
        source: lower-pregnancy---primary/output
  pregnancy-emergency---primary:
    run: pregnancy-emergency---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule110
      potentialCases:
        id: potentialCases
        source: pregnancy-section---primary/output
  pregnancy-ventouse---primary:
    run: pregnancy-ventouse---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule111
      potentialCases:
        id: potentialCases
        source: pregnancy-emergency---primary/output
  pregnancy-hysterectomy---primary:
    run: pregnancy-hysterectomy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule112
      potentialCases:
        id: potentialCases
        source: pregnancy-ventouse---primary/output
  manual-pregnancy---primary:
    run: manual-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule113
      potentialCases:
        id: potentialCases
        source: pregnancy-hysterectomy---primary/output
  pregnancy-vother---primary:
    run: pregnancy-vother---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule114
      potentialCases:
        id: potentialCases
        source: manual-pregnancy---primary/output
  pregnancy-concep---primary:
    run: pregnancy-concep---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule115
      potentialCases:
        id: potentialCases
        source: pregnancy-vother---primary/output
  pregnancy-liver---primary:
    run: pregnancy-liver---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule116
      potentialCases:
        id: potentialCases
        source: pregnancy-concep---primary/output
  pregnancy-repositioning---primary:
    run: pregnancy-repositioning---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule117
      potentialCases:
        id: potentialCases
        source: pregnancy-liver---primary/output
  pregnancy-exploration---primary:
    run: pregnancy-exploration---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule118
      potentialCases:
        id: potentialCases
        source: pregnancy-repositioning---primary/output
  pregnancy-control---primary:
    run: pregnancy-control---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule119
      potentialCases:
        id: potentialCases
        source: pregnancy-exploration---primary/output
  pregnancy-immed---primary:
    run: pregnancy-immed---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule120
      potentialCases:
        id: potentialCases
        source: pregnancy-control---primary/output
  pregnancy-analgesia---primary:
    run: pregnancy-analgesia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule121
      potentialCases:
        id: potentialCases
        source: pregnancy-immed---primary/output
  fetopelvic-pregnancy---primary:
    run: fetopelvic-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule122
      potentialCases:
        id: potentialCases
        source: pregnancy-analgesia---primary/output
  pregnancy-episiotomy---primary:
    run: pregnancy-episiotomy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule123
      potentialCases:
        id: potentialCases
        source: fetopelvic-pregnancy---primary/output
  secondary-pregnancy---primary:
    run: secondary-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule124
      potentialCases:
        id: potentialCases
        source: pregnancy-episiotomy---primary/output
  pregnancy-monitoring---primary:
    run: pregnancy-monitoring---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule125
      potentialCases:
        id: potentialCases
        source: secondary-pregnancy---primary/output
  foetal-pregnancy---primary:
    run: foetal-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule126
      potentialCases:
        id: potentialCases
        source: pregnancy-monitoring---primary/output
  venous-pregnancy---primary:
    run: venous-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule127
      potentialCases:
        id: potentialCases
        source: foetal-pregnancy---primary/output
  epidural-pregnancy---primary:
    run: epidural-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule128
      potentialCases:
        id: potentialCases
        source: venous-pregnancy---primary/output
  pregnancy-therapy---primary:
    run: pregnancy-therapy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule129
      potentialCases:
        id: potentialCases
        source: epidural-pregnancy---primary/output
  pregnancy-vitamin---primary:
    run: pregnancy-vitamin---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule130
      potentialCases:
        id: potentialCases
        source: pregnancy-therapy---primary/output
  pregnancy-supplement---primary:
    run: pregnancy-supplement---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule131
      potentialCases:
        id: potentialCases
        source: pregnancy-vitamin---primary/output
  clinic-pregnancy---primary:
    run: clinic-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule132
      potentialCases:
        id: potentialCases
        source: pregnancy-supplement---primary/output
  pregnancy-requested---primary:
    run: pregnancy-requested---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule133
      potentialCases:
        id: potentialCases
        source: clinic-pregnancy---primary/output
  pregnancy-termination---primary:
    run: pregnancy-termination---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule134
      potentialCases:
        id: potentialCases
        source: pregnancy-requested---primary/output
  pregnancy-woman---primary:
    run: pregnancy-woman---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule135
      potentialCases:
        id: potentialCases
        source: pregnancy-termination---primary/output
  pregnancy-symphysis---primary:
    run: pregnancy-symphysis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule136
      potentialCases:
        id: potentialCases
        source: pregnancy-woman---primary/output
  pregnancy-outcome---primary:
    run: pregnancy-outcome---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule137
      potentialCases:
        id: potentialCases
        source: pregnancy-symphysis---primary/output
  pregnancy-hydatidiform---primary:
    run: pregnancy-hydatidiform---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule138
      potentialCases:
        id: potentialCases
        source: pregnancy-outcome---primary/output
  pregnancy-abortion---primary:
    run: pregnancy-abortion---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule139
      potentialCases:
        id: potentialCases
        source: pregnancy-hydatidiform---primary/output
  spontaneous-pregnancy---primary:
    run: spontaneous-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule140
      potentialCases:
        id: potentialCases
        source: pregnancy-abortion---primary/output
  pregnancy-problemunspecifd---primary:
    run: pregnancy-problemunspecifd---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule141
      potentialCases:
        id: potentialCases
        source: spontaneous-pregnancy---primary/output
  pregnancy-sepsis---primary:
    run: pregnancy-sepsis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule142
      potentialCases:
        id: potentialCases
        source: pregnancy-problemunspecifd---primary/output
  heavy-pregnancy---primary:
    run: heavy-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule143
      potentialCases:
        id: potentialCases
        source: pregnancy-sepsis---primary/output
  pregnancy-incomp---primary:
    run: pregnancy-incomp---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule144
      potentialCases:
        id: potentialCases
        source: heavy-pregnancy---primary/output
  pregnancy-incompetence---primary:
    run: pregnancy-incompetence---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule145
      potentialCases:
        id: potentialCases
        source: pregnancy-incomp---primary/output
  pregnancy-produc---primary:
    run: pregnancy-produc---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule146
      potentialCases:
        id: potentialCases
        source: pregnancy-incompetence---primary/output
  complete-pregnancy---primary:
    run: complete-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule147
      potentialCases:
        id: potentialCases
        source: pregnancy-produc---primary/output
  complic-pregnancy---primary:
    run: complic-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule148
      potentialCases:
        id: potentialCases
        source: complete-pregnancy---primary/output
  pregnancy-complicated---primary:
    run: pregnancy-complicated---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule149
      potentialCases:
        id: potentialCases
        source: complic-pregnancy---primary/output
  pregnancy-compound---primary:
    run: pregnancy-compound---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule150
      potentialCases:
        id: potentialCases
        source: pregnancy-complicated---primary/output
  inevitable-pregnancy---primary:
    run: inevitable-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule151
      potentialCases:
        id: potentialCases
        source: pregnancy-compound---primary/output
  pregnancy-induced---primary:
    run: pregnancy-induced---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule152
      potentialCases:
        id: potentialCases
        source: inevitable-pregnancy---primary/output
  elective-pregnancy---primary:
    run: elective-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule153
      potentialCases:
        id: potentialCases
        source: pregnancy-induced---primary/output
  illegal-pregnancy---primary:
    run: illegal-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule154
      potentialCases:
        id: potentialCases
        source: elective-pregnancy---primary/output
  medical-pregnancy---primary:
    run: medical-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule155
      potentialCases:
        id: potentialCases
        source: illegal-pregnancy---primary/output
  pregnancy-shock---primary:
    run: pregnancy-shock---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule156
      potentialCases:
        id: potentialCases
        source: medical-pregnancy---primary/output
  pregnancy-attempted---primary:
    run: pregnancy-attempted---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule157
      potentialCases:
        id: potentialCases
        source: pregnancy-shock---primary/output
  abortive-pregnancy---primary:
    run: abortive-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule158
      potentialCases:
        id: potentialCases
        source: pregnancy-attempted---primary/output
  pregnancy-septicaemia---primary:
    run: pregnancy-septicaemia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule159
      potentialCases:
        id: potentialCases
        source: abortive-pregnancy---primary/output
  excessive-pregnancy---primary:
    run: excessive-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule160
      potentialCases:
        id: potentialCases
        source: pregnancy-septicaemia---primary/output
  pregnancy-bladder---primary:
    run: pregnancy-bladder---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule161
      potentialCases:
        id: potentialCases
        source: excessive-pregnancy---primary/output
  pregnancy-cervix---primary:
    run: pregnancy-cervix---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule162
      potentialCases:
        id: potentialCases
        source: pregnancy-bladder---primary/output
  renal-pregnancy---primary:
    run: renal-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule163
      potentialCases:
        id: potentialCases
        source: pregnancy-cervix---primary/output
  pregnancy-uraemia---primary:
    run: pregnancy-uraemia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule164
      potentialCases:
        id: potentialCases
        source: renal-pregnancy---primary/output
  pregnancy-embolism---primary:
    run: pregnancy-embolism---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule165
      potentialCases:
        id: potentialCases
        source: pregnancy-uraemia---primary/output
  pulmonary-pregnancy---primary:
    run: pulmonary-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule166
      potentialCases:
        id: potentialCases
        source: pregnancy-embolism---primary/output
  pregnancy-vadmission---primary:
    run: pregnancy-vadmission---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule167
      potentialCases:
        id: potentialCases
        source: pulmonary-pregnancy---primary/output
  early-pregnancy---primary:
    run: early-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule168
      potentialCases:
        id: potentialCases
        source: pregnancy-vadmission---primary/output
  pregnancy-threatened---primary:
    run: pregnancy-threatened---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule169
      potentialCases:
        id: potentialCases
        source: early-pregnancy---primary/output
  pregnancy-bleeding---primary:
    run: pregnancy-bleeding---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule170
      potentialCases:
        id: potentialCases
        source: pregnancy-threatened---primary/output
  pregnancy-antepartum---primary:
    run: pregnancy-antepartum---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule171
      potentialCases:
        id: potentialCases
        source: pregnancy-bleeding---primary/output
  pregnancy-uterus---primary:
    run: pregnancy-uterus---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule172
      potentialCases:
        id: potentialCases
        source: pregnancy-antepartum---primary/output
  pregnancy-defects---primary:
    run: pregnancy-defects---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule173
      potentialCases:
        id: potentialCases
        source: pregnancy-uterus---primary/output
  pregnancy-leiomyoma---primary:
    run: pregnancy-leiomyoma---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule174
      potentialCases:
        id: potentialCases
        source: pregnancy-defects---primary/output
  fibroid-pregnancy---primary:
    run: fibroid-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule175
      potentialCases:
        id: potentialCases
        source: pregnancy-leiomyoma---primary/output
  transient-pregnancy---primary:
    run: transient-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule176
      potentialCases:
        id: potentialCases
        source: fibroid-pregnancy---primary/output
  pregnancy-eclampsia---primary:
    run: pregnancy-eclampsia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule177
      potentialCases:
        id: potentialCases
        source: transient-pregnancy---primary/output
  pregnancy-toxaemia---primary:
    run: pregnancy-toxaemia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule178
      potentialCases:
        id: potentialCases
        source: pregnancy-eclampsia---primary/output
  severe-pregnancy---primary:
    run: severe-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule179
      potentialCases:
        id: potentialCases
        source: pregnancy-toxaemia---primary/output
  pregnancy-preexisting---primary:
    run: pregnancy-preexisting---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule180
      potentialCases:
        id: potentialCases
        source: severe-pregnancy---primary/output
  moderate-pregnancy---primary:
    run: moderate-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule181
      potentialCases:
        id: potentialCases
        source: pregnancy-preexisting---primary/output
  pregnancy-vomiting---primary:
    run: pregnancy-vomiting---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule182
      potentialCases:
        id: potentialCases
        source: moderate-pregnancy---primary/output
  pregnancy-hyperemesis---primary:
    run: pregnancy-hyperemesis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule183
      potentialCases:
        id: potentialCases
        source: pregnancy-vomiting---primary/output
  false-pregnancy---primary:
    run: false-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule184
      potentialCases:
        id: potentialCases
        source: pregnancy-hyperemesis---primary/output
  pregnancy-fetus---primary:
    run: pregnancy-fetus---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule185
      potentialCases:
        id: potentialCases
        source: false-pregnancy---primary/output
  pregnancy-bacteriuria---primary:
    run: pregnancy-bacteriuria---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule186
      potentialCases:
        id: potentialCases
        source: pregnancy-fetus---primary/output
  urinary-pregnancy---primary:
    run: urinary-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule187
      potentialCases:
        id: potentialCases
        source: pregnancy-bacteriuria---primary/output
  pregnancy-fatigue---primary:
    run: pregnancy-fatigue---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule188
      potentialCases:
        id: potentialCases
        source: urinary-pregnancy---primary/output
  pregnancy-glycosuria---primary:
    run: pregnancy-glycosuria---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule189
      potentialCases:
        id: potentialCases
        source: pregnancy-fatigue---primary/output
  pregnancy-tract---primary:
    run: pregnancy-tract---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule190
      potentialCases:
        id: potentialCases
        source: pregnancy-glycosuria---primary/output
  pregnancy-rubella---primary:
    run: pregnancy-rubella---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule191
      potentialCases:
        id: potentialCases
        source: pregnancy-tract---primary/output
  pregnancy-urethra---primary:
    run: pregnancy-urethra---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule192
      potentialCases:
        id: potentialCases
        source: pregnancy-rubella---primary/output
  pregnancy-disturbance---primary:
    run: pregnancy-disturbance---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule193
      potentialCases:
        id: potentialCases
        source: pregnancy-urethra---primary/output
  pregnancy-mellitus---primary:
    run: pregnancy-mellitus---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule194
      potentialCases:
        id: potentialCases
        source: pregnancy-disturbance---primary/output
  pregnancy-anaemia---primary:
    run: pregnancy-anaemia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule195
      potentialCases:
        id: potentialCases
        source: pregnancy-mellitus---primary/output
  pregnancy-dependence---primary:
    run: pregnancy-dependence---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule196
      potentialCases:
        id: potentialCases
        source: pregnancy-anaemia---primary/output
  congenital-pregnancy---primary:
    run: congenital-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule197
      potentialCases:
        id: potentialCases
        source: pregnancy-dependence---primary/output
  pregnancy-cardiovasc---primary:
    run: pregnancy-cardiovasc---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule198
      potentialCases:
        id: potentialCases
        source: congenital-pregnancy---primary/output
  pregnancy-heart---primary:
    run: pregnancy-heart---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule199
      potentialCases:
        id: potentialCases
        source: pregnancy-cardiovasc---primary/output
  pregnancy-continuing---primary:
    run: pregnancy-continuing---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule200
      potentialCases:
        id: potentialCases
        source: pregnancy-heart---primary/output
  neonatal-pregnancy---primary:
    run: neonatal-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule201
      potentialCases:
        id: potentialCases
        source: pregnancy-continuing---primary/output
  pregnancy-vtwin---primary:
    run: pregnancy-vtwin---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule202
      potentialCases:
        id: potentialCases
        source: neonatal-pregnancy---primary/output
  pregnancy-quadruplet---primary:
    run: pregnancy-quadruplet---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule203
      potentialCases:
        id: potentialCases
        source: pregnancy-vtwin---primary/output
  pregnancy-position---primary:
    run: pregnancy-position---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule204
      potentialCases:
        id: potentialCases
        source: pregnancy-quadruplet---primary/output
  unstable-pregnancy---primary:
    run: unstable-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule205
      potentialCases:
        id: potentialCases
        source: pregnancy-position---primary/output
  pregnancy-prolapsed---primary:
    run: pregnancy-prolapsed---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule206
      potentialCases:
        id: potentialCases
        source: unstable-pregnancy---primary/output
  pregnancy-pelvi---primary:
    run: pregnancy-pelvi---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule207
      potentialCases:
        id: potentialCases
        source: pregnancy-prolapsed---primary/output
  large-pregnancy---primary:
    run: large-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule208
      potentialCases:
        id: potentialCases
        source: pregnancy-pelvi---primary/output
  hydrocephalic-pregnancy---primary:
    run: hydrocephalic-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule209
      potentialCases:
        id: potentialCases
        source: large-pregnancy---primary/output
  pregnancy-bicornuate---primary:
    run: pregnancy-bicornuate---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule210
      potentialCases:
        id: potentialCases
        source: hydrocephalic-pregnancy---primary/output
  pregnancy-cystocele---primary:
    run: pregnancy-cystocele---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule211
      potentialCases:
        id: potentialCases
        source: pregnancy-bicornuate---primary/output
  pregnancy-rectocele---primary:
    run: pregnancy-rectocele---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule212
      potentialCases:
        id: potentialCases
        source: pregnancy-cystocele---primary/output
  cervical-pregnancy---primary:
    run: cervical-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule213
      potentialCases:
        id: potentialCases
        source: pregnancy-rectocele---primary/output
  pregnancy-polyp---primary:
    run: pregnancy-polyp---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule214
      potentialCases:
        id: potentialCases
        source: cervical-pregnancy---primary/output
  pregnancy-vulva---primary:
    run: pregnancy-vulva---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule215
      potentialCases:
        id: potentialCases
        source: pregnancy-polyp---primary/output
  pregnancy-system---primary:
    run: pregnancy-system---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule216
      potentialCases:
        id: potentialCases
        source: pregnancy-vulva---primary/output
  pregnancy-suspected---primary:
    run: pregnancy-suspected---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule217
      potentialCases:
        id: potentialCases
        source: pregnancy-system---primary/output
  hereditary-pregnancy---primary:
    run: hereditary-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule218
      potentialCases:
        id: potentialCases
        source: pregnancy-suspected---primary/output
  pregnancy-damage---primary:
    run: pregnancy-damage---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule219
      potentialCases:
        id: potentialCases
        source: hereditary-pregnancy---primary/output
  pregnancy-device---primary:
    run: pregnancy-device---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule220
      potentialCases:
        id: potentialCases
        source: pregnancy-damage---primary/output
  pregnancy-rhesus---primary:
    run: pregnancy-rhesus---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule221
      potentialCases:
        id: potentialCases
        source: pregnancy-device---primary/output
  pregnancy-bradycardia---primary:
    run: pregnancy-bradycardia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule222
      potentialCases:
        id: potentialCases
        source: pregnancy-rhesus---primary/output
  pregnancy-tachycardia---primary:
    run: pregnancy-tachycardia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule223
      potentialCases:
        id: potentialCases
        source: pregnancy-bradycardia---primary/output
  pregnancy-stained---primary:
    run: pregnancy-stained---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule224
      potentialCases:
        id: potentialCases
        source: pregnancy-tachycardia---primary/output
  biochemical-pregnancy---primary:
    run: biochemical-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule225
      potentialCases:
        id: potentialCases
        source: pregnancy-stained---primary/output
  pregnancy-deceleration---primary:
    run: pregnancy-deceleration---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule226
      potentialCases:
        id: potentialCases
        source: biochemical-pregnancy---primary/output
  pregnancy-death---primary:
    run: pregnancy-death---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule227
      potentialCases:
        id: potentialCases
        source: pregnancy-deceleration---primary/output
  ragged-pregnancy---primary:
    run: ragged-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule228
      potentialCases:
        id: potentialCases
        source: pregnancy-death---primary/output
  gritty-pregnancy---primary:
    run: gritty-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule229
      potentialCases:
        id: potentialCases
        source: ragged-pregnancy---primary/output
  pregnancy-membranitis---primary:
    run: pregnancy-membranitis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule230
      potentialCases:
        id: potentialCases
        source: gritty-pregnancy---primary/output
  pregnancy-pyrexia---primary:
    run: pregnancy-pyrexia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule231
      potentialCases:
        id: potentialCases
        source: pregnancy-membranitis---primary/output
  pregnancy-finding---primary:
    run: pregnancy-finding---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule232
      potentialCases:
        id: potentialCases
        source: pregnancy-pyrexia---primary/output
  pregnancy-malnutrition---primary:
    run: pregnancy-malnutrition---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule233
      potentialCases:
        id: potentialCases
        source: pregnancy-finding---primary/output
  pregnancy-arrest---primary:
    run: pregnancy-arrest---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule234
      potentialCases:
        id: potentialCases
        source: pregnancy-malnutrition---primary/output
  persistent-pregnancy---primary:
    run: persistent-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule235
      potentialCases:
        id: potentialCases
        source: pregnancy-arrest---primary/output
  pregnancy-dystocia---primary:
    run: pregnancy-dystocia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule236
      potentialCases:
        id: potentialCases
        source: persistent-pregnancy---primary/output
  pregnancy-shoulder---primary:
    run: pregnancy-shoulder---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule237
      potentialCases:
        id: potentialCases
        source: pregnancy-dystocia---primary/output
  pregnancy-locked---primary:
    run: pregnancy-locked---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule238
      potentialCases:
        id: potentialCases
        source: pregnancy-shoulder---primary/output
  pregnancy-inertium---primary:
    run: pregnancy-inertium---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule239
      potentialCases:
        id: potentialCases
        source: pregnancy-locked---primary/output
  pregnancy-precipitate---primary:
    run: pregnancy-precipitate---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule240
      potentialCases:
        id: potentialCases
        source: pregnancy-inertium---primary/output
  hypertonic-pregnancy---primary:
    run: hypertonic-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule241
      potentialCases:
        id: potentialCases
        source: pregnancy-precipitate---primary/output
  round-pregnancy---primary:
    run: round-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule242
      potentialCases:
        id: potentialCases
        source: hypertonic-pregnancy---primary/output
  pregnancy-entanglement---primary:
    run: pregnancy-entanglement---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule243
      potentialCases:
        id: potentialCases
        source: round-pregnancy---primary/output
  pregnancy-praevia---primary:
    run: pregnancy-praevia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule244
      potentialCases:
        id: potentialCases
        source: pregnancy-entanglement---primary/output
  pregnancy-insertion---primary:
    run: pregnancy-insertion---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule245
      potentialCases:
        id: potentialCases
        source: pregnancy-praevia---primary/output
  pregnancy-lesion---primary:
    run: pregnancy-lesion---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule246
      potentialCases:
        id: potentialCases
        source: pregnancy-insertion---primary/output
  pregnancy-organ---primary:
    run: pregnancy-organ---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule247
      potentialCases:
        id: potentialCases
        source: pregnancy-lesion---primary/output
  pregnancy-postpartum---primary:
    run: pregnancy-postpartum---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule248
      potentialCases:
        id: potentialCases
        source: pregnancy-organ---primary/output
  pregnancy-membrane---primary:
    run: pregnancy-membrane---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule249
      potentialCases:
        id: potentialCases
        source: pregnancy-postpartum---primary/output
  pregnancy-headache---primary:
    run: pregnancy-headache---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule250
      potentialCases:
        id: potentialCases
        source: pregnancy-membrane---primary/output
  pregnancy-intubation---primary:
    run: pregnancy-intubation---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule251
      potentialCases:
        id: potentialCases
        source: pregnancy-headache---primary/output
  pregnancy-hypotension---primary:
    run: pregnancy-hypotension---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule252
      potentialCases:
        id: potentialCases
        source: pregnancy-intubation---primary/output
  pregnancy-procedure---primary:
    run: pregnancy-procedure---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule253
      potentialCases:
        id: potentialCases
        source: pregnancy-hypotension---primary/output
  pregnancy-extraction---primary:
    run: pregnancy-extraction---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule254
      potentialCases:
        id: potentialCases
        source: pregnancy-procedure---primary/output
  pregnancy-intrapartum---primary:
    run: pregnancy-intrapartum---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule255
      potentialCases:
        id: potentialCases
        source: pregnancy-extraction---primary/output
  pregnancy-varice---primary:
    run: pregnancy-varice---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule256
      potentialCases:
        id: potentialCases
        source: pregnancy-intrapartum---primary/output
  pregnancy-thrombophlebitis---primary:
    run: pregnancy-thrombophlebitis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule257
      potentialCases:
        id: potentialCases
        source: pregnancy-varice---primary/output
  pregnancy-thrombosis---primary:
    run: pregnancy-thrombosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule258
      potentialCases:
        id: potentialCases
        source: pregnancy-thrombophlebitis---primary/output
  obstetric-pregnancy---primary:
    run: obstetric-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule259
      potentialCases:
        id: potentialCases
        source: pregnancy-thrombosis---primary/output
  pregnancy-vertex---primary:
    run: pregnancy-vertex---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule260
      potentialCases:
        id: potentialCases
        source: obstetric-pregnancy---primary/output
  pregnancy-evidence---primary:
    run: pregnancy-evidence---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule261
      potentialCases:
        id: potentialCases
        source: pregnancy-vertex---primary/output
  pregnancy-neonate---primary:
    run: pregnancy-neonate---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule262
      potentialCases:
        id: potentialCases
        source: pregnancy-evidence---primary/output
  pregnancy-affected---primary:
    run: pregnancy-affected---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule263
      potentialCases:
        id: potentialCases
        source: pregnancy-neonate---primary/output
  pregnancy-retardation---primary:
    run: pregnancy-retardation---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule264
      potentialCases:
        id: potentialCases
        source: pregnancy-affected---primary/output
  pregnancy-hypoxia---primary:
    run: pregnancy-hypoxia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule265
      potentialCases:
        id: potentialCases
        source: pregnancy-retardation---primary/output
  pregnancy-score---primary:
    run: pregnancy-score---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule266
      potentialCases:
        id: potentialCases
        source: pregnancy-hypoxia---primary/output
  pregnancy-asphyxia---primary:
    run: pregnancy-asphyxia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule267
      potentialCases:
        id: potentialCases
        source: pregnancy-score---primary/output
  haemolytic-pregnancy---primary:
    run: haemolytic-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule268
      potentialCases:
        id: potentialCases
        source: pregnancy-asphyxia---primary/output
  pregnancy-fetalis---primary:
    run: pregnancy-fetalis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule269
      potentialCases:
        id: potentialCases
        source: haemolytic-pregnancy---primary/output
  pregnancy-intrauterine---primary:
    run: pregnancy-intrauterine---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule270
      potentialCases:
        id: potentialCases
        source: pregnancy-fetalis---primary/output
  pregnancy-pattern---primary:
    run: pregnancy-pattern---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule271
      potentialCases:
        id: potentialCases
        source: pregnancy-intrauterine---primary/output
  pregnancy-quantity---primary:
    run: pregnancy-quantity---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule272
      potentialCases:
        id: potentialCases
        source: pregnancy-pattern---primary/output
  single-pregnancy---primary:
    run: single-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule273
      potentialCases:
        id: potentialCases
        source: pregnancy-quantity---primary/output
  pregnancy-sibling---primary:
    run: pregnancy-sibling---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule274
      potentialCases:
        id: potentialCases
        source: single-pregnancy---primary/output
  pregnancy-period---primary:
    run: pregnancy-period---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule275
      potentialCases:
        id: potentialCases
        source: pregnancy-sibling---primary/output
  pregnancy-duration---primary:
    run: pregnancy-duration---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule276
      potentialCases:
        id: potentialCases
        source: pregnancy-period---primary/output
  pregnancy-viable---primary:
    run: pregnancy-viable---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule277
      potentialCases:
        id: potentialCases
        source: pregnancy-duration---primary/output
  fundal-pregnancy---primary:
    run: fundal-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule278
      potentialCases:
        id: potentialCases
        source: pregnancy-viable---primary/output
  pregnancy-abdoman---primary:
    run: pregnancy-abdoman---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule279
      potentialCases:
        id: potentialCases
        source: fundal-pregnancy---primary/output
  pregnancy-contracted---primary:
    run: pregnancy-contracted---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule280
      potentialCases:
        id: potentialCases
        source: pregnancy-abdoman---primary/output
  tight-pregnancy---primary:
    run: tight-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule281
      potentialCases:
        id: potentialCases
        source: pregnancy-contracted---primary/output
  regular-pregnancy---primary:
    run: regular-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule282
      potentialCases:
        id: potentialCases
        source: tight-pregnancy---primary/output
  pregnancy-detected---primary:
    run: pregnancy-detected---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule283
      potentialCases:
        id: potentialCases
        source: regular-pregnancy---primary/output
  pregnancy-frequency---primary:
    run: pregnancy-frequency---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule284
      potentialCases:
        id: potentialCases
        source: pregnancy-detected---primary/output
  pregnancy-established---primary:
    run: pregnancy-established---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule285
      potentialCases:
        id: potentialCases
        source: pregnancy-frequency---primary/output
  pregnancy-progress---primary:
    run: pregnancy-progress---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule286
      potentialCases:
        id: potentialCases
        source: pregnancy-established---primary/output
  rapid-pregnancy---primary:
    run: rapid-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule287
      potentialCases:
        id: potentialCases
        source: pregnancy-progress---primary/output
  pregnancy-onset---primary:
    run: pregnancy-onset---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule288
      potentialCases:
        id: potentialCases
        source: rapid-pregnancy---primary/output
  pregnancy-variability---primary:
    run: pregnancy-variability---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule289
      potentialCases:
        id: potentialCases
        source: pregnancy-onset---primary/output
  retroplacental-pregnancy---primary:
    run: retroplacental-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule290
      potentialCases:
        id: potentialCases
        source: pregnancy-variability---primary/output
  fresh-pregnancy---primary:
    run: fresh-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule291
      potentialCases:
        id: potentialCases
        source: retroplacental-pregnancy---primary/output
  chorionic-pregnancy---primary:
    run: chorionic-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule292
      potentialCases:
        id: potentialCases
        source: fresh-pregnancy---primary/output
  pregnancy-water---primary:
    run: pregnancy-water---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule293
      potentialCases:
        id: potentialCases
        source: chorionic-pregnancy---primary/output
  pregnancy-liquor---primary:
    run: pregnancy-liquor---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule294
      potentialCases:
        id: potentialCases
        source: pregnancy-water---primary/output
  pregnancy-reduced---primary:
    run: pregnancy-reduced---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule295
      potentialCases:
        id: potentialCases
        source: pregnancy-liquor---primary/output
  pregnancy-staining---primary:
    run: pregnancy-staining---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule296
      potentialCases:
        id: potentialCases
        source: pregnancy-reduced---primary/output
  umbilical-pregnancy---primary:
    run: umbilical-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule297
      potentialCases:
        id: potentialCases
        source: pregnancy-staining---primary/output
  pregnancy-number---primary:
    run: pregnancy-number---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule298
      potentialCases:
        id: potentialCases
        source: umbilical-pregnancy---primary/output
  pregnancy-observation---primary:
    run: pregnancy-observation---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule299
      potentialCases:
        id: potentialCases
        source: pregnancy-number---primary/output
  pregnancy-tracing---primary:
    run: pregnancy-tracing---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule300
      potentialCases:
        id: potentialCases
        source: pregnancy-observation---primary/output
  pregnancy-baseline---primary:
    run: pregnancy-baseline---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule301
      potentialCases:
        id: potentialCases
        source: pregnancy-tracing---primary/output
  pregnancy-dip---primary:
    run: pregnancy-dip---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule302
      potentialCases:
        id: potentialCases
        source: pregnancy-baseline---primary/output
  pregnancy-supervision---primary:
    run: pregnancy-supervision---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule303
      potentialCases:
        id: potentialCases
        source: pregnancy-dip---primary/output
  pregnancy-state---primary:
    run: pregnancy-state---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule304
      potentialCases:
        id: potentialCases
        source: pregnancy-supervision---primary/output
  pregnancy-vsupervision---primary:
    run: pregnancy-vsupervision---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule305
      potentialCases:
        id: potentialCases
        source: pregnancy-state---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule306
      potentialCases:
        id: potentialCases
        source: pregnancy-vsupervision---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
  inputModule16:
    id: inputModule16
    doc: Python implementation unit
    type: File
  inputModule17:
    id: inputModule17
    doc: Python implementation unit
    type: File
  inputModule18:
    id: inputModule18
    doc: Python implementation unit
    type: File
  inputModule19:
    id: inputModule19
    doc: Python implementation unit
    type: File
  inputModule20:
    id: inputModule20
    doc: Python implementation unit
    type: File
  inputModule21:
    id: inputModule21
    doc: Python implementation unit
    type: File
  inputModule22:
    id: inputModule22
    doc: Python implementation unit
    type: File
  inputModule23:
    id: inputModule23
    doc: Python implementation unit
    type: File
  inputModule24:
    id: inputModule24
    doc: Python implementation unit
    type: File
  inputModule25:
    id: inputModule25
    doc: Python implementation unit
    type: File
  inputModule26:
    id: inputModule26
    doc: Python implementation unit
    type: File
  inputModule27:
    id: inputModule27
    doc: Python implementation unit
    type: File
  inputModule28:
    id: inputModule28
    doc: Python implementation unit
    type: File
  inputModule29:
    id: inputModule29
    doc: Python implementation unit
    type: File
  inputModule30:
    id: inputModule30
    doc: Python implementation unit
    type: File
  inputModule31:
    id: inputModule31
    doc: Python implementation unit
    type: File
  inputModule32:
    id: inputModule32
    doc: Python implementation unit
    type: File
  inputModule33:
    id: inputModule33
    doc: Python implementation unit
    type: File
  inputModule34:
    id: inputModule34
    doc: Python implementation unit
    type: File
  inputModule35:
    id: inputModule35
    doc: Python implementation unit
    type: File
  inputModule36:
    id: inputModule36
    doc: Python implementation unit
    type: File
  inputModule37:
    id: inputModule37
    doc: Python implementation unit
    type: File
  inputModule38:
    id: inputModule38
    doc: Python implementation unit
    type: File
  inputModule39:
    id: inputModule39
    doc: Python implementation unit
    type: File
  inputModule40:
    id: inputModule40
    doc: Python implementation unit
    type: File
  inputModule41:
    id: inputModule41
    doc: Python implementation unit
    type: File
  inputModule42:
    id: inputModule42
    doc: Python implementation unit
    type: File
  inputModule43:
    id: inputModule43
    doc: Python implementation unit
    type: File
  inputModule44:
    id: inputModule44
    doc: Python implementation unit
    type: File
  inputModule45:
    id: inputModule45
    doc: Python implementation unit
    type: File
  inputModule46:
    id: inputModule46
    doc: Python implementation unit
    type: File
  inputModule47:
    id: inputModule47
    doc: Python implementation unit
    type: File
  inputModule48:
    id: inputModule48
    doc: Python implementation unit
    type: File
  inputModule49:
    id: inputModule49
    doc: Python implementation unit
    type: File
  inputModule50:
    id: inputModule50
    doc: Python implementation unit
    type: File
  inputModule51:
    id: inputModule51
    doc: Python implementation unit
    type: File
  inputModule52:
    id: inputModule52
    doc: Python implementation unit
    type: File
  inputModule53:
    id: inputModule53
    doc: Python implementation unit
    type: File
  inputModule54:
    id: inputModule54
    doc: Python implementation unit
    type: File
  inputModule55:
    id: inputModule55
    doc: Python implementation unit
    type: File
  inputModule56:
    id: inputModule56
    doc: Python implementation unit
    type: File
  inputModule57:
    id: inputModule57
    doc: Python implementation unit
    type: File
  inputModule58:
    id: inputModule58
    doc: Python implementation unit
    type: File
  inputModule59:
    id: inputModule59
    doc: Python implementation unit
    type: File
  inputModule60:
    id: inputModule60
    doc: Python implementation unit
    type: File
  inputModule61:
    id: inputModule61
    doc: Python implementation unit
    type: File
  inputModule62:
    id: inputModule62
    doc: Python implementation unit
    type: File
  inputModule63:
    id: inputModule63
    doc: Python implementation unit
    type: File
  inputModule64:
    id: inputModule64
    doc: Python implementation unit
    type: File
  inputModule65:
    id: inputModule65
    doc: Python implementation unit
    type: File
  inputModule66:
    id: inputModule66
    doc: Python implementation unit
    type: File
  inputModule67:
    id: inputModule67
    doc: Python implementation unit
    type: File
  inputModule68:
    id: inputModule68
    doc: Python implementation unit
    type: File
  inputModule69:
    id: inputModule69
    doc: Python implementation unit
    type: File
  inputModule70:
    id: inputModule70
    doc: Python implementation unit
    type: File
  inputModule71:
    id: inputModule71
    doc: Python implementation unit
    type: File
  inputModule72:
    id: inputModule72
    doc: Python implementation unit
    type: File
  inputModule73:
    id: inputModule73
    doc: Python implementation unit
    type: File
  inputModule74:
    id: inputModule74
    doc: Python implementation unit
    type: File
  inputModule75:
    id: inputModule75
    doc: Python implementation unit
    type: File
  inputModule76:
    id: inputModule76
    doc: Python implementation unit
    type: File
  inputModule77:
    id: inputModule77
    doc: Python implementation unit
    type: File
  inputModule78:
    id: inputModule78
    doc: Python implementation unit
    type: File
  inputModule79:
    id: inputModule79
    doc: Python implementation unit
    type: File
  inputModule80:
    id: inputModule80
    doc: Python implementation unit
    type: File
  inputModule81:
    id: inputModule81
    doc: Python implementation unit
    type: File
  inputModule82:
    id: inputModule82
    doc: Python implementation unit
    type: File
  inputModule83:
    id: inputModule83
    doc: Python implementation unit
    type: File
  inputModule84:
    id: inputModule84
    doc: Python implementation unit
    type: File
  inputModule85:
    id: inputModule85
    doc: Python implementation unit
    type: File
  inputModule86:
    id: inputModule86
    doc: Python implementation unit
    type: File
  inputModule87:
    id: inputModule87
    doc: Python implementation unit
    type: File
  inputModule88:
    id: inputModule88
    doc: Python implementation unit
    type: File
  inputModule89:
    id: inputModule89
    doc: Python implementation unit
    type: File
  inputModule90:
    id: inputModule90
    doc: Python implementation unit
    type: File
  inputModule91:
    id: inputModule91
    doc: Python implementation unit
    type: File
  inputModule92:
    id: inputModule92
    doc: Python implementation unit
    type: File
  inputModule93:
    id: inputModule93
    doc: Python implementation unit
    type: File
  inputModule94:
    id: inputModule94
    doc: Python implementation unit
    type: File
  inputModule95:
    id: inputModule95
    doc: Python implementation unit
    type: File
  inputModule96:
    id: inputModule96
    doc: Python implementation unit
    type: File
  inputModule97:
    id: inputModule97
    doc: Python implementation unit
    type: File
  inputModule98:
    id: inputModule98
    doc: Python implementation unit
    type: File
  inputModule99:
    id: inputModule99
    doc: Python implementation unit
    type: File
  inputModule100:
    id: inputModule100
    doc: Python implementation unit
    type: File
  inputModule101:
    id: inputModule101
    doc: Python implementation unit
    type: File
  inputModule102:
    id: inputModule102
    doc: Python implementation unit
    type: File
  inputModule103:
    id: inputModule103
    doc: Python implementation unit
    type: File
  inputModule104:
    id: inputModule104
    doc: Python implementation unit
    type: File
  inputModule105:
    id: inputModule105
    doc: Python implementation unit
    type: File
  inputModule106:
    id: inputModule106
    doc: Python implementation unit
    type: File
  inputModule107:
    id: inputModule107
    doc: Python implementation unit
    type: File
  inputModule108:
    id: inputModule108
    doc: Python implementation unit
    type: File
  inputModule109:
    id: inputModule109
    doc: Python implementation unit
    type: File
  inputModule110:
    id: inputModule110
    doc: Python implementation unit
    type: File
  inputModule111:
    id: inputModule111
    doc: Python implementation unit
    type: File
  inputModule112:
    id: inputModule112
    doc: Python implementation unit
    type: File
  inputModule113:
    id: inputModule113
    doc: Python implementation unit
    type: File
  inputModule114:
    id: inputModule114
    doc: Python implementation unit
    type: File
  inputModule115:
    id: inputModule115
    doc: Python implementation unit
    type: File
  inputModule116:
    id: inputModule116
    doc: Python implementation unit
    type: File
  inputModule117:
    id: inputModule117
    doc: Python implementation unit
    type: File
  inputModule118:
    id: inputModule118
    doc: Python implementation unit
    type: File
  inputModule119:
    id: inputModule119
    doc: Python implementation unit
    type: File
  inputModule120:
    id: inputModule120
    doc: Python implementation unit
    type: File
  inputModule121:
    id: inputModule121
    doc: Python implementation unit
    type: File
  inputModule122:
    id: inputModule122
    doc: Python implementation unit
    type: File
  inputModule123:
    id: inputModule123
    doc: Python implementation unit
    type: File
  inputModule124:
    id: inputModule124
    doc: Python implementation unit
    type: File
  inputModule125:
    id: inputModule125
    doc: Python implementation unit
    type: File
  inputModule126:
    id: inputModule126
    doc: Python implementation unit
    type: File
  inputModule127:
    id: inputModule127
    doc: Python implementation unit
    type: File
  inputModule128:
    id: inputModule128
    doc: Python implementation unit
    type: File
  inputModule129:
    id: inputModule129
    doc: Python implementation unit
    type: File
  inputModule130:
    id: inputModule130
    doc: Python implementation unit
    type: File
  inputModule131:
    id: inputModule131
    doc: Python implementation unit
    type: File
  inputModule132:
    id: inputModule132
    doc: Python implementation unit
    type: File
  inputModule133:
    id: inputModule133
    doc: Python implementation unit
    type: File
  inputModule134:
    id: inputModule134
    doc: Python implementation unit
    type: File
  inputModule135:
    id: inputModule135
    doc: Python implementation unit
    type: File
  inputModule136:
    id: inputModule136
    doc: Python implementation unit
    type: File
  inputModule137:
    id: inputModule137
    doc: Python implementation unit
    type: File
  inputModule138:
    id: inputModule138
    doc: Python implementation unit
    type: File
  inputModule139:
    id: inputModule139
    doc: Python implementation unit
    type: File
  inputModule140:
    id: inputModule140
    doc: Python implementation unit
    type: File
  inputModule141:
    id: inputModule141
    doc: Python implementation unit
    type: File
  inputModule142:
    id: inputModule142
    doc: Python implementation unit
    type: File
  inputModule143:
    id: inputModule143
    doc: Python implementation unit
    type: File
  inputModule144:
    id: inputModule144
    doc: Python implementation unit
    type: File
  inputModule145:
    id: inputModule145
    doc: Python implementation unit
    type: File
  inputModule146:
    id: inputModule146
    doc: Python implementation unit
    type: File
  inputModule147:
    id: inputModule147
    doc: Python implementation unit
    type: File
  inputModule148:
    id: inputModule148
    doc: Python implementation unit
    type: File
  inputModule149:
    id: inputModule149
    doc: Python implementation unit
    type: File
  inputModule150:
    id: inputModule150
    doc: Python implementation unit
    type: File
  inputModule151:
    id: inputModule151
    doc: Python implementation unit
    type: File
  inputModule152:
    id: inputModule152
    doc: Python implementation unit
    type: File
  inputModule153:
    id: inputModule153
    doc: Python implementation unit
    type: File
  inputModule154:
    id: inputModule154
    doc: Python implementation unit
    type: File
  inputModule155:
    id: inputModule155
    doc: Python implementation unit
    type: File
  inputModule156:
    id: inputModule156
    doc: Python implementation unit
    type: File
  inputModule157:
    id: inputModule157
    doc: Python implementation unit
    type: File
  inputModule158:
    id: inputModule158
    doc: Python implementation unit
    type: File
  inputModule159:
    id: inputModule159
    doc: Python implementation unit
    type: File
  inputModule160:
    id: inputModule160
    doc: Python implementation unit
    type: File
  inputModule161:
    id: inputModule161
    doc: Python implementation unit
    type: File
  inputModule162:
    id: inputModule162
    doc: Python implementation unit
    type: File
  inputModule163:
    id: inputModule163
    doc: Python implementation unit
    type: File
  inputModule164:
    id: inputModule164
    doc: Python implementation unit
    type: File
  inputModule165:
    id: inputModule165
    doc: Python implementation unit
    type: File
  inputModule166:
    id: inputModule166
    doc: Python implementation unit
    type: File
  inputModule167:
    id: inputModule167
    doc: Python implementation unit
    type: File
  inputModule168:
    id: inputModule168
    doc: Python implementation unit
    type: File
  inputModule169:
    id: inputModule169
    doc: Python implementation unit
    type: File
  inputModule170:
    id: inputModule170
    doc: Python implementation unit
    type: File
  inputModule171:
    id: inputModule171
    doc: Python implementation unit
    type: File
  inputModule172:
    id: inputModule172
    doc: Python implementation unit
    type: File
  inputModule173:
    id: inputModule173
    doc: Python implementation unit
    type: File
  inputModule174:
    id: inputModule174
    doc: Python implementation unit
    type: File
  inputModule175:
    id: inputModule175
    doc: Python implementation unit
    type: File
  inputModule176:
    id: inputModule176
    doc: Python implementation unit
    type: File
  inputModule177:
    id: inputModule177
    doc: Python implementation unit
    type: File
  inputModule178:
    id: inputModule178
    doc: Python implementation unit
    type: File
  inputModule179:
    id: inputModule179
    doc: Python implementation unit
    type: File
  inputModule180:
    id: inputModule180
    doc: Python implementation unit
    type: File
  inputModule181:
    id: inputModule181
    doc: Python implementation unit
    type: File
  inputModule182:
    id: inputModule182
    doc: Python implementation unit
    type: File
  inputModule183:
    id: inputModule183
    doc: Python implementation unit
    type: File
  inputModule184:
    id: inputModule184
    doc: Python implementation unit
    type: File
  inputModule185:
    id: inputModule185
    doc: Python implementation unit
    type: File
  inputModule186:
    id: inputModule186
    doc: Python implementation unit
    type: File
  inputModule187:
    id: inputModule187
    doc: Python implementation unit
    type: File
  inputModule188:
    id: inputModule188
    doc: Python implementation unit
    type: File
  inputModule189:
    id: inputModule189
    doc: Python implementation unit
    type: File
  inputModule190:
    id: inputModule190
    doc: Python implementation unit
    type: File
  inputModule191:
    id: inputModule191
    doc: Python implementation unit
    type: File
  inputModule192:
    id: inputModule192
    doc: Python implementation unit
    type: File
  inputModule193:
    id: inputModule193
    doc: Python implementation unit
    type: File
  inputModule194:
    id: inputModule194
    doc: Python implementation unit
    type: File
  inputModule195:
    id: inputModule195
    doc: Python implementation unit
    type: File
  inputModule196:
    id: inputModule196
    doc: Python implementation unit
    type: File
  inputModule197:
    id: inputModule197
    doc: Python implementation unit
    type: File
  inputModule198:
    id: inputModule198
    doc: Python implementation unit
    type: File
  inputModule199:
    id: inputModule199
    doc: Python implementation unit
    type: File
  inputModule200:
    id: inputModule200
    doc: Python implementation unit
    type: File
  inputModule201:
    id: inputModule201
    doc: Python implementation unit
    type: File
  inputModule202:
    id: inputModule202
    doc: Python implementation unit
    type: File
  inputModule203:
    id: inputModule203
    doc: Python implementation unit
    type: File
  inputModule204:
    id: inputModule204
    doc: Python implementation unit
    type: File
  inputModule205:
    id: inputModule205
    doc: Python implementation unit
    type: File
  inputModule206:
    id: inputModule206
    doc: Python implementation unit
    type: File
  inputModule207:
    id: inputModule207
    doc: Python implementation unit
    type: File
  inputModule208:
    id: inputModule208
    doc: Python implementation unit
    type: File
  inputModule209:
    id: inputModule209
    doc: Python implementation unit
    type: File
  inputModule210:
    id: inputModule210
    doc: Python implementation unit
    type: File
  inputModule211:
    id: inputModule211
    doc: Python implementation unit
    type: File
  inputModule212:
    id: inputModule212
    doc: Python implementation unit
    type: File
  inputModule213:
    id: inputModule213
    doc: Python implementation unit
    type: File
  inputModule214:
    id: inputModule214
    doc: Python implementation unit
    type: File
  inputModule215:
    id: inputModule215
    doc: Python implementation unit
    type: File
  inputModule216:
    id: inputModule216
    doc: Python implementation unit
    type: File
  inputModule217:
    id: inputModule217
    doc: Python implementation unit
    type: File
  inputModule218:
    id: inputModule218
    doc: Python implementation unit
    type: File
  inputModule219:
    id: inputModule219
    doc: Python implementation unit
    type: File
  inputModule220:
    id: inputModule220
    doc: Python implementation unit
    type: File
  inputModule221:
    id: inputModule221
    doc: Python implementation unit
    type: File
  inputModule222:
    id: inputModule222
    doc: Python implementation unit
    type: File
  inputModule223:
    id: inputModule223
    doc: Python implementation unit
    type: File
  inputModule224:
    id: inputModule224
    doc: Python implementation unit
    type: File
  inputModule225:
    id: inputModule225
    doc: Python implementation unit
    type: File
  inputModule226:
    id: inputModule226
    doc: Python implementation unit
    type: File
  inputModule227:
    id: inputModule227
    doc: Python implementation unit
    type: File
  inputModule228:
    id: inputModule228
    doc: Python implementation unit
    type: File
  inputModule229:
    id: inputModule229
    doc: Python implementation unit
    type: File
  inputModule230:
    id: inputModule230
    doc: Python implementation unit
    type: File
  inputModule231:
    id: inputModule231
    doc: Python implementation unit
    type: File
  inputModule232:
    id: inputModule232
    doc: Python implementation unit
    type: File
  inputModule233:
    id: inputModule233
    doc: Python implementation unit
    type: File
  inputModule234:
    id: inputModule234
    doc: Python implementation unit
    type: File
  inputModule235:
    id: inputModule235
    doc: Python implementation unit
    type: File
  inputModule236:
    id: inputModule236
    doc: Python implementation unit
    type: File
  inputModule237:
    id: inputModule237
    doc: Python implementation unit
    type: File
  inputModule238:
    id: inputModule238
    doc: Python implementation unit
    type: File
  inputModule239:
    id: inputModule239
    doc: Python implementation unit
    type: File
  inputModule240:
    id: inputModule240
    doc: Python implementation unit
    type: File
  inputModule241:
    id: inputModule241
    doc: Python implementation unit
    type: File
  inputModule242:
    id: inputModule242
    doc: Python implementation unit
    type: File
  inputModule243:
    id: inputModule243
    doc: Python implementation unit
    type: File
  inputModule244:
    id: inputModule244
    doc: Python implementation unit
    type: File
  inputModule245:
    id: inputModule245
    doc: Python implementation unit
    type: File
  inputModule246:
    id: inputModule246
    doc: Python implementation unit
    type: File
  inputModule247:
    id: inputModule247
    doc: Python implementation unit
    type: File
  inputModule248:
    id: inputModule248
    doc: Python implementation unit
    type: File
  inputModule249:
    id: inputModule249
    doc: Python implementation unit
    type: File
  inputModule250:
    id: inputModule250
    doc: Python implementation unit
    type: File
  inputModule251:
    id: inputModule251
    doc: Python implementation unit
    type: File
  inputModule252:
    id: inputModule252
    doc: Python implementation unit
    type: File
  inputModule253:
    id: inputModule253
    doc: Python implementation unit
    type: File
  inputModule254:
    id: inputModule254
    doc: Python implementation unit
    type: File
  inputModule255:
    id: inputModule255
    doc: Python implementation unit
    type: File
  inputModule256:
    id: inputModule256
    doc: Python implementation unit
    type: File
  inputModule257:
    id: inputModule257
    doc: Python implementation unit
    type: File
  inputModule258:
    id: inputModule258
    doc: Python implementation unit
    type: File
  inputModule259:
    id: inputModule259
    doc: Python implementation unit
    type: File
  inputModule260:
    id: inputModule260
    doc: Python implementation unit
    type: File
  inputModule261:
    id: inputModule261
    doc: Python implementation unit
    type: File
  inputModule262:
    id: inputModule262
    doc: Python implementation unit
    type: File
  inputModule263:
    id: inputModule263
    doc: Python implementation unit
    type: File
  inputModule264:
    id: inputModule264
    doc: Python implementation unit
    type: File
  inputModule265:
    id: inputModule265
    doc: Python implementation unit
    type: File
  inputModule266:
    id: inputModule266
    doc: Python implementation unit
    type: File
  inputModule267:
    id: inputModule267
    doc: Python implementation unit
    type: File
  inputModule268:
    id: inputModule268
    doc: Python implementation unit
    type: File
  inputModule269:
    id: inputModule269
    doc: Python implementation unit
    type: File
  inputModule270:
    id: inputModule270
    doc: Python implementation unit
    type: File
  inputModule271:
    id: inputModule271
    doc: Python implementation unit
    type: File
  inputModule272:
    id: inputModule272
    doc: Python implementation unit
    type: File
  inputModule273:
    id: inputModule273
    doc: Python implementation unit
    type: File
  inputModule274:
    id: inputModule274
    doc: Python implementation unit
    type: File
  inputModule275:
    id: inputModule275
    doc: Python implementation unit
    type: File
  inputModule276:
    id: inputModule276
    doc: Python implementation unit
    type: File
  inputModule277:
    id: inputModule277
    doc: Python implementation unit
    type: File
  inputModule278:
    id: inputModule278
    doc: Python implementation unit
    type: File
  inputModule279:
    id: inputModule279
    doc: Python implementation unit
    type: File
  inputModule280:
    id: inputModule280
    doc: Python implementation unit
    type: File
  inputModule281:
    id: inputModule281
    doc: Python implementation unit
    type: File
  inputModule282:
    id: inputModule282
    doc: Python implementation unit
    type: File
  inputModule283:
    id: inputModule283
    doc: Python implementation unit
    type: File
  inputModule284:
    id: inputModule284
    doc: Python implementation unit
    type: File
  inputModule285:
    id: inputModule285
    doc: Python implementation unit
    type: File
  inputModule286:
    id: inputModule286
    doc: Python implementation unit
    type: File
  inputModule287:
    id: inputModule287
    doc: Python implementation unit
    type: File
  inputModule288:
    id: inputModule288
    doc: Python implementation unit
    type: File
  inputModule289:
    id: inputModule289
    doc: Python implementation unit
    type: File
  inputModule290:
    id: inputModule290
    doc: Python implementation unit
    type: File
  inputModule291:
    id: inputModule291
    doc: Python implementation unit
    type: File
  inputModule292:
    id: inputModule292
    doc: Python implementation unit
    type: File
  inputModule293:
    id: inputModule293
    doc: Python implementation unit
    type: File
  inputModule294:
    id: inputModule294
    doc: Python implementation unit
    type: File
  inputModule295:
    id: inputModule295
    doc: Python implementation unit
    type: File
  inputModule296:
    id: inputModule296
    doc: Python implementation unit
    type: File
  inputModule297:
    id: inputModule297
    doc: Python implementation unit
    type: File
  inputModule298:
    id: inputModule298
    doc: Python implementation unit
    type: File
  inputModule299:
    id: inputModule299
    doc: Python implementation unit
    type: File
  inputModule300:
    id: inputModule300
    doc: Python implementation unit
    type: File
  inputModule301:
    id: inputModule301
    doc: Python implementation unit
    type: File
  inputModule302:
    id: inputModule302
    doc: Python implementation unit
    type: File
  inputModule303:
    id: inputModule303
    doc: Python implementation unit
    type: File
  inputModule304:
    id: inputModule304
    doc: Python implementation unit
    type: File
  inputModule305:
    id: inputModule305
    doc: Python implementation unit
    type: File
  inputModule306:
    id: inputModule306
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
