
--remove tables
DO $$ 
BEGIN
    -- Loop through all tables in the current schema
    EXECUTE (
        SELECT string_agg('DROP TABLE IF EXISTS ' || table_schema || '.' || table_name || ' CASCADE;', ' ')
        FROM information_schema.tables
        WHERE table_schema = 'public'
    );
END $$;

-- remove triggers
DO $$
DECLARE
    trigger_name TEXT;
    table_name TEXT;
BEGIN
    FOR trigger_name, table_name IN
        SELECT tgname, relname
        FROM pg_trigger
        JOIN pg_class ON pg_trigger.tgrelid = pg_class.oid
        WHERE pg_trigger.tgisinternal = FALSE
    LOOP
        EXECUTE 'DROP TRIGGER IF EXISTS ' || trigger_name || ' ON ' || table_name || ';';
    END LOOP;
END $$;

-- remove extension uuid
DROP EXTENSION IF EXISTS "uuid-ossp" CASCADE;

-- remove functions
DO $$
DECLARE
    func_name TEXT;
    func_signature TEXT;
BEGIN
    FOR func_name, func_signature IN
        SELECT p.proname, pg_get_function_identity_arguments(p.oid)
        FROM pg_proc p
        JOIN pg_namespace n ON p.pronamespace = n.oid
        WHERE n.nspname = 'public'
    LOOP
        EXECUTE 'DROP FUNCTION IF EXISTS public.' || func_name || '(' || func_signature || ');';
    END LOOP;
END $$;

