-- Out-of-state volunteers with event counts and multi-state indicator w/ list of states

WITH all_vols AS (
-- FL
  SELECT
    'FL' AS target_event_state,
    base.myv_van_id,
    base.first_name,
    base.last_name,
    base.volunteer_home_state,
    base.email,
    base.phone_number,
    COUNT(DISTINCT base.event_id) AS event_count
  FROM (
    SELECT
      ea.event_id,
      ea.myv_van_id,
      pr.first_name,
      pr.last_name,
      ca.state AS volunteer_home_state,
      email.email,
      phone.phone_number
    FROM `demsflsp.vansync_derived.event_attendees` ea
    LEFT JOIN `demsflsp.vansync.person_records_myc` pr
      ON ea.myv_van_id = pr.myv_van_id
    LEFT JOIN `demsflsp.vansync.contacts_addresses_myc` ca
      ON pr.contacts_address_id = ca.contacts_address_id
    LEFT JOIN (
      SELECT myc_van_id, email,
             ROW_NUMBER() OVER (PARTITION BY myc_van_id ORDER BY datetime_created DESC) AS rn
      FROM `demsflsp.vansync.contacts_emails_myc`
      WHERE datetime_suppressed IS NULL AND email IS NOT NULL
    ) email ON pr.myc_van_id = email.myc_van_id AND email.rn = 1
    LEFT JOIN `demsflsp.vansync.contacts_phones_myc` phone
      ON pr.phone_id = phone.contacts_phone_id
    WHERE ea.myv_van_id IS NOT NULL
      AND ea.mrr_status_name = 'Completed'
      AND ea.event_type_name IN ('Canvass','GOTV','Phone Bank','Digital Outreach','Text Bank')
      AND ea.volunteer_activity_name IN ('Canvasser','Phonebanker','Dialer','Textbanker')
      AND ca.state IS NOT NULL
      AND UPPER(ca.state) != 'FL'
      AND EXTRACT(YEAR FROM ea.attended_date) = 2024
  ) base
  GROUP BY base.myv_van_id, base.first_name, base.last_name, base.volunteer_home_state, base.email, base.phone_number
UNION ALL

-- AZ
  SELECT
    'AZ' AS target_event_state,
    base.myv_van_id,
    base.first_name,
    base.last_name,
    base.volunteer_home_state,
    base.email,
    base.phone_number,
    COUNT(DISTINCT base.event_id) AS event_count
  FROM (
    SELECT
      ea.event_id,
      ea.myv_van_id,
      pr.first_name,
      pr.last_name,
      ca.state AS volunteer_home_state,
      email.email,
      phone.phone_number
    FROM `demsazsp.vansync_derived.event_attendees` ea
    LEFT JOIN `demsazsp.vansync.person_records_myc` pr
      ON ea.myv_van_id = pr.myv_van_id
    LEFT JOIN `demsazsp.vansync.contacts_addresses_myc` ca
      ON pr.contacts_address_id = ca.contacts_address_id
    LEFT JOIN (
      SELECT myc_van_id, email,
             ROW_NUMBER() OVER (PARTITION BY myc_van_id ORDER BY datetime_created DESC) AS rn
      FROM `demsazsp.vansync.contacts_emails_myc`
      WHERE datetime_suppressed IS NULL AND email IS NOT NULL
    ) email ON pr.myc_van_id = email.myc_van_id AND email.rn = 1
    LEFT JOIN `demsazsp.vansync.contacts_phones_myc` phone
      ON pr.phone_id = phone.contacts_phone_id
    WHERE ea.myv_van_id IS NOT NULL
      AND ea.mrr_status_name = 'Completed'
      AND ea.event_type_name IN ('Canvass','GOTV','Phone Bank','Digital Outreach','Text Bank')
      AND ea.volunteer_activity_name IN ('Canvasser','Phonebanker','Dialer','Textbanker')
      AND ca.state IS NOT NULL
      AND UPPER(ca.state) != 'AZ'
      AND EXTRACT(YEAR FROM ea.attended_date) = 2024
  ) base
  GROUP BY base.myv_van_id, base.first_name, base.last_name, base.volunteer_home_state, base.email, base.phone_number
UNION ALL

-- GA
  SELECT
    'GA' AS target_event_state,
    base.myv_van_id,
    base.first_name,
    base.last_name,
    base.volunteer_home_state,
    base.email,
    base.phone_number,
    COUNT(DISTINCT base.event_id) AS event_count
  FROM (
    SELECT
      ea.event_id,
      ea.myv_van_id,
      pr.first_name,
      pr.last_name,
      ca.state AS volunteer_home_state,
      email.email,
      phone.phone_number
    FROM `demsgasp.vansync_derived.event_attendees` ea
    LEFT JOIN `demsgasp.vansync.person_records_myc` pr
      ON ea.myv_van_id = pr.myv_van_id
    LEFT JOIN `demsgasp.vansync.contacts_addresses_myc` ca
      ON pr.contacts_address_id = ca.contacts_address_id
    LEFT JOIN (
      SELECT myc_van_id, email,
             ROW_NUMBER() OVER (PARTITION BY myc_van_id ORDER BY datetime_created DESC) AS rn
      FROM `demsgasp.vansync.contacts_emails_myc`
      WHERE datetime_suppressed IS NULL AND email IS NOT NULL
    ) email ON pr.myc_van_id = email.myc_van_id AND email.rn = 1
    LEFT JOIN `demsgasp.vansync.contacts_phones_myc` phone
      ON pr.phone_id = phone.contacts_phone_id
    WHERE ea.myv_van_id IS NOT NULL
      AND ea.mrr_status_name = 'Completed'
      AND ea.event_type_name IN ('Canvass','GOTV','Phone Bank','Digital Outreach','Text Bank')
      AND ea.volunteer_activity_name IN ('Canvasser','Phonebanker','Dialer','Textbanker')
      AND ca.state IS NOT NULL
      AND UPPER(ca.state) != 'GA'
      AND EXTRACT(YEAR FROM ea.attended_date) = 2024
  ) base
  GROUP BY base.myv_van_id, base.first_name, base.last_name, base.volunteer_home_state, base.email, base.phone_number
UNION ALL

-- MI
  SELECT
    'MI' AS target_event_state,
    base.myv_van_id,
    base.first_name,
    base.last_name,
    base.volunteer_home_state,
    base.email,
    base.phone_number,
    COUNT(DISTINCT base.event_id) AS event_count
  FROM (
    SELECT
      ea.event_id,
      ea.myv_van_id,
      pr.first_name,
      pr.last_name,
      ca.state AS volunteer_home_state,
      email.email,
      phone.phone_number
    FROM `demsmisp.vansync_derived.event_attendees` ea
    LEFT JOIN `demsmisp.vansync.person_records_myc` pr
      ON ea.myv_van_id = pr.myv_van_id
    LEFT JOIN `demsmisp.vansync.contacts_addresses_myc` ca
      ON pr.contacts_address_id = ca.contacts_address_id
    LEFT JOIN (
      SELECT myc_van_id, email,
             ROW_NUMBER() OVER (PARTITION BY myc_van_id ORDER BY datetime_created DESC) AS rn
      FROM `demsmisp.vansync.contacts_emails_myc`
      WHERE datetime_suppressed IS NULL AND email IS NOT NULL
    ) email ON pr.myc_van_id = email.myc_van_id AND email.rn = 1
    LEFT JOIN `demsmisp.vansync.contacts_phones_myc` phone
      ON pr.phone_id = phone.contacts_phone_id
    WHERE ea.myv_van_id IS NOT NULL
      AND ea.mrr_status_name = 'Completed'
      AND ea.event_type_name IN ('Canvass','GOTV','Phone Bank','Digital Outreach','Text Bank')
      AND ea.volunteer_activity_name IN ('Canvasser','Phonebanker','Dialer','Textbanker')
      AND ca.state IS NOT NULL
      AND UPPER(ca.state) != 'MI'
      AND EXTRACT(YEAR FROM ea.attended_date) = 2024
  ) base
  GROUP BY base.myv_van_id, base.first_name, base.last_name, base.volunteer_home_state, base.email, base.phone_number
UNION ALL

-- NC
  SELECT
    'NC' AS target_event_state,
    base.myv_van_id,
    base.first_name,
    base.last_name,
    base.volunteer_home_state,
    base.email,
    base.phone_number,
    COUNT(DISTINCT base.event_id) AS event_count
  FROM (
    SELECT
      ea.event_id,
      ea.myv_van_id,
      pr.first_name,
      pr.last_name,
      ca.state AS volunteer_home_state,
      email.email,
      phone.phone_number
    FROM `demsncsp.vansync_derived.event_attendees` ea
    LEFT JOIN `demsncsp.vansync.person_records_myc` pr
      ON ea.myv_van_id = pr.myv_van_id
    LEFT JOIN `demsncsp.vansync.contacts_addresses_myc` ca
      ON pr.contacts_address_id = ca.contacts_address_id
    LEFT JOIN (
      SELECT myc_van_id, email,
             ROW_NUMBER() OVER (PARTITION BY myc_van_id ORDER BY datetime_created DESC) AS rn
      FROM `demsncsp.vansync.contacts_emails_myc`
      WHERE datetime_suppressed IS NULL AND email IS NOT NULL
    ) email ON pr.myc_van_id = email.myc_van_id AND email.rn = 1
    LEFT JOIN `demsncsp.vansync.contacts_phones_myc` phone
      ON pr.phone_id = phone.contacts_phone_id
    WHERE ea.myv_van_id IS NOT NULL
      AND ea.mrr_status_name = 'Completed'
      AND ea.event_type_name IN ('Canvass','GOTV','Phone Bank','Digital Outreach','Text Bank')
      AND ea.volunteer_activity_name IN ('Canvasser','Phonebanker','Dialer','Textbanker')
      AND ca.state IS NOT NULL
      AND UPPER(ca.state) != 'NC'
      AND EXTRACT(YEAR FROM ea.attended_date) = 2024
  ) base
  GROUP BY base.myv_van_id, base.first_name, base.last_name, base.volunteer_home_state, base.email, base.phone_number
UNION ALL

-- NV
  SELECT
    'NV' AS target_event_state,
    base.myv_van_id,
    base.first_name,
    base.last_name,
    base.volunteer_home_state,
    base.email,
    base.phone_number,
    COUNT(DISTINCT base.event_id) AS event_count
  FROM (
    SELECT
      ea.event_id,
      ea.myv_van_id,
      pr.first_name,
      pr.last_name,
      ca.state AS volunteer_home_state,
      email.email,
      phone.phone_number
    FROM `demsnvsp.vansync_derived.event_attendees` ea
    LEFT JOIN `demsnvsp.vansync.person_records_myc` pr
      ON ea.myv_van_id = pr.myv_van_id
    LEFT JOIN `demsnvsp.vansync.contacts_addresses_myc` ca
      ON pr.contacts_address_id = ca.contacts_address_id
    LEFT JOIN (
      SELECT myc_van_id, email,
             ROW_NUMBER() OVER (PARTITION BY myc_van_id ORDER BY datetime_created DESC) AS rn
      FROM `demsnvsp.vansync.contacts_emails_myc`
      WHERE datetime_suppressed IS NULL AND email IS NOT NULL
    ) email ON pr.myc_van_id = email.myc_van_id AND email.rn = 1
    LEFT JOIN `demsnvsp.vansync.contacts_phones_myc` phone
      ON pr.phone_id = phone.contacts_phone_id
    WHERE ea.myv_van_id IS NOT NULL
      AND ea.mrr_status_name = 'Completed'
      AND ea.event_type_name IN ('Canvass','GOTV','Phone Bank','Digital Outreach','Text Bank')
      AND ea.volunteer_activity_name IN ('Canvasser','Phonebanker','Dialer','Textbanker')
      AND ca.state IS NOT NULL
      AND UPPER(ca.state) != 'NV'
      AND EXTRACT(YEAR FROM ea.attended_date) = 2024
  ) base
  GROUP BY base.myv_van_id, base.first_name, base.last_name, base.volunteer_home_state, base.email, base.phone_number
UNION ALL

-- PA
  SELECT
    'PA' AS target_event_state,
    base.myv_van_id,
    base.first_name,
    base.last_name,
    base.volunteer_home_state,
    base.email,
    base.phone_number,
    COUNT(DISTINCT base.event_id) AS event_count
  FROM (
    SELECT
      ea.event_id,
      ea.myv_van_id,
      pr.first_name,
      pr.last_name,
      ca.state AS volunteer_home_state,
      email.email,
      phone.phone_number
    FROM `demspasp.vansync_derived.event_attendees` ea
    LEFT JOIN `demspasp.vansync.person_records_myc` pr
      ON ea.myv_van_id = pr.myv_van_id
    LEFT JOIN `demspasp.vansync.contacts_addresses_myc` ca
      ON pr.contacts_address_id = ca.contacts_address_id
    LEFT JOIN (
      SELECT myc_van_id, email,
             ROW_NUMBER() OVER (PARTITION BY myc_van_id ORDER BY datetime_created DESC) AS rn
      FROM `demspasp.vansync.contacts_emails_myc`
      WHERE datetime_suppressed IS NULL AND email IS NOT NULL
    ) email ON pr.myc_van_id = email.myc_van_id AND email.rn = 1
    LEFT JOIN `demspasp.vansync.contacts_phones_myc` phone
      ON pr.phone_id = phone.contacts_phone_id
    WHERE ea.myv_van_id IS NOT NULL
      AND ea.mrr_status_name = 'Completed'
      AND ea.event_type_name IN ('Canvass','GOTV','Phone Bank','Digital Outreach','Text Bank')
      AND ea.volunteer_activity_name IN ('Canvasser','Phonebanker','Dialer','Textbanker')
      AND ca.state IS NOT NULL
      AND UPPER(ca.state) != 'PA'
      AND EXTRACT(YEAR FROM ea.attended_date) = 2024
  ) base
  GROUP BY base.myv_van_id, base.first_name, base.last_name, base.volunteer_home_state, base.email, base.phone_number
UNION ALL

-- WI
  SELECT
    'WI' AS target_event_state,
    base.myv_van_id,
    base.first_name,
    base.last_name,
    base.volunteer_home_state,
    base.email,
    base.phone_number,
    COUNT(DISTINCT base.event_id) AS event_count
  FROM (
    SELECT
      ea.event_id,
      ea.myv_van_id,
      pr.first_name,
      pr.last_name,
      ca.state AS volunteer_home_state,
      email.email,
      phone.phone_number
    FROM `demswisp.vansync_derived.event_attendees` ea
    LEFT JOIN `demswisp.vansync.person_records_myc` pr
      ON ea.myv_van_id = pr.myv_van_id
    LEFT JOIN `demswisp.vansync.contacts_addresses_myc` ca
      ON pr.contacts_address_id = ca.contacts_address_id
    LEFT JOIN (
      SELECT myc_van_id, email,
             ROW_NUMBER() OVER (PARTITION BY myc_van_id ORDER BY datetime_created DESC) AS rn
      FROM `demswisp.vansync.contacts_emails_myc`
      WHERE datetime_suppressed IS NULL AND email IS NOT NULL
    ) email ON pr.myc_van_id = email.myc_van_id AND email.rn = 1
    LEFT JOIN `demswisp.vansync.contacts_phones_myc` phone
      ON pr.phone_id = phone.contacts_phone_id
    WHERE ea.myv_van_id IS NOT NULL
      AND ea.mrr_status_name = 'Completed'
      AND ea.event_type_name IN ('Canvass','GOTV','Phone Bank','Digital Outreach','Text Bank')
      AND ea.volunteer_activity_name IN ('Canvasser','Phonebanker','Dialer','Textbanker')
      AND ca.state IS NOT NULL
      AND UPPER(ca.state) != 'WI'
      AND EXTRACT(YEAR FROM ea.attended_date) = 2024
  ) base
  GROUP BY base.myv_van_id, base.first_name, base.last_name, base.volunteer_home_state, base.email, base.phone_number
),

states_per_volunteer AS (
  SELECT
    myv_van_id,
    ARRAY_TO_STRING(ARRAY_AGG(DISTINCT target_event_state), ', ') AS states_volunteered_list
  FROM all_vols
  GROUP BY myv_van_id
),

vol_counts AS (
  SELECT
    av.*,
    COUNT(DISTINCT av.target_event_state) OVER (PARTITION BY av.myv_van_id) AS states_volunteered_in,
    CASE
      WHEN COUNT(DISTINCT av.target_event_state) OVER (PARTITION BY av.myv_van_id) > 1 THEN TRUE
      ELSE FALSE
    END AS multi_state_volunteer
  FROM all_vols av
)

SELECT
  vc.*,
  spv.states_volunteered_list
FROM vol_counts vc
LEFT JOIN states_per_volunteer spv
  ON vc.myv_van_id = spv.myv_van_id
ORDER BY vc.myv_van_id, vc.target_event_state;
