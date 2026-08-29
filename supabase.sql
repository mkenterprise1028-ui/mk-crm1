-- MK Enterprises Tables

-- 1. Projects Table
create table projects (
  scheme_no text primary key,
  project_name text not null,
  location text,
  type text,
  category text
);

-- 2. Enquiries Table
create table enquiries (
  enquiry_id text primary key,
  created_at timestamp default now(),
  customer_name text not null,
  mobile text not null,
  alternate_mobile text,
  address text,
  city text,
  service_type text,
  scheme_no text references projects(scheme_no), -- Foreign key updated to scheme_no
  configuration text,
  budget_range text,
  lead_source text,
  lead_status text,
  assigned_to text,
  next_followup date,
  notes text,
  total_fee int default 0,
  paid_amount int default 0,
  balance int generated always as (total_fee - paid_amount) stored -- Auto-calculated balance
);

-- 3. Installments Table
create table installments (
  id uuid primary key default gen_random_uuid(),
  enquiry_id text references enquiries(enquiry_id) on delete cascade,
  due_date date,
  amount int,
  paid_amount int default 0,
  status text,
  mode text
);

-- Sample Data Insertions
insert into projects (scheme_no, project_name, location, type, category) 
values ('964-A', 'Sarita Niketan', 'Manjari Khurd', '1 BHK', 'EWS');

insert into projects (scheme_no, project_name, location, type, category) 
values ('881-B', 'Life Republic', 'Jambhe', '2 BHK', 'LIG');
