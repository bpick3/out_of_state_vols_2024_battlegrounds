SELECT
  ea.myv_van_id,
  pr.first_name,
  pr.last_name,
  ca.address,
  ca.city,
  ca.state AS volunteer_home_state,
  ca.zip,
  ce.email,
  cp.phone_number,
  ea.event_type_name,
  ea.volunteer_activity_name,
  ea.attended_date
FROM `demsncsp.vansync_derived.event_attendees` ea -- Update state code
LEFT JOIN `demsncsp.vansync.person_records_myc` pr -- Update state code
  ON ea.myv_van_id = pr.myv_van_id
LEFT JOIN `demsncsp.vansync.contacts_addresses_myc` ca -- Update state code
  ON pr.contacts_address_id = ca.contacts_address_id
LEFT JOIN (
  SELECT myc_van_id, email,
         ROW_NUMBER() OVER (PARTITION BY myc_van_id ORDER BY datetime_created DESC) AS rn
  FROM `demsncsp.vansync.contacts_emails_myc` -- Update state code
  WHERE datetime_suppressed IS NULL AND email IS NOT NULL
) ce
  ON pr.myc_van_id = ce.myc_van_id AND ce.rn = 1
LEFT JOIN `demsncsp.vansync.contacts_phones_myc` cp -- Update state code
  ON pr.phone_id = cp.contacts_phone_id
WHERE ea.myv_van_id IS NOT NULL
  AND ea.mrr_status_name = 'Completed'
  AND ea.event_type_name IN ('Canvass','GOTV','Phone Bank','Digital Outreach','Text Bank')
  AND ea.volunteer_activity_name IN ('Canvasser','Phonebanker','Dialer','Textbanker')
  AND EXTRACT(YEAR FROM ea.attended_date) = 2024 -- Update year as needed
