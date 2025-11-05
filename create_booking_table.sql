-- Create bookings table for dance class reservations
CREATE TABLE bookings (
  id BIGSERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  phone TEXT NOT NULL,
  dance_style TEXT NOT NULL,
  date DATE NOT NULL,
  time TIME NOT NULL,
  notes TEXT,
  booking_status TEXT DEFAULT 'pending' CHECK (booking_status IN ('pending', 'confirmed', 'cancelled')),
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Enable Row Level Security (optional but recommended)
ALTER TABLE bookings ENABLE ROW LEVEL SECURITY;

-- Create policy to allow inserts (for booking form)
CREATE POLICY "Allow anonymous bookings" ON bookings
  FOR INSERT WITH CHECK (true);

-- Create policy to allow reading (if you want to display bookings)
CREATE POLICY "Allow reading bookings" ON bookings
  FOR SELECT USING (true);

-- Create policy to allow updates (for admin status changes)
CREATE POLICY "Allow status updates" ON bookings
  FOR UPDATE USING (true);

-- If you already have the table without booking_status, run this to add the column:
-- ALTER TABLE bookings ADD COLUMN booking_status TEXT DEFAULT 'pending' CHECK (booking_status IN ('pending', 'confirmed', 'cancelled'));
