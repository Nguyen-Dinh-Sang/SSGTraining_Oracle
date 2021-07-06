SELECT table_name 
FROM user_constraints
WHERE r_constraint_name IN (SELECT constraint_name 
                            FROM user_constraints
                            WHERE constraint_type in ('P','U')
                            AND table_name = 'NHAN_VIEN');