-- =================================================================
-- FIX: Organizations Audit Trigger
-- =================================================================
-- The generic audit_trigger expects all tables to have organization_id,
-- but organizations table doesn't have this field.
-- This creates a custom audit trigger for the organizations table.

-- Step 1: Drop the existing problematic trigger
DROP TRIGGER IF EXISTS audit_organizations ON public.organizations;

-- Step 2: Create a custom audit function for organizations
CREATE OR REPLACE FUNCTION audit_trigger_organizations()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO audit_logs (
        user_id, 
        organization_id,  -- For organizations, we'll use the organization's own ID
        table_name, 
        record_id, 
        action, 
        old_data, 
        new_data
    ) VALUES (
        auth.uid(),
        CASE 
            WHEN TG_OP = 'DELETE' THEN OLD.id
            ELSE NEW.id
        END,
        TG_TABLE_NAME,
        COALESCE(NEW.id, OLD.id),
        TG_OP,
        CASE WHEN TG_OP = 'DELETE' THEN row_to_json(OLD) ELSE NULL END,
        CASE WHEN TG_OP IN ('INSERT', 'UPDATE') THEN row_to_json(NEW) ELSE NULL END
    );
    RETURN NULL;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Step 3: Create the new trigger using the custom function
CREATE TRIGGER audit_organizations
AFTER INSERT OR UPDATE OR DELETE ON public.organizations
FOR EACH ROW
EXECUTE FUNCTION audit_trigger_organizations();
