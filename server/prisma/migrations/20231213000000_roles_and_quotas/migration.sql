-- AlterTable: Añadir campos de roles y cuotas a la tabla users
ALTER TABLE "users" 
ADD COLUMN IF NOT EXISTS "role" TEXT NOT NULL DEFAULT 'default',
ADD COLUMN IF NOT EXISTS "daily_chat_limit" INTEGER DEFAULT NULL,
ADD COLUMN IF NOT EXISTS "monthly_chat_limit" INTEGER DEFAULT NULL;

-- CreateIndex: Índice para búsqueda rápida por rol
CREATE INDEX IF NOT EXISTS "users_role_idx" ON "users"("role");

-- CreateTable: Tabla para registrar el uso de chat
CREATE TABLE IF NOT EXISTS "chat_usage" (
    "id" SERIAL PRIMARY KEY,
    "user_id" INTEGER NOT NULL,
    "chat_count" INTEGER NOT NULL DEFAULT 0,
    "period_start" TIMESTAMP NOT NULL,
    "period_end" TIMESTAMP NOT NULL,
    "created_at" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "chat_usage_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE
);

-- CreateIndex: Índices para la tabla chat_usage
CREATE INDEX IF NOT EXISTS "chat_usage_user_id_idx" ON "chat_usage"("user_id");
CREATE INDEX IF NOT EXISTS "chat_usage_period_idx" ON "chat_usage"("period_start", "period_end");

-- Trigger para actualizar updated_at
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_chat_usage_updated_at
    BEFORE UPDATE ON chat_usage
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- Insertar roles por defecto si no existen
INSERT INTO "users" ("username", "password", "role")
SELECT 'admin', 'CHANGE_THIS_PASSWORD', 'admin'
WHERE NOT EXISTS (
    SELECT 1 FROM "users" WHERE "role" = 'admin'
) LIMIT 1;
