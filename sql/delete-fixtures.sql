DO $$
DECLARE
    table_name TEXT;
BEGIN
    -- Loop through all tables in the public schema
    FOR table_name IN
        SELECT t.table_name
        FROM information_schema.tables t
        WHERE t.table_schema = 'public'
    LOOP
        -- Generate and execute a TRUNCATE query for each table
        EXECUTE 'TRUNCATE TABLE public.' || table_name || ' CASCADE';
    END LOOP;
END $$;