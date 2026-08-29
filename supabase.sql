
-- MK Enterprises Tables
create table projects (
  scheme_no text primary key,
  project_name text,
  location text,
  type text,
  category text
);

create table enquiries (
  enquiry_id text primary key,
  created_at timestamp default now(),
  customer_name text,
  mobile text,
  alternate_mobile text,
  address text,
  city text,
  service_type text,
  project_name text references projects(project_name),
  configuration text,
  budget_range text,
  lead_source text,
  lead_status text,
  assigned_to text,
  next_followup date,
  notes text,
  total_fee int,
  paid_amount int default 0,
  balance int
);

create table installments (
  id uuid primary key default gen_random_uuid(),
  enquiry_id text references enquiries(enquiry_id),
  due_date date,
  amount int,
  paid_amount int,
  status text,
  mode text
);

-- Insert sample MHADA projects (add your 168 list here)
insert into projects values ('964-A','Sarita Niketan','Manjari Khurd','1 BHK','EWS');
insert into projects values ('881-B','Life Republic','Jambhe','2 BHK','LIG');
