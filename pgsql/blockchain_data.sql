-- Table: public.blockchain

-- DROP TABLE IF EXISTS public.blockchain;

CREATE TABLE IF NOT EXISTS public.blockchain
(
    blockchain_data json
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.blockchain
    OWNER to postgres;