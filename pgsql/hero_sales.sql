-- Table: public.hero_sales

-- DROP TABLE IF EXISTS public.hero_sales;

CREATE TABLE IF NOT EXISTS public.hero_sales
(
    "timestamp" timestamp without time zone,
    heroid bigint,
    auctionid bigint,
    price bigint,
    winner bigint
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.hero_sales
    OWNER to postgres;