-- Out-of-state volunteer counts for 2024 battleground state events

-- FLORIDA
SELECT
  'FL' AS target_event_state,
  UPPER(ca.state) AS volunteer_home_state,
  COUNT(DISTINCT ea.myv_van_id) AS out_of_state_volunteer_count
FROM `demsflsp.vansync_derived.event_attendees` ea
LEFT JOIN `demsflsp.vansync.person_records_myc` pr
  ON ea.myv_van_id = pr.myv_van_id
LEFT JOIN `demsflsp.vansync.contacts_addresses_myc` ca
  ON pr.contacts_address_id = ca.contacts_address_id
WHERE ea.myv_van_id IS NOT NULL
  AND ea.mrr_status_name = 'Completed'
  AND ea.event_type_name IN ('Canvass','GOTV','Phone Bank','Digital Outreach','Text Bank')
  AND ea.volunteer_activity_name IN ('Canvasser','Phonebanker','Dialer','Textbanker')
  AND UPPER(ca.state) IS NOT NULL
  AND UPPER(ca.state) != 'FL'
GROUP BY volunteer_home_state

UNION ALL

-- ARIZONA
SELECT
  'AZ' AS target_event_state,
  UPPER(ca.state) AS volunteer_home_state,
  COUNT(DISTINCT ea.myv_van_id) AS out_of_state_volunteer_count
FROM `demsazsp.vansync_derived.event_attendees` ea
LEFT JOIN `demsazsp.vansync.person_records_myc` pr
  ON ea.myv_van_id = pr.myv_van_id
LEFT JOIN `demsazsp.vansync.contacts_addresses_myc` ca
  ON pr.contacts_address_id = ca.contacts_address_id
WHERE ea.myv_van_id IS NOT NULL
  AND ea.mrr_status_name = 'Completed'
  AND ea.event_type_name IN ('Canvass','GOTV','Phone Bank','Digital Outreach','Text Bank')
  AND ea.volunteer_activity_name IN ('Canvasser','Phonebanker','Dialer','Textbanker')
  AND UPPER(ca.state) IS NOT NULL
  AND UPPER(ca.state) != 'AZ'
GROUP BY volunteer_home_state

UNION ALL

-- GEORGIA
SELECT
  'GA' AS target_event_state,
  UPPER(ca.state) AS volunteer_home_state,
  COUNT(DISTINCT ea.myv_van_id) AS out_of_state_volunteer_count
FROM `demsgasp.vansync_derived.event_attendees` ea
LEFT JOIN `demsgasp.vansync.person_records_myc` pr
  ON ea.myv_van_id = pr.myv_van_id
LEFT JOIN `demsgasp.vansync.contacts_addresses_myc` ca
  ON pr.contacts_address_id = ca.contacts_address_id
WHERE ea.myv_van_id IS NOT NULL
  AND ea.mrr_status_name = 'Completed'
  AND ea.event_type_name IN ('Canvass','GOTV','Phone Bank','Digital Outreach','Text Bank')
  AND ea.volunteer_activity_name IN ('Canvasser','Phonebanker','Dialer','Textbanker')
  AND UPPER(ca.state) IS NOT NULL
  AND UPPER(ca.state) != 'GA'
GROUP BY volunteer_home_state

UNION ALL

-- MICHIGAN
SELECT
  'MI' AS target_event_state,
  UPPER(ca.state) AS volunteer_home_state,
  COUNT(DISTINCT ea.myv_van_id) AS out_of_state_volunteer_count
FROM `demsmisp.vansync_derived.event_attendees` ea
LEFT JOIN `demsmisp.vansync.person_records_myc` pr
  ON ea.myv_van_id = pr.myv_van_id
LEFT JOIN `demsmisp.vansync.contacts_addresses_myc` ca
  ON pr.contacts_address_id = ca.contacts_address_id
WHERE ea.myv_van_id IS NOT NULL
  AND ea.mrr_status_name = 'Completed'
  AND ea.event_type_name IN ('Canvass','GOTV','Phone Bank','Digital Outreach','Text Bank')
  AND ea.volunteer_activity_name IN ('Canvasser','Phonebanker','Dialer','Textbanker')
  AND UPPER(ca.state) IS NOT NULL
  AND UPPER(ca.state) != 'MI'
