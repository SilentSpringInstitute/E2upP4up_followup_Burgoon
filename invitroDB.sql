-- check table from SSI 
select count(*) from P4_up_for_database;
--283

select count(*) from E2_up_for_database;
--274

select count(*) from E2_up_for_database eufd where `Efficacy/potency` != 'borderline' AND `Efficacy/potency` != 'borderline active' AND  `Efficacy/potency` != 'hormone substrate';
-- 182

select count(*) from P4_up_for_database eufd where `Efficacy/potency` != 'borderline' AND `Efficacy/potency` != 'borderline active' AND  `Efficacy/potency` != 'hormone substrate';
--185


-- extract assay id
select * 
from assay_component
where assay_component_name LIKE '%295r%'

-- CEETOX_H295R_ESTRADIOL => acid:594
-- CEETOX_H295R_PROG => acid:597


-- get active data for E2up chemicals
select assay_component.assay_component_name, assay_component.technological_target_type_sub, chemical.chnm, chemical.casn,E2_up_for_database.`Efficacy/potency`, sample.stkc, sample.stkc_unit, mc0.apid, mc0.rowi, mc0.coli, mc0.wllt, mc0.wllq, mc0.conc, mc0.rval
from mc0
JOIN sample ON mc0.spid = sample.spid
JOIN chemical ON sample.chid = chemical.chid
JOIN E2_up_for_database on E2_up_for_database.CASRN = chemical.casn 
JOIN assay_component on assay_component.acid = mc0.acid
AND mc0.acid = 594 
AND `Efficacy/potency` != 'borderline' 
AND `Efficacy/potency` != 'borderline active' 
AND `Efficacy/potency` != 'hormone substrate'
ORDER BY chnm, conc;



-- to reproduce Burgoon dataset
select assay_component.assay_component_name, assay_component.technological_target_type_sub, chemical.chnm, chemical.casn,E2_up_for_database.`Efficacy/potency`, sample.stkc, sample.stkc_unit, mc0.apid, mc0.rowi, mc0.coli, mc0.wllt, mc0.wllq, mc0.conc, mc0.rval
from mc0
JOIN sample ON mc0.spid = sample.spid
JOIN chemical ON sample.chid = chemical.chid
JOIN E2_up_for_database on E2_up_for_database.CASRN = chemical.casn 
JOIN assay_component on assay_component.acid = mc0.acid
AND mc0.acid = 594 
AND `Efficacy/potency` != 'borderline' 
AND `Efficacy/potency` != 'borderline active' 
ORDER BY chnm, conc;
-- count 174



-- for the full set of chemicals 
select assay_component.assay_component_name, assay_component.technological_target_type_sub, chemical.chnm, chemical.casn, E2_up_for_database.`Efficacy/potency`, sample.stkc, sample.stkc_unit, mc0.apid, mc0.rowi, mc0.coli, mc0.wllt, mc0.wllq, mc0.conc, mc0.rval
from mc0
JOIN sample ON mc0.spid = sample.spid
JOIN chemical ON sample.chid = chemical.chid
JOIN E2_up_for_database on E2_up_for_database.CASRN = chemical.casn 
JOIN assay_component on assay_component.acid = mc0.acid
where (`Efficacy/potency` != 'borderline' AND `Efficacy/potency` != 'borderline active' AND mc0.acid = 594)  
OR  (`Efficacy/potency` != 'borderline' AND `Efficacy/potency` != 'borderline active' AND mc0.acid = 2031)
ORDER BY chnm, conc;


-- P4--
-- get active data for P4up chemicals
select assay_component.assay_component_name, assay_component.technological_target_type_sub, chemical.chnm, chemical.casn, P4_up_for_database.`Efficacy/potency`, sample.stkc, sample.stkc_unit, mc0.apid, mc0.rowi, mc0.coli, mc0.wllt, mc0.wllq, mc0.conc, mc0.rval
from mc0
JOIN sample ON mc0.spid = sample.spid
JOIN chemical ON sample.chid = chemical.chid
JOIN P4_up_for_database on P4_up_for_database.CASRN = chemical.casn 
JOIN assay_component on assay_component.acid = mc0.acid
AND mc0.acid = 597 
AND `Efficacy/potency` != 'borderline' 
AND `Efficacy/potency` != 'borderline active' 
AND `Efficacy/potency` != 'hormone substrate'
ORDER BY chnm, conc;
-- count 168


-- to reproduce Burgoon dataset
select assay_component.assay_component_name, assay_component.technological_target_type_sub, chemical.chnm, chemical.casn,P4_up_for_database.`Efficacy/potency`, sample.stkc, sample.stkc_unit, mc0.apid, mc0.rowi, mc0.coli, mc0.wllt, mc0.wllq, mc0.conc, mc0.rval
from mc0
JOIN sample ON mc0.spid = sample.spid
JOIN chemical ON sample.chid = chemical.chid
JOIN P4_up_for_database on P4_up_for_database.CASRN = chemical.casn 
JOIN assay_component on assay_component.acid = mc0.acid
AND mc0.acid = 597 
AND `Efficacy/potency` != 'borderline' 
AND `Efficacy/potency` != 'borderline active' 
ORDER BY chnm, conc;
-- count 176



select count(DISTINCT(chemical.casn))
from mc0
JOIN sample ON mc0.spid = sample.spid
JOIN chemical ON sample.chid = chemical.chid
JOIN assay_component on assay_component.acid = mc0.acid
AND mc0.acid = 597 
ORDER BY chnm, conc;
-- 576 without a mapping on the SSI table

-- all set of chemical count
select count(DISTINCT(chemical.casn))
from mc0
JOIN sample ON mc0.spid = sample.spid
JOIN chemical ON sample.chid = chemical.chid
JOIN assay_component on assay_component.acid = mc0.acid
WHERE mc0.acid = 597 OR mc0.acid = 2034 
ORDER BY chnm, conc;


-- if I cumulate 597 + 2034
select assay_component.assay_component_name, assay_component.technological_target_type_sub, chemical.chnm, chemical.casn, P4_up_for_database.`Efficacy/potency`, sample.stkc, sample.stkc_unit, mc0.apid, mc0.rowi, mc0.coli, mc0.wllt, mc0.wllq, mc0.conc, mc0.rval
from mc0
JOIN sample ON mc0.spid = sample.spid
JOIN chemical ON sample.chid = chemical.chid
JOIN P4_up_for_database on P4_up_for_database.CASRN = chemical.casn 
JOIN assay_component on assay_component.acid = mc0.acid
where (`Efficacy/potency` != 'borderline' AND `Efficacy/potency` != 'borderline active' AND mc0.acid = 597)  
OR  (`Efficacy/potency` != 'borderline' AND `Efficacy/potency` != 'borderline active' AND mc0.acid = 2034)
ORDER BY chnm, conc;
--192




-- pull all data for DMSO
-- E2
select mc0.spid, mc0.apid, mc0.rowi, mc0.coli, mc0.wllt, mc0.wllq, mc0.conc, mc0.rval
from mc0  
WHERE (mc0.spid = "DMSO" AND mc0.acid = 594)
OR (mc0.spid = "DMSO" AND mc0.acid = 2031);

--P4
select mc0.spid, mc0.apid, mc0.rowi, mc0.coli, mc0.wllt, mc0.wllq, mc0.conc, mc0.rval
from mc0  
WHERE (mc0.spid = "DMSO" AND mc0.acid = 597)
OR (mc0.spid = "DMSO" AND mc0.acid = 2034);



