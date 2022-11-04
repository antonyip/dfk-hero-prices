-- Table: public.hero_stats

-- DROP TABLE IF EXISTS public.hero_stats;

CREATE TABLE IF NOT EXISTS public.hero_stats
(
    auctionid bigint NOT NULL,
    gen integer,
    class integer,
    level integer,
    subclass integer,
    profession integer,
    rarity integer,
    summons integer,
    CONSTRAINT hero_stats_pkey PRIMARY KEY (auctionid)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.hero_stats
    OWNER to postgres;