GROUP BY volunteer_home_state

UNION ALL

-- NORTH CAROLINA
SELECT
  'NC' AS target_event_state,
  UPPER(ca.state) AS volunteer_home_state,
  COUNT(DISTINCT ea.myv_van_id) AS out_of_state_volunteer_count
FROM `demsncsp.vansync_derived.event_attendees` ea
LEFT JOIN `demsncsp.vansync.person_records_myc` pr
  ON ea.myv_van_id = pr.myv_van_id
LEFT JOIN `demsncsp.vansync.contacts_addresses_myc` ca
  ON pr.contacts_address_id = ca.contacts_address_id
WHERE ea.myv_van_id IS NOT NULL
  AND ea.mrr_status_name = 'Completed'
  AND ea.event_type_name IN ('Canvass','GOTV','Phone Bank','Digital Outreach','Text Bank')
  AND ea.volunteer_activity_name IN ('Canvasser','Phonebanker','Dialer','Textbanker')
  AND UPPER(ca.state) IS NOT NULL
  AND UPPER(ca.state) != 'NC'
GROUP BY volunteer_home_state

UNION ALL

-- NEVADA
SELECT
  'NV' AS target_event_state,
  UPPER(ca.state) AS volunteer_home_state,
  COUNT(DISTINCT ea.myv_van_id) AS out_of_state_volunteer_count
FROM `demsnvsp.vansync_derived.event_attendees` ea
LEFT JOIN `demsnvsp.vansync.person_records_myc` pr
  ON ea.myv_van_id = pr.myv_van_id
LEFT JOIN `demsnvsp.vansync.contacts_addresses_myc` ca
  ON pr.contacts_address_id = ca.contacts_address_id
WHERE ea.myv_van_id IS NOT NULL
  AND ea.mrr_status_name = 'Completed'
  AND ea.event_type_name IN ('Canvass','GOTV','Phone Bank','Digital Outreach','Text Bank')
  AND ea.volunteer_activity_name IN ('Canvasser','Phonebanker','Dialer','Textbanker')
  AND UPPER(ca.state) IS NOT NULL
  AND UPPER(ca.state) != 'NV'
GROUP BY volunteer_home_state

UNION ALL

-- PENNSYLVANIA
SELECT
  'PA' AS target_event_state,
  UPPER(ca.state) AS volunteer_home_state,
  COUNT(DISTINCT ea.myv_van_id) AS out_of_state_volunteer_count
FROM `demspasp.vansync_derived.event_attendees` ea
LEFT JOIN `demspasp.vansync.person_records_myc` pr
  ON ea.myv_van_id = pr.myv_van_id
LEFT JOIN `demspasp.vansync.contacts_addresses_myc` ca
  ON pr.contacts_address_id = ca.contacts_address_id
WHERE ea.myv_van_id IS NOT NULL
  AND ea.mrr_status_name = 'Completed'
  AND ea.event_type_name IN ('Canvass','GOTV','Phone Bank','Digital Outreach','Text Bank')
  AND ea.volunteer_activity_name IN ('Canvasser','Phonebanker','Dialer','Textbanker')
  AND UPPER(ca.state) IS NOT NULL
  AND UPPER(ca.state) != 'PA'
GROUP BY volunteer_home_state

UNION ALL

-- WISCONSIN
SELECT
  'WI' AS target_event_state,
  UPPER(ca.state) AS volunteer_home_state,
  COUNT(DISTINCT ea.myv_van_id) AS out_of_state_volunteer_count
FROM `demswisp.vansync_derived.event_attendees` ea
LEFT JOIN `demswisp.vansync.person_records_myc` pr
  ON ea.myv_van_id = pr.myv_van_id
LEFT JOIN `demswisp.vansync.contacts_addresses_myc` ca
  ON pr.contacts_address_id = ca.contacts_address_id
WHERE ea.myv_van_id IS NOT NULL
  AND ea.mrr_status_name = 'Completed'
  AND ea.event_type_name IN ('Canvass','GOTV','Phone Bank','Digital Outreach','Text Bank')
  AND ea.volunteer_activity_name IN ('Canvasser','Phonebanker','Dialer','Textbanker')
  AND UPPER(ca.state) IS NOT NULL
  AND UPPER(ca.state) != 'WI'
GROUP BY volunteer_home_state
